package com.handout.validation.form.account;

import com.handout.service.IAccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.ObjectUtils;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class UserEmailExistsValidator implements ConstraintValidator<UserEmailExists, String> {

	@Autowired
	private IAccountService service;

	@Override
	public boolean isValid(String data, ConstraintValidatorContext constraintValidatorContext) {

		if (ObjectUtils.isEmpty(data)) {
			return false;
		}

		return service.existsByEmail(data);
	}
}