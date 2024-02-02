from django.contrib.auth.base_user import BaseUserManager


class CustomUserManager(BaseUserManager):
    """
    Custom user model manager where email is the unique identifier for authentication.
    """

    def create_user(self, email, password=None, **extra_fields):
        """
        Create and save a regular User with the given email and password.

        Args:
            email (str): The user's email address.
            password (str, optional): The user's password.
            extra_fields (dict): Additional fields to be saved with the user.

        Returns:
            User: The created user instance.
        """

        if not email:
            raise ValueError("The Email must be set")

        email = self.normalize_email(email)
        user = self.model(email=email, **extra_fields)
        user.set_password(password)

        # using=self._db ensures that the user is saved to the correct database associated with the user manager.
        user.save(using=self._db)

        return user

    def create_superuser(self, email, password=None, **extra_fields):
        """
        Create and save a SuperUser with the given email and password.

        Args:
            email (str): The superuser's email address.
            password (str, optional): The superuser's password.
            extra_fields (dict): Additional fields to be saved with the superuser.

        Returns:
            User: The created superuser instance.
        """

        extra_fields.setdefault("is_staff", True)
        extra_fields.setdefault("is_superuser", True)
        extra_fields.setdefault("is_active", True)

        if extra_fields.get("is_staff") is not True:
            raise ValueError("Superuser must have is_staff=True.")

        if extra_fields.get("is_superuser") is not True:
            raise ValueError("Superuser must have is_superuser=True.")
        return self.create_user(email, password, **extra_fields)
