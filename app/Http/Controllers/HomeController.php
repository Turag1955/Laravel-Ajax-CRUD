<?php

namespace App\Http\Controllers;

use App\Models\Role;
use App\Models\User;
use App\Models\location;
use Illuminate\Http\Request;
use App\Http\Requests\UserFormRequest;
use App\Traits\uploadable;
use Illuminate\Support\Arr;

use function PHPUnit\Framework\isEmpty;

class HomeController extends Controller
{
    use uploadable;
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        // $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        $data['roles'] = Role::all();
        $data['district'] = location::where('parent_id', 0)->orderBy('location_name', 'asc')->get();
        return view('home', compact('data'));
    }

    public function userList(Request $request)
    {
        if ($request->ajax()) {
            $user = new User();

            if (!empty($request->name)) {
                $user->setName($request->name);
            }
            if (!empty($request->email)) {
                $user->setEmail($request->email);
            }
            if (!empty($request->mobile)) {
                $user->setMobile($request->mobile);
            }
            if (!empty($request->district_id)) {
                $user->setDistrict($request->district_id);
            }
            if (!empty($request->upazila_id)) {
                $user->setUpazila($request->upazila_id);
            }
            if (!empty($request->role_id)) {
                $user->setRole($request->role_id);
            }
            if (!empty($request->status)) {
                $user->setStatus($request->status);
            }

            $user->setOrderValue($request->input('order.0.column'));
            $user->setDirValue($request->input('order.0.dir'));
            $user->setLengthValue($request->input('length'));
            $user->setStartValue($request->input('start'));

            $list = $user->getlist();
            $data = [];
            $no = $request->input('start');
            foreach ($list as  $value) {
                $no++;
                $action = '';
                $action .= '<a class="dropdown-item text-success user_edit" data-id="' . $value->id . '" ><i class="fa fa-pen text-secondary"></i> Edit</a>';
                $action .= '<a class="dropdown-item text-primary user_view" data-id="' . $value->id . '" ><i class="fa fa-eye text-primary"></i> View</a>';
                $action .= '<a class="dropdown-item text-danger user_delete" data-name="' . $value->name . '"  data-id="' . $value->id . '" ><i class="fa fa-trash text-danger"></i> Delete</a>';



                $dropdown =  '<div class="dropdown">
                <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fa fa-list"></i>
                </button>
                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                ' . $action . '
                </div>
              </div>';

                $row = [];
                $row[] = '<div class="form-check">
                <input class="form-check-input select_data " name="did[]" type="checkbox" value="' . $value->id . '" id="checkbox' . $value->id . '" onchange="select_single_item(' . $value->id . ')">
                <label class="form-check-label" for="checkbox' . $value->id . '">
                
                </label>
              </div>';
                $row[] = $no;

                $row[] = $value->name;
                $row[] = $this->avartar($value->avatar, $value->name);
                $row[] = $value->role->role_name;
                $row[] = $value->email;
                $row[] = $value->mobile;
                $row[] = $value->district->location_name;
                $row[] = $value->upazila->location_name;
                $row[] = $value->postal_code;
                $row[] = $value->email_verified_at ? '<span class="badge badge-success">Varified</span>' : '<span class="badge badge-danger">UnVarified</span>';
                $row[] =  $this->status_toggle_button($value->status, $value->id);
                $row[] = $dropdown;
                $data[] = $row;
            }

            $output = array(
                "draw" => $request->input('draw'),
                "recordsTotal" => $user->count_all(),
                "recordsFilterd" => $user->count_filter(),
                "data" => $data,
            );
            //dd( $output);
            echo json_encode($output);
        }
    }

    public function view(Request $request)
    {
        if ($request->ajax()) {
            $data = User::with(['role:id,role_name', 'district:id,location_name', 'upazila:id,location_name'])->find($request->id);
            if ($data) {
                $output['user_view'] = view('user.view', compact('data'))->render();
                $output['user_name'] = $data->name;
            } else {
                $output['user_view'] = '';
                $output['user_name'] = '';
            }
            echo json_encode($output);
        }
    }

    public function delete(Request $request)
    {
        if ($request->ajax()) {
            $data = User::find($request->id);

            $avatar = $data->avatar;
            if ($data) {
                if ($data->delete()) {
                    if (!empty($avatar)) {
                        $this->delete_file($avatar, USER_AVATAR);
                    }
                    $output = ['status' => 'success', 'message' => 'data Delete success'];
                } else {
                    $output = ['status' => 'error', 'message' => 'data Not Delete'];
                }
            }
            echo json_encode($output);
        }
    }

    public function avartar($avatar = null, $name = '')
    {
        return ($avatar != '') ? '<img src="' . asset('storage/' . USER_AVATAR . $avatar) . '" alt="' . $name . '" width="50"/>' : '<img src="' . asset('storage/' . USER_AVATAR . 'unknown.png') . '" alt="' . $name . '" width="50"/>';
    }

    public function store(UserFormRequest $request)
    {
        $data = $request->validated();
        $collection = collect($data)->except(['avatar', 'cpassword']);
        if ($request->file('avatar')) {
            $avatar =  $this->uploadfile($request->file('avatar'), USER_AVATAR, $request->name);
            $collection = $collection->merge(compact('avatar'));

            if (!empty($request->old_image)) {
                $this->delete_file($request->old_image, USER_AVATAR);
            }
        }

        $result = User::updateOrCreate(['id' => $request->update_id], $collection->all());
        if ($result) {
            $output = ['status' => 'success', 'message' => 'data insert success'];
        } else {
            $output = ['status' => 'error', 'message' => 'data not insert success'];
            if (!empty($avatar)) {
                $this->delete_file($avatar, USER_AVATAR);
            }
        }

        return response()->json($output);
    }

    public function edit(Request $request)
    {
        if ($request->ajax()) {
            $data = User::toBase()->find($request->id);
            if ($data) {
                $output['user'] = $data;
            } else {
                $output['user'] = '';
            }
            // dd( $data );
            return response()->json($output);
        }
    }


    private function status_toggle_button($status, $id)
    {
        $checked = $status == 1 ? 'checked' : '';
        return '<label class="switch">
                <input class="change_status" type="checkbox" ' . $checked . '  data-id = "' . $id . '">
                <span class="slider round"></span>
                </label>';
    }

    public function status(Request $request)
    {
        if ($request->ajax()) {
            $data = User::find($request->id)->update(['status' => $request->status]);

            if ($data) {
                $output = ['status' => 'success', 'message' => 'data status change success'];
            } else {
                $output = ['status' => 'error', 'message' => 'data status change not success'];
            }

            echo json_encode($output);
        }
    }

    public function bulk_action_delete(Request $request)
    {
        if ($request->ajax()) {
            $avatar = User::toBase()->select('avatar')->whereIn('id', $request->id)->get();
            $data = User::destroy($request->id);
            if ($data) {
                if (!empty($avatar)) {
                    foreach ($avatar as $value) {
                        if (!empty($value->avatar)) {
                            $this->delete_file($value->avatar, USER_AVATAR);
                        }
                    }
                    $output = ['status' => 'success', 'message' => 'data Delete success'];
                } else {
                    $output = ['status' => 'error', 'message' => 'data Not Delete'];
                }
            }
            echo json_encode($output);
        }
    }

    public function upazila_list(Request $request)
    {
        if ($request->ajax()) {
            $output = '<option value="">Select Please</option>';
            if ($request->district_id) {
                $upazilas = location::where('parent_id', $request->district_id)->orderBy('location_name', 'asc')->get();
                if (!$upazilas->isEmpty()) {
                    foreach ($upazilas as $upazila) {
                        $output .= '<option value="' . $upazila->id . '">' . $upazila->location_name . '</option>';
                    }
                    return response()->json($output);
                }
            }
        }
    }
}
