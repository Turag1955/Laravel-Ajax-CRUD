<?php

namespace App\Models;

use App\Models\location;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\Hash;
use Illuminate\Notifications\Notifiable;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;


class User extends Authenticatable
{
    use HasFactory, Notifiable;

    const USER_VALIDATION = [
        'role_id'     => ['required', 'string'],
        'district_id' => ['required', 'string'],
        'upazila_id'  => ['required', 'string'],
        'postal_code' => ['required', 'string'],
        'name'        => ['required', 'string'],
        'email'       => ['required', 'email', 'unique:users,email'],
        'mobile'      => ['required', 'unique:users,mobile'],
        'address'     => ['required', 'string'],
        'avatar'      => ['nullable', 'image', 'mimes:jpg,png,jpeg'],

    ];
    protected $fillable = [
        'role_id', 'district_id', 'upazila_id', 'postal_code', 'name', 'email', 'mobile', 'address', 'avatar', 'status', 'password',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    public function setPasswordAttribute($vlaue)
    {
        $this->attributes['password'] = Hash::make($vlaue);
    }

    public function role()
    {
        return $this->belongsTo(Role::class);
    }
    public function district()
    {
        return $this->belongsTo(location::class, 'district_id', 'id');
    }
    public function upazila()
    {
        return $this->belongsTo(location::class, 'upazila_id', 'id');
    }

    private $order = array('users.id' => 'desc');
    private $orderColumn;

    private $orderValue;
    private $dirValue;
    private $lengthValue;
    private $startValue;

    private $name;
    private $email;
    private $mobile;
    private $district_id;
    private $upazila_id;
    private $role_id;
    private $status;



    public function setName($name)
    {
        $this->name = $name;
    }
    public function setEmail($email)
    {
        $this->email = $email;
    }
    public function setMobile($mobile)
    {
        $this->mobile = $mobile;
    }
    public function setDistrict($district_id)
    {
        $this->district_id = $district_id;
    }
    public function setUpazila($upazila_id)
    {
        $this->upazila_id = $upazila_id;
    }
    public function setRole($role_id)
    {
        $this->role_id = $role_id;
    }
    public function setStatus($status)
    {
        $this->status = $status;
    }

    public function setOrderValue($orderValue)
    {
        $this->orderValue =  $orderValue;
    }

    public function setDirValue($dirValue)
    {
        $this->dirValue =  $dirValue;
    }
    public function setLengthValue($lengthValue)
    {
        $this->lengthValue =  $lengthValue;
    }

    public function setStartValue($startValue)
    {
        $this->startValue =  $startValue;
    }

    private function get_datatable_query()
    {

        $this->orderColumn = [
            'useers.id', 'users.name', '', 'role_id',
            'users.email', 'users.mobile', 'users.district_id',
            'users.upazila_id','postal_code','users.email_verified_at',''
        ];

        $query = self::with(['role:id,role_name', 'district:id,location_name', 'upazila:id,location_name']);

        /****search query */

        if (!empty($this->name)) {
            $query->where('users.name', 'like', '%' . $this->name . '%');
        }

        if (!empty($this->email)) {
            $query->where('users.email', 'like', '%' . $this->email . '%');
        }
        if (!empty($this->mobile)) {
            $query->where('users.mobile', 'like', '%' . $this->mobile . '%');
        }
        if (!empty($this->district_id)) {
            $query->where('users.district_id', 'like', '%' . $this->district_id . '%');
        }
        if (!empty($this->upazila_id)) {
            $query->where('users.upazila_id', 'like', '%' . $this->upazila_id . '%');
        }
        if (!empty($this->role_id)) {
            $query->where('users.role_id', 'like', '%' . $this->role_id . '%');
        }
        if (!empty($this->status)) {
            $query->where('users.status_id', 'like', '%' . $this->status . '%');
        }
        if(isset($this->orderValue) && isset($this->dirValue)){
            $query->orderBy( $this->orderColumn[$this->orderValue], $this->dirValue);
        }
        else if (isset($this->order)) {
            $query->orderBy(key($this->order), $this->order[key($this->order)]);
        }
        return $query;
    }

    public function getlist()
    {
        $query = $this->get_datatable_query();
        if ($this->lengthValue != -1) {
            $query->offset($this->startValue)->limit($this->lengthValue);
        }
        return $query->get();
    }

    public function count_filter()
    {
        $query = $this->get_datatable_query();
        return $query->get()->count();
    }

    public function count_all()
    {
        return self::toBase()->get()->count();
    }
}
