# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class AlrAccount(models.Model):
    account = models.CharField(max_length=32)
    company = models.CharField(max_length=32)
    area = models.CharField(max_length=32)
    mode = models.CharField(max_length=7)
    tags = models.CharField(max_length=1024)

    class Meta:
        managed = False
        db_table = 'alr_account'
        unique_together = (('account', 'mode'),)


class AlrRestrictions(models.Model):
    empno = models.IntegerField()
    mode = models.CharField(max_length=7)

    class Meta:
        managed = False
        db_table = 'alr_restrictions'


class AlrUser(models.Model):
    email = models.CharField(primary_key=True, max_length=128)  # The composite primary key (email, mode) found, that is not supported. The first column is selected.
    account = models.CharField(max_length=32)
    mode = models.CharField(max_length=7)

    class Meta:
        managed = False
        db_table = 'alr_user'
        unique_together = (('email', 'mode'),)


class AuthGroup(models.Model):
    name = models.CharField(unique=True, max_length=150)

    class Meta:
        managed = False
        db_table = 'auth_group'


class AuthGroupPermissions(models.Model):
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
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_groups'
        unique_together = (('user', 'group'),)


class AuthUserUserPermissions(models.Model):
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    permission = models.ForeignKey(AuthPermission, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_user_permissions'
        unique_together = (('user', 'permission'),)


class Countries(models.Model):
    iso = models.CharField(unique=True, max_length=2)
    iso3 = models.CharField(max_length=3)
    name = models.CharField(max_length=48)
    continent = models.CharField(max_length=2)
    tld = models.CharField(max_length=12)
    tzlow = models.FloatField()
    tzhigh = models.FloatField()

    class Meta:
        managed = False
        db_table = 'countries'


class Country(models.Model):
    country_code = models.CharField(max_length=2, blank=True, null=True)
    country_name = models.CharField(max_length=45, db_collation='latin1_general_ci', blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'country'


class DachArchive(models.Model):
    created = models.DateTimeField()
    user = models.CharField(max_length=32)
    license_archive_id = models.IntegerField()
    agreement = models.CharField(max_length=128)
    installation = models.CharField(max_length=128)
    customer = models.CharField(max_length=128)
    start_date = models.DateField()
    end_date = models.DateField()
    es_date = models.DateField()
    lictype = models.CharField(max_length=32)
    server_id = models.CharField(max_length=128, blank=True, null=True)
    target_id = models.CharField(max_length=128, blank=True, null=True)
    features = models.TextField()

    class Meta:
        managed = False
        db_table = 'dach_archive'


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


class DownloadActivity(models.Model):
    downloadid = models.IntegerField(db_column='DownloadID', primary_key=True)  # Field name made lowercase.
    downloadtype = models.CharField(db_column='DownloadType', max_length=4, blank=True, null=True)  # Field name made lowercase.
    startdatetime = models.DateTimeField(db_column='StartDateTime', blank=True, null=True)  # Field name made lowercase.
    enddatetime = models.DateTimeField(db_column='EndDateTime', blank=True, null=True)  # Field name made lowercase.
    durationseconds = models.IntegerField(db_column='DurationSeconds', blank=True, null=True)  # Field name made lowercase.
    downloadipaddress = models.CharField(db_column='DownloadIPAddress', max_length=128, blank=True, null=True)  # Field name made lowercase.
    ipaddresscountry = models.CharField(db_column='IPAddressCountry', max_length=3, blank=True, null=True)  # Field name made lowercase.
    intrawareaccountid = models.CharField(db_column='IntrawareAccountID', max_length=15, blank=True, null=True)  # Field name made lowercase.
    accountid = models.CharField(db_column='AccountID', max_length=100, blank=True, null=True)  # Field name made lowercase.
    accountname = models.CharField(db_column='AccountName', max_length=100, blank=True, null=True)  # Field name made lowercase.
    intrawarememberid = models.IntegerField(db_column='IntrawareMemberID', blank=True, null=True)  # Field name made lowercase.
    memberid = models.CharField(db_column='MemberID', max_length=100, blank=True, null=True)  # Field name made lowercase.
    lastname = models.CharField(db_column='LastName', max_length=30, blank=True, null=True)  # Field name made lowercase.
    firstname = models.CharField(db_column='FirstName', max_length=30, blank=True, null=True)  # Field name made lowercase.
    email = models.CharField(db_column='Email', max_length=100, blank=True, null=True)  # Field name made lowercase.
    country = models.CharField(db_column='Country', max_length=3, blank=True, null=True)  # Field name made lowercase.
    intrawareorderid = models.IntegerField(db_column='IntrawareOrderID', blank=True, null=True)  # Field name made lowercase.
    orderid = models.CharField(db_column='OrderID', max_length=100, blank=True, null=True)  # Field name made lowercase.
    orderdate = models.DateField(db_column='OrderDate', blank=True, null=True)  # Field name made lowercase.
    intrawarecatalogitemid = models.IntegerField(db_column='IntrawareCatalogItemID', blank=True, null=True)  # Field name made lowercase.
    catalogitemid = models.CharField(db_column='CatalogItemID', max_length=40, blank=True, null=True)  # Field name made lowercase.
    catalogitemname = models.CharField(db_column='CatalogItemName', max_length=255, blank=True, null=True)  # Field name made lowercase.
    intrawareproductid = models.IntegerField(db_column='IntrawareProductID', blank=True, null=True)  # Field name made lowercase.
    productid = models.CharField(db_column='ProductID', max_length=40, blank=True, null=True)  # Field name made lowercase.
    productname = models.CharField(db_column='ProductName', max_length=255, blank=True, null=True)  # Field name made lowercase.
    intrawarefileid = models.IntegerField(db_column='IntrawareFileID', blank=True, null=True)  # Field name made lowercase.
    fileid = models.CharField(db_column='FileID', max_length=40, blank=True, null=True)  # Field name made lowercase.
    filename = models.CharField(db_column='FileName', max_length=255, blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'download_activity'


class ElsArchive(models.Model):
    id = models.IntegerField(primary_key=True)
    username = models.CharField(max_length=30, blank=True, null=True)
    modified = models.DateTimeField()
    created = models.DateTimeField(blank=True, null=True)
    customer = models.CharField(max_length=80, blank=True, null=True)
    agreement = models.CharField(max_length=30, blank=True, null=True)
    installation = models.CharField(max_length=30, blank=True, null=True)
    startdate = models.DateField(blank=True, null=True)
    enddate = models.DateField(blank=True, null=True)
    po = models.CharField(max_length=80, blank=True, null=True)
    serverid = models.CharField(max_length=255, blank=True, null=True)
    methtype = models.CharField(max_length=20, blank=True, null=True)
    lictype = models.CharField(max_length=30, blank=True, null=True)
    letter = models.CharField(max_length=30, blank=True, null=True)
    elsieif = models.TextField(blank=True, null=True)
    body = models.TextField(blank=True, null=True)
    cgi = models.TextField(blank=True, null=True)
    license = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'els_archive'


class Emp(models.Model):
    empno = models.IntegerField(primary_key=True)
    fullname = models.CharField(max_length=80)
    lastfi = models.CharField(max_length=60)
    nameph = models.CharField(max_length=80)
    first = models.CharField(max_length=30)
    preferred = models.CharField(max_length=30)
    last = models.CharField(max_length=30)
    minname = models.CharField(max_length=20)
    email = models.CharField(max_length=40)
    phone = models.CharField(max_length=40)
    buno = models.CharField(max_length=8)
    buname = models.CharField(max_length=128)
    deptno = models.CharField(max_length=8)
    deptname = models.CharField(max_length=128)
    location = models.CharField(max_length=80)
    phonesite = models.CharField(max_length=40)
    supno = models.IntegerField()
    supname = models.CharField(max_length=40)
    skypename = models.CharField(max_length=40)
    mobile = models.CharField(max_length=40, blank=True, null=True)
    gositeflag = models.CharField(max_length=20, blank=True, null=True)
    organization = models.CharField(max_length=255, blank=True, null=True)
    fileno = models.CharField(max_length=40, blank=True, null=True)
    locid = models.IntegerField(blank=True, null=True)
    personid = models.IntegerField(blank=True, null=True)
    fullemail = models.CharField(max_length=90)
    userid = models.CharField(max_length=90, blank=True, null=True)
    exempt = models.CharField(max_length=8, blank=True, null=True)
    start = models.CharField(max_length=20, blank=True, null=True)
    category = models.CharField(max_length=80, blank=True, null=True)
    expensebu = models.CharField(max_length=20, blank=True, null=True)
    expnsdept = models.CharField(max_length=20, blank=True, null=True)
    title = models.CharField(max_length=80, blank=True, null=True)
    resourcetype = models.CharField(max_length=80, blank=True, null=True)
    company = models.IntegerField(blank=True, null=True)
    companyname = models.CharField(max_length=50, blank=True, null=True)
    created = models.DateTimeField()
    updated = models.DateTimeField(blank=True, null=True)
    active = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'emp'


class EmpLocations(models.Model):
    loccode = models.CharField(max_length=80, blank=True, null=True)
    description = models.CharField(max_length=80, blank=True, null=True)
    contact = models.CharField(max_length=80, blank=True, null=True)
    address1 = models.CharField(max_length=80, blank=True, null=True)
    address2 = models.CharField(max_length=80, blank=True, null=True)
    address3 = models.CharField(max_length=80, blank=True, null=True)
    city = models.CharField(max_length=50, blank=True, null=True)
    postalcode = models.CharField(max_length=25, blank=True, null=True)
    region1 = models.CharField(max_length=80, blank=True, null=True)
    region2 = models.CharField(max_length=80, blank=True, null=True)
    region3 = models.CharField(max_length=80, blank=True, null=True)
    country = models.CharField(max_length=20, blank=True, null=True)
    phone1 = models.CharField(max_length=30, blank=True, null=True)
    phone2 = models.CharField(max_length=30, blank=True, null=True)
    phone3 = models.CharField(max_length=30, blank=True, null=True)
    shiptosite = models.CharField(max_length=80, blank=True, null=True)
    billtosite = models.CharField(max_length=80, blank=True, null=True)
    officesite = models.CharField(max_length=80, blank=True, null=True)
    internalsite = models.CharField(max_length=80, blank=True, null=True)
    receivingsite = models.CharField(max_length=80, blank=True, null=True)
    addressstyle = models.CharField(max_length=20, blank=True, null=True)
    locid = models.IntegerField(primary_key=True)
    locworldarea = models.CharField(max_length=20, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'emp_locations'


class EmplicAddons(models.Model):
    userid = models.CharField(primary_key=True, max_length=32)  # The composite primary key (userid, addon) found, that is not supported. The first column is selected.
    addon = models.CharField(max_length=32)

    class Meta:
        managed = False
        db_table = 'emplic_addons'
        unique_together = (('userid', 'addon'),)


class EmplicConfirm(models.Model):
    seq = models.AutoField(primary_key=True)
    mscid = models.CharField(max_length=12, blank=True, null=True)
    empno = models.IntegerField(blank=True, null=True)
    generated = models.DateTimeField()
    ipaddr = models.CharField(max_length=32, blank=True, null=True)
    confirmkey = models.CharField(unique=True, max_length=32, blank=True, null=True)
    confirmed = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'emplic_confirm'


class EmplicHits(models.Model):
    seq = models.AutoField(primary_key=True)
    mscid = models.CharField(max_length=12, blank=True, null=True)
    empno = models.IntegerField(blank=True, null=True)
    generated = models.DateTimeField()
    ipaddr = models.CharField(max_length=32, blank=True, null=True)
    archive_id = models.IntegerField(blank=True, null=True)
    license = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'emplic_hits'


class EmplicOverride(models.Model):
    empno = models.IntegerField(unique=True)

    class Meta:
        managed = False
        db_table = 'emplic_override'


class Entries(models.Model):
    system = models.CharField(max_length=128, blank=True, null=True)
    subsystem = models.CharField(max_length=128, blank=True, null=True)
    topic = models.CharField(max_length=128, blank=True, null=True)
    level = models.CharField(max_length=64, blank=True, null=True)
    priority = models.CharField(max_length=64, blank=True, null=True)
    message = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'entries'


class GlasArchive(models.Model):
    timestamp = models.DateTimeField()
    user = models.CharField(max_length=32)
    actual_user = models.CharField(max_length=32)
    delivery_key = models.CharField(unique=True, max_length=36)
    license = models.TextField()

    class Meta:
        managed = False
        db_table = 'glas_archive'


class GlasDelivery(models.Model):
    glas_archive_id = models.IntegerField()
    key = models.CharField(max_length=32)

    class Meta:
        managed = False
        db_table = 'glas_delivery'


class LgxArchive(models.Model):
    created = models.DateTimeField()
    modified = models.DateTimeField()
    username = models.CharField(max_length=16)
    lgx_server = models.CharField(max_length=128, blank=True, null=True)
    lgx_server_ip = models.CharField(max_length=128, blank=True, null=True)
    customer = models.CharField(max_length=80, blank=True, null=True)
    agreement = models.CharField(max_length=30, blank=True, null=True)
    installation = models.CharField(max_length=30, blank=True, null=True)
    order_number = models.CharField(max_length=128, blank=True, null=True)
    service_id = models.CharField(max_length=128, blank=True, null=True)
    start_date = models.DateField(blank=True, null=True)
    end_date = models.DateField(blank=True, null=True)
    es_date = models.DateField(blank=True, null=True)
    origin = models.CharField(max_length=16, blank=True, null=True)
    category = models.CharField(max_length=24, blank=True, null=True)
    product_set = models.CharField(max_length=24, blank=True, null=True)
    license_type = models.CharField(max_length=24, blank=True, null=True)
    server_ids = models.CharField(max_length=2048, blank=True, null=True)
    server_names = models.CharField(max_length=2048, blank=True, null=True)
    host_ids = models.CharField(max_length=2048, blank=True, null=True)
    mail_to = models.CharField(max_length=255, blank=True, null=True)
    mail_cc = models.CharField(max_length=255, blank=True, null=True)
    mail_bcc = models.CharField(max_length=255, blank=True, null=True)
    input_data = models.CharField(max_length=16384)
    letter = models.TextField()
    archive_id = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'lgx_archive'


class LgxLetter(models.Model):
    name = models.CharField(primary_key=True, max_length=32)
    sequence = models.IntegerField()
    description = models.CharField(max_length=128)
    template = models.CharField(max_length=128)
    permission = models.CharField(max_length=32)

    class Meta:
        managed = False
        db_table = 'lgx_letter'


class LgxLot(models.Model):
    lot_id = models.AutoField(primary_key=True)
    lot_timestamp = models.DateTimeField()
    lot_mode = models.CharField(max_length=9)
    lot_user = models.CharField(max_length=32)
    lot_filename = models.CharField(max_length=256)
    lot_input = models.TextField()
    lot_md5 = models.CharField(max_length=128)

    class Meta:
        managed = False
        db_table = 'lgx_lot'


class LgxLotDetail(models.Model):
    lot_item_id = models.AutoField(primary_key=True)
    lot_detail_timestamp = models.DateTimeField()
    lot_detail_email = models.CharField(max_length=128)
    lot_id = models.IntegerField()
    lot_item_input = models.TextField()
    lot_archive_id = models.IntegerField()
    lot_detail_hostid = models.CharField(max_length=32)
    lot_item_status = models.CharField(max_length=7)
    lot_item_status_msg = models.CharField(max_length=1024)
    lot_detail_letter = models.TextField()
    lot_detail_lethtml = models.TextField()
    lot_detail_campaign = models.CharField(max_length=128)

    class Meta:
        managed = False
        db_table = 'lgx_lot_detail'


class LgxLotStatus(models.Model):
    lot_id = models.IntegerField()
    lot_status_signal = models.CharField(max_length=6)
    lot_status_msg = models.CharField(max_length=4096)
    lot_status_count_good = models.IntegerField()
    lot_status_count_bad = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'lgx_lot_status'


class LgxSfdc(models.Model):
    lgx_id = models.IntegerField(unique=True)
    posted = models.DateTimeField()
    status = models.IntegerField(blank=True, null=True)
    postlog = models.CharField(max_length=8192, blank=True, null=True)
    sfdcdata = models.CharField(max_length=20000, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'lgx_sfdc'


class LicenseArchive(models.Model):
    timestamp = models.DateTimeField()
    user = models.CharField(max_length=32)
    actual_user = models.CharField(max_length=128)
    service = models.CharField(max_length=32)
    subservice = models.CharField(max_length=64, blank=True, null=True)
    reference = models.CharField(max_length=255, blank=True, null=True)
    delivery_key = models.CharField(unique=True, max_length=36)
    license = models.TextField()

    class Meta:
        managed = False
        db_table = 'license_archive'


class LicensePurpose(models.Model):
    name = models.CharField(max_length=32)
    description = models.CharField(max_length=128)
    details = models.CharField(max_length=1024, blank=True, null=True)
    internal = models.IntegerField()
    active = models.IntegerField()
    duration = models.CharField(max_length=64, blank=True, null=True)
    presets = models.CharField(max_length=80, blank=True, null=True)
    psl = models.IntegerField(blank=True, null=True)
    ordered = models.IntegerField(blank=True, null=True)
    created = models.DateTimeField()
    retired = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'license_purpose'


class LicenseTags(models.Model):
    user = models.CharField(primary_key=True, max_length=16)
    tag = models.CharField(max_length=256)

    class Meta:
        managed = False
        db_table = 'license_tags'


class Log(models.Model):
    id = models.IntegerField(primary_key=True)
    logtime = models.DateTimeField()
    ident = models.CharField(max_length=16)
    priority = models.IntegerField()
    message = models.CharField(max_length=200, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'log'


class LogIdSeq(models.Model):

    class Meta:
        managed = False
        db_table = 'log_id_seq'


class LpfeatsAllowed(models.Model):
    username = models.CharField(max_length=32)
    product = models.CharField(max_length=32)

    class Meta:
        managed = False
        db_table = 'lpfeats_allowed'
        unique_together = (('username', 'product'),)


class LpfeatsDelivery(models.Model):
    seq = models.AutoField(primary_key=True)
    username = models.CharField(max_length=32, blank=True, null=True)
    product = models.CharField(max_length=32, blank=True, null=True)
    created = models.DateTimeField()
    delivery = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'lpfeats_delivery'


class LpfeatsEmpname(models.Model):
    username = models.CharField(primary_key=True, max_length=32)
    empno = models.IntegerField()
    admin = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'lpfeats_empname'


class LpfeatsProducts(models.Model):
    product = models.CharField(primary_key=True, max_length=32)
    description = models.CharField(max_length=255, blank=True, null=True)
    type = models.CharField(max_length=32, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'lpfeats_products'


class News(models.Model):
    created = models.DateTimeField()
    revised = models.DateTimeField()
    level = models.IntegerField()
    author = models.CharField(max_length=48)
    summary = models.CharField(max_length=80)
    article = models.TextField()

    class Meta:
        managed = False
        db_table = 'news'


class PermEntries(models.Model):
    permission = models.CharField(unique=True, max_length=32)
    description = models.CharField(max_length=128)

    class Meta:
        managed = False
        db_table = 'perm_entries'


class PermUsers(models.Model):
    user = models.CharField(max_length=16)
    permission = models.CharField(max_length=32)

    class Meta:
        managed = False
        db_table = 'perm_users'


class PredatorArchive(models.Model):
    created = models.DateTimeField()
    user = models.CharField(max_length=32)
    license_archive_id = models.IntegerField()
    agreement = models.CharField(max_length=128, blank=True, null=True)
    installation = models.CharField(max_length=128)
    customer = models.CharField(max_length=128)
    start_date = models.DateField()
    end_date = models.DateField()
    es_date = models.DateField()
    lictype = models.CharField(max_length=32)
    server_id = models.CharField(max_length=128, blank=True, null=True)
    target_id = models.CharField(max_length=128, blank=True, null=True)
    features = models.TextField()
    email = models.CharField(max_length=256)

    class Meta:
        managed = False
        db_table = 'predator_archive'


class ServerStatus(models.Model):
    stamp = models.DateTimeField()
    server = models.CharField(max_length=128, blank=True, null=True)
    status = models.CharField(max_length=256, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'server_status'


class SimufactArchive(models.Model):
    created = models.DateTimeField()
    expiration = models.DateField()
    hostid = models.CharField(max_length=32)
    sid = models.CharField(max_length=32)
    type = models.CharField(max_length=8)
    sequence = models.IntegerField(unique=True)
    license = models.TextField()

    class Meta:
        managed = False
        db_table = 'simufact_archive'


class Status(models.Model):
    stamp = models.DateTimeField()
    process = models.CharField(max_length=32)
    mode = models.CharField(max_length=7)
    message = models.TextField()

    class Meta:
        managed = False
        db_table = 'status'


class Timezone(models.Model):
    zone_id = models.IntegerField()
    abbreviation = models.CharField(max_length=6)
    time_start = models.IntegerField()
    gmt_offset = models.IntegerField()
    dst = models.CharField(max_length=1)

    class Meta:
        managed = False
        db_table = 'timezone'


class TrialDesc(models.Model):
    template = models.CharField(max_length=33, blank=True, null=True)
    type = models.CharField(max_length=32, blank=True, null=True)
    description = models.CharField(max_length=128, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'trial_desc'


class TrialTemplates(models.Model):
    username = models.CharField(max_length=20, blank=True, null=True)
    template = models.CharField(max_length=33, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'trial_templates'


class TrialType(models.Model):
    typename = models.CharField(max_length=32, blank=True, null=True)
    typesort = models.CharField(max_length=32, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'trial_type'


class TrialUsers(models.Model):
    username = models.CharField(max_length=20, blank=True, null=True)
    reference = models.CharField(max_length=33, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'trial_users'


class UnsupportedFeatures(models.Model):
    feature = models.CharField(primary_key=True, max_length=48)

    class Meta:
        managed = False
        db_table = 'unsupported_features'


class Zone(models.Model):
    zone_id = models.AutoField(primary_key=True)
    country_code = models.CharField(max_length=2)
    zone_name = models.CharField(max_length=35)

    class Meta:
        managed = False
        db_table = 'zone'
