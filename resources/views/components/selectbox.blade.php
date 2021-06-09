
<div class="form-group {{ $col ?? ''}}"> 
    <label for="{{ $name }}">{{ $label }}</label>
    <select name="{{ $name }}" id="{{ $name }}" class="form-control" required="{{ $required }}" @if(!empty($onchange)) onchange="{{ $onchange }}" @endif>
        <option value="">Select Please</option>
        {{ $slot }}
    </select>
</div>