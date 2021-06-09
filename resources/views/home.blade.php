@extends('layouts.app')

@section('content')
    
        <div class="row justify-content-center px-4">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <div class="row">
                            <div class="col-6">
                                <h3> User List</h3>
                            </div>
                            <div class="col-6 text-right">
                                <button class="btn btn-sm btn-primary float-right"
                                    onclick="showModal('Add New user','Save')">Add New</button>
                            </div>
                        </div>
                    </div>

                    <div class="card-body">
                        <form method="post" id="search_form">
                            <div class="row">
                                <x-textbox type="text" label="Name" name="name" required="required" placeholder="Enter name"
                                    col="col-4" />
                                <x-textbox type="email" label="Email" name="email" required="required"
                                    placeholder="Enter email" col="col-4" />
                                <x-textbox label="Mobile" name="mobile" required="required" placeholder="Enter mobile"
                                    col="col-4" />

                                <x-selectbox onchange="upazila_list(this.value,'search_form')" label="District" name="district_id"
                                    required="required" col="col-4">
                                    @if (!$data['district']->isEmpty()){
                                        @foreach ($data['district'] as $district)
                                            <option value="{{ $district->id }}">{{ $district->location_name }}</option>
                                        @endforeach
                                        }
                                    @endif
                                </x-selectbox>
                                
                                <x-selectbox label="upazila" name="upazila_id" required="required" col="col-4" />
                                <x-selectbox label="Role" name="role_id" required="required" col="col-4">
                                    @if (!$data['roles']->isEmpty()){
                                        @foreach ($data['roles'] as $role)
                                            <option value="{{ $role->id }}">{{ $role->role_name }}</option>
                                        @endforeach
                                        }
                                    @endif
                                </x-selectbox>
                                <div class="form-group col-4">
                                    <label for="">Status</label>
                                    <select name="status" id="status_id" class="form-control">
                                        <option value="">Select Please</option>
                                        <option value="1">Active</option>
                                        <option value="2">Inactive</option>
                                    </select>
                                </div>
                                <div class="col-4 py-4 mt-2">
                                    <button class="btn btn-success" type="button" id="search_btn_submit">Search</button>
                                    <button class="btn btn-primary" type="reset" id="search_btn_reset">Reset</button>

                                </div>
                            </div>

                        </form>
                        <div class="row">
                            <div class="col-md-12">
                                <table class="table table-bordered " id="dataTable">
                                    <thead>
                                        <th>
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" value="" id="select_all" onchange="check_select_all()">
                                                <label class="form-check-label" for="select_all"></label>
                                              </div>
                                        </th>
                                        <th>SL.</th>
                                        <th>Name</th>
                                        <th>Image</th>
                                        <th>Role</th>
                                        <th>Email</th>
                                        <th>Phone</th>
                                        <th>District</th>
                                        <th>Upazila</th>
                                        <th>Postal Code</th>
                                        <th>varified Email</th>
                                        <th>Status</th>
                                        <th>Action</th>
                                    </thead>
                                    <tbody>

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    
    @include('modal.modal-lg')
    @include('modal.user-view')

@endsection
