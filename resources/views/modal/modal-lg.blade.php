<!-- Modal -->
<div class="modal fade" id="saveData" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
    aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel"></h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>

            </div>

            <form method="POST" id="storeData" enctype="multipart/form-data">
                @csrf
               
                <div class="modal-body">
                    <div class="row">

                        <div class="col-12">
                            <span class="text-danger">All * mark Required </span>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-8">
                            <input type="hidden" name="update_id" id="update_id">
                            <input type="hidden" name="old_image" id="old_image">
                            <x-textbox type="text" label="Name" name="name" required="required" placeholder="Enter name"
                                col="col-12" />
                            <x-textbox type="email" label="Email" name="email" required="required"
                                placeholder="Enter email" col="col-12" />
                            <x-textbox type="password" label="Password" name="password" required="required"
                                placeholder="Enter Password" col="col-12" />
                            <x-textbox type="password" label="Confirm Password" name="cpassword" required="required"
                                placeholder="Enter confirm Password" col="col-12" />
                            <x-textbox label="Mobile" name="mobile" required="required" placeholder="Enter mobile"
                                col="col-12" />

                            <x-selectbox onchange="upazila_list(this.value,'storeData')" label="District" name="district_id"
                                required="required" col="col-12">
                                @if (!$data['district']->isEmpty()){
                                    @foreach ($data['district'] as $district)
                                        <option value="{{ $district->id }}">{{ $district->location_name }}</option>
                                    @endforeach
                                    }
                                @endif
                            </x-selectbox>
                            <x-selectbox label="upazila" name="upazila_id" required="required" col="col-12" />
                            <x-textbox label="Postal Code" name="postal_code" required="required"
                                placeholder="Enter Postal Code" col="col-12" />
                            <x-textbox label="Address" name="address" required="required" placeholder="Enter Address"
                                col="col-12" />

                        </div>
                        <div class="col-4">
                            <div class="form-group">
                                <input type="file" name="avatar" id="avatar" class="dropify"   >
                            </div>
                            <x-selectbox label="Role" name="role_id" required="required" col="col-12">
                                @if (!$data['roles']->isEmpty()){
                                    @foreach ($data['roles'] as $role)
                                        <option value="{{ $role->id }}">{{ $role->role_name }}</option>
                                    @endforeach
                                    }
                                @endif
                            </x-selectbox>
                        </div>

                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary" id="save_btn"></button>
                </div>
            </form>
        </div>
    </div>
</div>
