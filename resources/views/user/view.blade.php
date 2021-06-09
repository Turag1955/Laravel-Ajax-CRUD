<div class="col-md-12 text-center">
    @if (!empty($data->avatar))
        <img class="pb-3" src="{{ asset('storage/' . USER_AVATAR . '/' . $data->avatar) }}" alt="{{ $data->name }} "
            style="width:200px">
    @else
        <img class="pb-3" src="{{ asset('storage/' . USER_AVATAR . '/' . 'unknown.png') }}" alt="{{ $data->name }}"
            style="width:200px">
    @endif
</div>

<div class="col-md-12">
    <table class="table table-bordered">
        <tr>
            <td><b>Name:</b></td>
            <td>{{ $data->name }}</td>
        </tr>
        <tr>
            <td><b>Role:</b></td>
            <td>{{ $data->role->role_name }}</td>
        </tr>
        <tr>
            <td><b>Email:</b></td>
            <td>{{ $data->email }}</td>
        </tr>
        <tr>
            <td><b>Mobile:</b></td>
            <td>{{ $data->mobile }}</td>
        </tr>
        <tr>
            <td><b>District:</b></td>
            <td>{{ $data->district->location_name }}</td>
        </tr>
        <tr>
            <td><b>Upazila:</b></td>
            <td>{{ $data->upazila->location_name }}</td>
        </tr>
        <tr>
            <td><b>Postal Code:</b></td>
            <td>{{ $data->postal_code }}</td>
        </tr>
        <tr>
            <td><b>Email Varified:</b></td>
            <td>{!! $data->email_verified_at ? '<span class="badge badge-success">Verified</span>' : '<span class="badge badge-danger">unVerified</span>' !!}</td>
        </tr>
        <tr>
            <td><b>Status:</b></td>
            <td>{!! STATUS[$data->status] !!}</td>
        </tr>
        <tr>
            <td><b>Address:</b></td>
            <td>{{ $data->address }}</td>
        </tr>
    </table>
</div>
