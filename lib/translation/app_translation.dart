import 'package:get/get.dart';

class AppTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en': {
      // Auth
      'login': 'Login',
      'register': 'Register',
      'login_to_account': 'Log in to your account',
      'create_account': 'Create Account',
      'welcome': 'Welcome',

      // User info
      'first_name': 'First Name',
      'last_name': 'Last Name',
      'email': 'Email',
      'phone': 'Phone number',
      'password': 'Password',
      'confirm_password': 'Confirm Password',
      'remember_me': 'Remember me',
      'role': 'Role',

      // Images
      'personal_image': 'Personal image',
      'id_image': 'ID image',

      'filter': 'Filter',
      'remove_filter': 'Remove Filter',
      'choose_filter': 'Choose Filter Type',
      'city': 'City',
      'price': 'Price',
      'governorate': 'Governorate',
      'area': 'Area',
      'rooms': 'Rooms',
      'close': 'Close',
      'min_price': 'Min Price',
      'max_price': 'Max Price',
      'min_area': 'Min Area',
      'max_area': 'Max Area',

      'flat_details': 'Flat Details',
      'book_now': 'Book Now',
      'specifications': 'Specifications',
      'halls': 'Halls',
      'bathrooms': 'Bathrooms',
      'status': 'Status',
      'average_rate': 'Average Rate',
      'book_hint': 'If you want to book',
      'no_description': 'No description',

      'verification': 'Verification',
      'verify': 'Verify',
      'resend_code': 'Resend Code',

      'admin': 'Admin',
      'registration_request': 'Registration Request',
      'delete_requests': 'Delete Requests',

      'registration_applications': 'Registration Applications',
      'registration_number': 'Registration number',
      'no_requests': 'No Requests Found',
      'reject': 'Reject',
      'accept': 'Accept',
      'request_rejected': 'The Request is Rejected Successfully',
      'request_accepted': 'The Request is Accepted Successfully',
      'error': 'Error',
      'failed_reject': 'Failed to Reject user',
      'failed_accept': 'Failed to approve user',
      'date_of_birth': 'Date Of Birth',
      'personal_photo': 'Personal Photo',
      'id_photo': 'ID Card Photo',

      'add_apartment': 'Add Apartment',
      'update_apartment': 'Update Apartment',
      'add_details': 'Add apartment details',
      'update_details': 'Update apartment details',

      'from_gallery': 'From Gallery',
      'from_camera': 'From Camera',
      'no_images': 'No images selected',
      'rental_price': 'Rental Price',
      'address': 'Address',
      'description': 'Description',
      'send': 'Send',
      'update': 'Update',

      'tenant_home_title': 'Tenant Home',
      'my_apartments': 'My Apartments',
      'booking_requests': 'Booking Requests',

      'current_users': 'Current Users',
      'no_users': 'No users',
      'remove_user': 'Remove User',
      'delete': 'Delete',
      'cancel': 'Cancel',
      'confirm_delete': 'Do you want to delete',
      'about_us': 'About Us',

      'settings': 'Settings',
      'dark_mode': 'Dark Mode',
      'delete_account': 'Delete My Account',
      'username': 'Username',
      'phone_number': 'Phone Number',




    },

    'ar': {
      // Auth
      'login': 'تسجيل الدخول',
      'register': 'إنشاء حساب',
      'login_to_account': 'تسجيل الدخول إلى حسابك',
      'create_account': 'إنشاء حساب',
      'welcome': 'مرحباً',

      // User info
      'first_name': 'الاسم الأول',
      'last_name': 'اسم العائلة',
      'email': 'البريد الإلكتروني',
      'phone': 'رقم الهاتف',
      'password': 'كلمة المرور',
      'confirm_password': 'تأكيد كلمة المرور',
      'remember_me': 'تذكرني',
      'role': 'الدور',

      // Images
      'personal_image': 'صورة شخصية',
      'id_image': 'صورة الهوية',

      'filter': 'فلترة',
      'remove_filter': 'إزالة الفلتر',
      'choose_filter': 'اختر نوع الفلترة',
      'city': 'المدينة',
      'price': 'السعر',
      'governorate': 'المحافظة',
      'area': 'المساحة',
      'rooms': 'الغرف',
      'close': 'إغلاق',
      'min_price': 'أقل سعر',
      'max_price': 'أعلى سعر',
      'min_area': 'أقل مساحة',

      'flat_details': 'تفاصيل العقار',
      'book_now': 'احجز الآن',
      'specifications': 'المواصفات',
      'halls': 'الصالات',
      'bathrooms': 'الحمامات',
      'status': 'الحالة',
      'average_rate': 'المعدل العام',
      'book_hint': 'إذا كنت ترغب بالحجز',
      'no_description': 'لا يوجد وصف',


      'verification': 'التحقق',
      'verify': 'تأكيد',
      'resend_code': 'إعادة إرسال الرمز',

      'admin': 'المشرف',
      'registration_request': 'طلبات التسجيل',
      'delete_requests': 'طلبات الحذف',

      'registration_applications': 'طلبات التسجيل',
      'registration_number': 'رقم الطلب',
      'no_requests': 'لا توجد طلبات',
      'reject': 'رفض',
      'accept': 'قبول',
      'request_rejected': 'تم رفض الطلب بنجاح',
      'request_accepted': 'تم قبول الطلب بنجاح',
      'error': 'خطأ',
      'failed_reject': 'فشل في رفض الطلب',
      'failed_accept': 'فشل في قبول الطلب',

      'date_of_birth': 'تاريخ الميلاد',
      'personal_photo': 'الصورة الشخصية',
      'id_photo': 'صورة الهوية',

      'add_apartment': 'إضافة شقة',
      'update_apartment': 'تحديث الشقة',
      'add_details': 'إضافة تفاصيل الشقة',
      'update_details': 'تعديل تفاصيل الشقة',

      'from_gallery': 'من المعرض',
      'from_camera': 'من الكاميرا',
      'no_images': 'لا توجد صور',
      'rental_price': 'سعر الإيجار',
      'address': 'العنوان',
      'description': 'الوصف',
      'send': 'إرسال',
      'update': 'تحديث',

      'tenant_home_title': 'صفحة المستأجر',
      'my_apartments': 'شققـي',
      'booking_requests': 'طلبات الحجز',

      'current_users': 'المستخدمون الحاليون',
      'no_users': 'لا يوجد مستخدمون',
      'remove_user': 'حذف المستخدم',
      'delete': 'حذف',
      'cancel': 'إلغاء',
      'confirm_delete': 'هل تريد حذف',
      'about_us': 'من نحن',

      'settings': 'الإعدادات',
      'dark_mode': 'الوضع الداكن',
      'delete_account': 'حذف حسابي',
      'username': 'اسم المستخدم',
      'phone_number': 'رقم الهاتف',

    },
  };
}
