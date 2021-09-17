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
        fields = ['id', 'email', 'first_name', 'last_name', 'phone', 'image', 'gender']


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
            phone=self.validated_data['phone'],
            gender=self.validated_data['gender']
        )

        password = self.validated_data['password']
        password2 = self.validated_data['password2']

        if password != password2:
            raise serializers.ValidationError({'password': 'Passwords must match.'})
        user.set_password(password)
        user.save()
        return user

    # email = serializers.EmailField(required=allauth_settings.EMAIL_REQUIRED)
    # password1 = serializers.CharField(write_only=True)
    # password2 = serializers.CharField(write_only=True)
    #
    # class Meta:
    #     model = Customer
    #     fields = ['id', 'email', 'password1', 'password2', 'first_name', 'last_name', 'phone', 'gender']
    #
    # def validate_email(self, email):
    #     email = get_adapter().clean_email(email)
    #     if allauth_settings.UNIQUE_EMAIL:
    #         if email and email_address_exists(email):
    #             raise serializers.ValidationError(
    #                 _("A user is already registered with this e-mail address."))
    #     return email
    #
    # def validate_password1(self, password):
    #     return get_adapter().clean_password(password)
    #
    # def validate(self, data):
    #     if data['password1'] != data['password2']:
    #         raise serializers.ValidationError(_("The two password fields didn't match."))
    #     return data
    #
    # def custom_signup(self, request, user):
    #     pass
    #
    # def get_cleaned_data(self):
    #     return {
    #         'password1': self.validated_data.get('password1', ''),
    #         'email': self.validated_data.get('email', ''),
    #         'first_name': self.validated_data.get('first_name', ''),
    #         'last_name': self.validated_data.get('last_name', ''),
    #         'phone': self.validated_data.get('phone', ''),
    #         'gender': self.validated_data.get('gender', '')
    #
    #     }
    #
    # def save(self, request):
    #     adapter = get_adapter()
    #     user = adapter.new_user(request)
    #     self.cleaned_data = self.get_cleaned_data()
    #     adapter.save_user(request, user, self)
    #     self.custom_signup(request, user)
    #     setup_user_email(request, user, [])
    #     return user
