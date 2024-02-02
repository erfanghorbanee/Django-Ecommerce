from django.contrib.auth.models import AbstractUser
from django.core.exceptions import ValidationError
from django.db import models
from phonenumber_field.modelfields import PhoneNumberField

from .managers import CustomUserManager


def validate_only_one_instance(obj):
    model = obj.__class__
    user = obj.user
    if model.objects.filter(user=user).exists():
        raise ValidationError(
            f"Can only create one instance of {model.__name__} with the same user"
        )


class Customer(AbstractUser):
    username = None
    email = models.EmailField(("email address"), unique=True)

    USERNAME_FIELD = "email"
    REQUIRED_FIELDS = [
        "first_name",
        "last_name",
    ]  # will be required when creating a superuser.

    objects = CustomUserManager()

    phone = PhoneNumberField(null=False, blank=False)

    MALE = "M"
    FEMALE = "F"
    OTHER = "O"
    PREFER_NOT_TO_SAY = "X"

    GENDER_CHOICES = [
        (MALE, "Male"),
        (FEMALE, "Female"),
        (OTHER, "Other"),
        (PREFER_NOT_TO_SAY, "Prefer not to say"),
    ]

    gender = models.CharField(
        max_length=1,
        choices=GENDER_CHOICES,
        default=PREFER_NOT_TO_SAY,
    )

    def __str__(self):
        return self.email


class Address(models.Model):
    user = models.ForeignKey(
        Customer, on_delete=models.CASCADE, blank=False, null=False
    )
    province = models.CharField(max_length=100, blank=False, null=False)
    city = models.CharField(max_length=100, blank=False, null=False)
    postcode = models.CharField(max_length=12, blank=False, null=False)
    address = models.CharField(max_length=1200, blank=False, null=False)

    def __str__(self):
        return self.user.email

    def clean(self):
        validate_only_one_instance(self)

    class Meta:
        verbose_name_plural = "Addresses"


class DiscountCode(models.Model):
    user = models.ForeignKey(Customer, on_delete=models.CASCADE, blank=True, null=True)
    code = models.CharField(max_length=10, unique=True)
    amount = models.PositiveIntegerField()
    start_date = models.DateTimeField()
    expire_date = models.DateTimeField()

    def __str__(self):
        return str(self.amount) + "%"
