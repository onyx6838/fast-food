package com.handout.validation.form.account;

import com.handout.service.IJWTTokenService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.ObjectUtils;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class ResetPasswordTokenValidValidator implements ConstraintValidator<ResetPasswordTokenValid, String> {

	@Autowired
	private IJWTTokenService service;

	@Override
	public boolean isValid(String data, ConstraintValidatorContext constraintValidatorContext) {

		if (ObjectUtils.isEmpty(data)) {
			return false;
		}

		return service.isValidResetPasswordToken(data);
	}
}