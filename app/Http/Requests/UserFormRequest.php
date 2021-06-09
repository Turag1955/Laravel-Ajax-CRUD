<?php

namespace App\Http\Requests;

use App\Models\User;
use App\Rules\strongPassword;
use App\Rules\validMobileNumber;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Contracts\Validation\Validator;
use Illuminate\Http\Exceptions\HttpResponseException;

class UserFormRequest extends FormRequest
{

    protected function failedValidation(Validator $validator)
    {
        throw new HttpResponseException(
            response()->json([
                'status' => false,
                'errors' => $validator->errors(),
            ], 200)
        );
    }
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        $rules = User::USER_VALIDATION;
        if (request()->update_id) {
            $rules['email'][2] = ' unique:users,email,' . request()->update_id;
            $rules['mobile'][1] = 'unique:users,mobile,' . request()->update_id;
        } else {
            $rules['password']  = ['required', 'string', new strongPassword];
            $rules['cpassword'] = ['required', 'string', 'min:10'];
        }
        $rules['mobile'][2] = new validMobileNumber;

        return $rules;
    }
}
