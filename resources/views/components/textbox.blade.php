
<div class="form-group {{ $col ?? ''}}"> 
    <label for="{{ $name }}">{{ $label }}</label>
    <input type="{{ $type ?? '' }}" name="{{ $name }}" id="{{ $name }}" placeholder="{{ $placeholder ?? ''}}" class="form-control" required="{{ $required }}">
</div>
