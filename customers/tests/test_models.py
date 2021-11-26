from django.test import TestCase
from customers.models import Customer


class ModelsTestCase(TestCase):
    def test_customer_is_created(self):
        """Test Customer model"""
        customer = Customer.objects.create_user(
            email="erfanghorbanee@gmail.com",
            first_name="alireza",
            last_name="ghorbani",
            phone="+981123123123",
            password="password",
        )

        self.assertEqual(str(customer), "erfanghorbanee@gmail.com")
