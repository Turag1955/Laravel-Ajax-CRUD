@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">{{ __('Dashboard') }}</div>
                    <div class="card-body">
                        <h2>Json</h2>
                        <div id="data"></div>
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
            let costomer = [{
                    "name": "mr.a",
                    "gmail": "a@gmail.com"
                },
                {
                    "name": "mr.b",
                    "gmail": "b@gmail.com"
                },
                {
                    "name": "mr.c",
                    "gmail": "c@gmail.com"
                }
            ];
        //   console.log(JSON.parse(costomer));

        let converter = JSON.stringify(costomer);
        console.log(converter);
        // let html = '<ul>';
        //     $.each(converter,function(key,value){
        //         html+='<li>'+value.name+'<br>'+value.gmail+'</li>';
        //     });
        //     html+= '</ul>';
        //     $('#data').append(html);
        }

    </script>
@endpush
