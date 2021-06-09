
<div class="form-group {{ $col ?? ''}}"> 
    <label for="{{ $name }}">{{ $label }}</label>
   <textarea name="{{ $name }}" id="{{ $name }}" placeholder="{{ $placeholder ?? ''}}" class="form-control" required="{{ $required }}"></textarea>
</div>
