from dj_rest_auth.registration.serializers import RegisterSerializer
from rest_framework import serializers

from customers.models import Address, Customer, DiscountCode


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = Customer
        fields = ["id", "email", "first_name", "last_name", "phone", "gender"]

    def validate_first_name(self, value):
        if not value:
            raise serializers.ValidationError("First name can't be empty!")
        return value

    def validate_last_name(self, value):
        if not value:
            raise serializers.ValidationError("Last name can't be empty!")
        return value


class CustomRegisterSerializer(RegisterSerializer):
    first_name = serializers.CharField(required=True)
    last_name = serializers.CharField(required=True)
    phone = serializers.CharField(required=True)
    gender = serializers.ChoiceField(choices=Customer.GENDER_CHOICES, required=True)

    class Meta:
        model = Customer
        fields = [
            "email",
            "first_name",
            "last_name",
            "password1",
            "password2",
            "phone",
            "gender",
        ]

    def get_cleaned_data(self):
        data = super().get_cleaned_data()
        data.update(
            {
                "first_name": self.validated_data.get("first_name", ""),
                "last_name": self.validated_data.get("last_name", ""),
                "phone": self.validated_data.get("phone", ""),
                "gender": self.validated_data.get("gender", ""),
            }
        )
        return data

    def save(self, request):
        user = super().save(request)
        user.first_name = self.validated_data.get("first_name")
        user.last_name = self.validated_data.get("last_name")
        user.phone = self.validated_data.get("phone")
        user.gender = self.validated_data.get("gender")
        user.save()
        return user


class DiscountCodeSerializer(serializers.ModelSerializer):
    user = serializers.CharField(source="user.email")

    class Meta:
        model = DiscountCode
        fields = "__all__"


class AddressSerializer(serializers.ModelSerializer):
    user = serializers.CharField(source="user.email")

    class Meta:
        model = Address
        fields = "__all__"
