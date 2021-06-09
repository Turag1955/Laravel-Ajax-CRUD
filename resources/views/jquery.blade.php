@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">{{ __('Dashboard') }}</div>
                    <div class="card-body">
                        <div class="text-center">
                            <h2 id="heading">Kawsar uddin</h2>
                            <button id="change_text" class="btn btn-success" type="button">Click</button>
                        </div>
                        <div id="image">
                        </div>
                        <br><br>
                        <form method="post">
                            <input type="text" name="name" id="name" class="form-control"><br>
                            <input type="button" value="submit" class="btn btn-primary save-btn">
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
@push('script')
    <script>
        originalOnload = window.onload;
        window.onload = function() {
            if (originalOnload) {
                originalOnload();
            }
            $(document).ready(function($) {
                load_image();
                $('#change_text').click(function() {
                    $.get("{{ url('jquery/get_ajax') }}", function(data, status) {
                        if (data) {
                            $('#heading').html(data);
                            console.log(status);
                        }
                    });
                });

                $('.save-btn').click(function(){
                    let name = $('#name').val();
                    let _token = "{{ csrf_token() }}";
                    $.post("{{ url('jquery/submit-url') }}",{
                        name:name,_token:_token
                    },function(data,status){
                       if(data){
                        $('#heading').text(data);
                       }
                    });
                });

                function load_image() {
                    $.get("{{ url('jquery/image') }}", function(data, status) {
                        $('#image').html(data);
                    });
                }
            });

        };

    </script>
@endpush
