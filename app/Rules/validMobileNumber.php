<?php

namespace App\Rules;

use Illuminate\Contracts\Validation\Rule;

class validMobileNumber implements Rule
{
    /**
     * Create a new rule instance.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Determine if the validation rule passes.
     *
     * @param  string  $attribute
     * @param  mixed  $value
     * @return bool
     */
    public function passes($attribute, $value)
    {
        return preg_match('/^(?:\+88|88)?(01[3-9]\d{8})$/',$value);
        // /^(?:\+88|88)?(01[3-9]\d{8})$/
    }

    /**
     * Get the validation error message.
     *
     * @return string
     */
    public function message()
    {
        return 'The :attributes is not valid Bd mobile number ';
    }
}
