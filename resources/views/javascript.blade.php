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
                            <button class="btn btn-success" type="button" onclick="changeText()">Click</button>
                        </div>
                        <div id="image">
                        </div>
                        <br><br>
                        <form method="post">
                            <input type="text" name="name" id="name" class="form-control"><br>
                            <input onclick="submit_form()" type="button" value="submit" class="btn btn-primary">
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
@push('script')
    <script>
        image();

        function changeText() {
            let req = new XMLHttpRequest();
            req.open('GET', '{{ route('ajax') }}', true);
            req.send();

            req.onreadystatechange = function() {
                if (req.readyState == 4 && req.status == 200) {
                    document.getElementById('name').innerHTML = req.responseText;
                }
            };
        }

        function image() {
            let req = new XMLHttpRequest();
            req.open('GET', '{{ url('image') }}', true);
            req.send();

            req.onreadystatechange = function() {
                if (req.readyState == 4 && req.status == 200) {
                    document.getElementById('image').innerHTML = req.response;
                }
            };
        }

        function submit_form() {
            let name = document.getElementById('name').value;
            if (name) {
                let req = new XMLHttpRequest();
                req.open('POST', '{{ url('submit-url') }}', true);
                req.setRequestHeader("content-type","Application/x-www-form-urlencoded");
                req.send('name=' + name + '&_token={{ csrf_token() }}');

                req.onreadystatechange = function() {
                    if (req.readyState == 4 && req.status == 200) {
                        document.getElementById('heading').innerHTML = req.response;
                    }
                }
            }

        }

    </script>
@endpush
