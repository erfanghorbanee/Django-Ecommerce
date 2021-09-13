from rest_framework import serializers

from customers.models import Customer


class UserSerializer(serializers.ModelSerializer):

    class Meta:
        model = Customer
        fields = ['id', 'email', 'first_name', 'last_name', 'phone', 'image', 'gender']
