from rest_framework import serializers
from customers.models import Customer

try:
    from allauth.account import app_settings as allauth_settings
    from allauth.utils import (email_address_exists,
                               get_username_max_length)
    from allauth.account.adapter import get_adapter
    from allauth.account.utils import setup_user_email
    from allauth.socialaccount.helpers import complete_social_login
    from allauth.socialaccount.models import SocialAccount
    from allauth.socialaccount.providers.base import AuthProcess
except ImportError:
    raise ImportError("allauth needs to be added to INSTALLED_APPS.")


class UserSerializer(serializers.ModelSerializer):

    class Meta:
        model = Customer
        fields = ['id', 'email', 'first_name', 'last_name', 'phone', 'gender']

    def validate_first_name(self, value):
        if not value:
            raise serializers.ValidationError("First name can't be empty!")
        return value

    def validate_last_name(self, value):
        if not value:
            raise serializers.ValidationError("Last name can't be empty!")
        return value


class CustomRegisterSerializer(serializers.ModelSerializer):
    password2 = serializers.CharField(style={'input_type': 'password'}, write_only=True)

    class Meta:
        model = Customer
        fields = ['email', 'first_name', 'last_name',
                  'password', 'password2', 'phone', 'gender']
        extra_kwargs = {
            'password': {
                'write_only': True
            }
        }

    def save(self, request):
        user = Customer(
            email=self.validated_data['email'],
            first_name=self.validated_data['first_name'],
            last_name=self.validated_data['last_name'],
            phone=self.validated_data['phone']
        )

        password = self.validated_data['password']
        password2 = self.validated_data['password2']

        if password != password2:
            raise serializers.ValidationError({'password': 'Passwords must match.'})
        elif len(password) < 8:
            raise serializers.ValidationError({'password': 'This password is too short. '
                                                           'It must contain at least 8 characters.'})

        user.set_password(password)
        user.save()
        return user
