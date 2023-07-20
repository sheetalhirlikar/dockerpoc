# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class AuthGroup(models.Model):
    name = models.CharField(unique=True, max_length=150)

    class Meta:
        managed = False
        db_table = 'auth_group'


class AuthGroupPermissions(models.Model):
    id = models.BigAutoField(primary_key=True)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)
    permission = models.ForeignKey('AuthPermission', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_group_permissions'
        unique_together = (('group', 'permission'),)


class AuthPermission(models.Model):
    name = models.CharField(max_length=255)
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING)
    codename = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'auth_permission'
        unique_together = (('content_type', 'codename'),)


class AuthUser(models.Model):
    password = models.CharField(max_length=128)
    last_login = models.DateTimeField(blank=True, null=True)
    is_superuser = models.IntegerField()
    username = models.CharField(unique=True, max_length=150)
    first_name = models.CharField(max_length=150)
    last_name = models.CharField(max_length=150)
    email = models.CharField(max_length=254)
    is_staff = models.IntegerField()
    is_active = models.IntegerField()
    date_joined = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'auth_user'


class AuthUserGroups(models.Model):
    id = models.BigAutoField(primary_key=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_groups'
        unique_together = (('user', 'group'),)


class AuthUserUserPermissions(models.Model):
    id = models.BigAutoField(primary_key=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    permission = models.ForeignKey(AuthPermission, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_user_permissions'
        unique_together = (('user', 'permission'),)


class DjangoAdminLog(models.Model):
    action_time = models.DateTimeField()
    object_id = models.TextField(blank=True, null=True)
    object_repr = models.CharField(max_length=200)
    action_flag = models.PositiveSmallIntegerField()
    change_message = models.TextField()
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING, blank=True, null=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'django_admin_log'


class DjangoContentType(models.Model):
    app_label = models.CharField(max_length=100)
    model = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'django_content_type'
        unique_together = (('app_label', 'model'),)


class DjangoMigrations(models.Model):
    id = models.BigAutoField(primary_key=True)
    app = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    applied = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_migrations'


class DjangoSession(models.Model):
    session_key = models.CharField(primary_key=True, max_length=40)
    session_data = models.TextField()
    expire_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_session'


class Features(models.Model):
    featid = models.IntegerField(primary_key=True)  # The composite primary key (featid, pbid) found, that is not supported. The first column is selected.
    pbid = models.IntegerField()
    pid = models.CharField(max_length=24)
    feature = models.CharField(max_length=48)
    qualifier = models.CharField(max_length=48, blank=True, null=True)
    description = models.CharField(max_length=256)
    details = models.CharField(max_length=256, blank=True, null=True)
    create_time = models.DateTimeField()
    created_by = models.CharField(max_length=32)

    class Meta:
        managed = False
        db_table = 'features'
        unique_together = (('featid', 'pbid'),)


class Heading(models.Model):
    headid = models.IntegerField()
    pbid = models.IntegerField()
    description = models.CharField(max_length=256)
    create_time = models.DateTimeField()
    created_by = models.CharField(max_length=32)

    class Meta:
        managed = False
        db_table = 'heading'


class Itemlist(models.Model):
    pbid = models.IntegerField()
    sequence = models.IntegerField()
    itemtype = models.CharField(max_length=7)
    itemid = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'itemlist'


class Lictype(models.Model):
    lictypeid = models.AutoField(unique=True)
    pbid = models.IntegerField()
    name = models.CharField(max_length=48)
    description = models.CharField(max_length=256)
    type = models.CharField(max_length=9)

    class Meta:
        managed = False
        db_table = 'lictype'


class Notify(models.Model):
    notify_id = models.AutoField(primary_key=True)
    notify_pbid = models.IntegerField()
    notify_re = models.CharField(max_length=256)
    notify_mode = models.CharField(max_length=3)
    notify_destination = models.CharField(max_length=512)

    class Meta:
        managed = False
        db_table = 'notify'


class Packages(models.Model):
    packid = models.IntegerField(primary_key=True)  # The composite primary key (packid, pbid) found, that is not supported. The first column is selected.
    pbid = models.IntegerField()
    pkn = models.CharField(max_length=24)
    description = models.CharField(max_length=256)
    details = models.CharField(max_length=128, blank=True, null=True)
    create_time = models.DateTimeField()
    created_by = models.CharField(max_length=32)

    class Meta:
        managed = False
        db_table = 'packages'
        unique_together = (('packid', 'pbid'),)


class Pricebook(models.Model):
    pbid = models.AutoField(primary_key=True)
    version = models.CharField(max_length=16)
    revision = models.CharField(max_length=11)
    description = models.CharField(max_length=128)
    published = models.IntegerField()
    create_time = models.DateTimeField()
    created_by = models.CharField(max_length=32)

    class Meta:
        managed = False
        db_table = 'pricebook'


class Products(models.Model):
    prodid = models.IntegerField(primary_key=True)  # The composite primary key (prodid, pbid) found, that is not supported. The first column is selected.
    pbid = models.IntegerField()
    pfn = models.CharField(max_length=24)
    description = models.CharField(max_length=256)
    groupdef = models.CharField(max_length=32, blank=True, null=True)
    mode = models.CharField(max_length=128, blank=True, null=True)
    create_time = models.DateTimeField()
    created_by = models.CharField(max_length=32)

    class Meta:
        managed = False
        db_table = 'products'
        unique_together = (('prodid', 'pbid'),)


class Sections(models.Model):
    sectid = models.IntegerField(primary_key=True)  # The composite primary key (sectid, pbid) found, that is not supported. The first column is selected.
    pbid = models.IntegerField()
    skn = models.IntegerField()
    description = models.CharField(max_length=80)
    create_time = models.DateTimeField()
    created_by = models.CharField(max_length=32)

    class Meta:
        managed = False
        db_table = 'sections'
        unique_together = (('sectid', 'pbid'),)


class Source(models.Model):
    pbid = models.IntegerField(unique=True)
    llist = models.TextField()
    pbtext = models.TextField()
    create_time = models.DateTimeField()
    created_by = models.CharField(max_length=32)

    class Meta:
        managed = False
        db_table = 'source'
