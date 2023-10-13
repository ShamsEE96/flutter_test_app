class ARLanguage {
  static Map<String, String> get map => {
        //!--- general -------

        '404_status_error_message': 'المستخدم غير موجود',
        '401_status_error_message': 'حدث خطأ في المصادقة',

        'general_attention': 'تنبيه',
        'general_information': 'معلومات',
        'general_ok': 'موافق',
        'general_yes': 'نعم',
        'general_no': 'لا',
        'general_delete': 'حذف',
        'general_confirm_delete_message': 'تأكيد حذف البيانات',
        'general_field_required': 'الحقل مطلوب',
        'general_save': 'حفظ',
        'general_save_continue': 'حفظ ومتابعة',
        'general_edit': 'تعديل',
        'general_cancel': 'إلغاء',
        'general_confirm': 'تأكيد',
        'general_add_new': 'إضافة جديد',
        'general_logout': '!! تسجيل الخروج',
        "general_settings": "الإعدادت",
        "general_change_language": "تغيير اللغة",
        'general_confirm_logout_message': 'تأكيد تسجيل الخروج',
        'general_confirm_cancel_message': 'تأكيد عملية الإلغاء',
        'general_all': 'الكل',
        "general_add": "إضافة",
        "general_next": "التالي",
        "general_search": "بحث",
        "general_version": "نسخة",
        "general_delete_account": "حذف الحساب",
        "general_delete_account_warrning": "تحذير!!",
        "general_delete_account_warrning_massege":
            "هل أنت متأكد من رغبتك في حذف حسابك؟ هذا الإجراء لا يمكن التراجع عنه وسيؤدي إلى فقدان جميع بياناتك بشكل دائم.",
        "general_retry": "إعادة المحاولة",
        "general_error": "حدث خطأ",
        "general_name_404": "الاسم غير موجود",

        //!-- View title -----
        'view_title_menu': 'القائمة',
        'view_title_dashboard': 'الرئيسية',
        'view_title_orders': 'الطلبات',
        'view_title_customers': 'الزبائن',
        'view_title_settings': 'الإعدادات',

        //!--- View subtitle-----
        'view_sub_title_categories': 'التصنيفات',
        'view_sub_title_add_category': 'إضافة تصنيف',
        'view_sub_title_edit_category': 'تعديل تصنيف',
        'view_sub_title_meals': 'الوجبات',
        'view_sub_title_add_meal': 'اضافة وجبة',
        'view_sub_title_edit_meal': 'تعديل وجبة',
        'view_sub_title_add_new_meal': 'إضافة وجبة جديدة',
        'view_sub_title_search_for_meal': 'البحث عن وجبة',
        'view_sub_title_add_meal_image': 'إضافة صورة',
        'view_sub_title_tables': 'الطاولات',
        'view_sub_title_language': 'اللغة',

        //!--- Category --------
        'category_section_name': 'الاسم',
        'category_section_description': 'الوصف',
        'category_section_active': 'مفعل',

        //!--- Meal --------
        'meal_section_name': 'الاسم',
        'meal_section_code': 'الكود',
        'meal_section_price': 'السعر',
        'meal_section_description': 'الوصف',
        'meal_section_active': 'مفعل',
        'meal_section_no_category_message': 'الرجاء اضافة تصنيف واحد على الأقل',
        'meal_please_choose_image_message': 'الرجاء احتيار صورة',

        //!--- Customer -------
        'customer_search_for_customer': 'البحث عن زبون',
        'customer_informations': 'المعلومات',
        'customer_addresses': 'العنوان',
        'customer_firstname': 'الاسم الأول',
        'customer_lastname': 'الايم الأخير',
        'customer_phone': 'الهاتف',
        'customer_mobile': 'الجوال',
        'customer_email': 'البريد الإلكتروني',
        'customer_wrong_mobile': 'رقم جوال خاطئ',

        //!--- Addresses ------
        'address_add_new_address': 'إصافة عنوان جديد',
        'address_edit_address': 'تعديل العنوان',
        'address_title': 'الوصف',
        'address_contact_name': 'الاسم',
        'address_mobile': 'الجوال',
        'address_address_line': 'العنوان',

        //!--- Dashboard View ----
        'dashboard_total_revenue': 'اجمالي الإيرادات',
        'dashboard_total_dish_order': 'إجمالي الوجبات',
        'dashboard_total_customer': 'إجمالي الزبائن',
        'dashboard_order_filter': 'فلترة الطلب',
        'dashboard_date': 'التاريخ',
        'dashboard_amount': 'الكمية',
        'dashboard_status': 'الحالة',
        'dashboard_type': 'النوع',
        'dashboard_from': 'من',
        'dashboard_to': 'إلى',
        'dashboard_sales': 'المبيعات',
        'dashboard_order': 'الطلبيات',

        //!--- Order View ----
        'order_number': 'الرقم: ',
        'order_code': 'الكود: ',
        'order_time': 'الوقت: ',
        'order_status': 'الحالة: ',
        'order_type': 'النوع: ',
        'order_customer': 'الزبون: ',
        'order_total': 'الإجمالي',
        'order_type_word': 'نوع الطلب:',

        'order_status_draft': 'مسودة',
        'order_status_placed': 'تم ارساله',
        'order_status_perpare': 'جاري التحضير',
        'order_status_completed': 'مكتمل',
        'order_status_canceled': 'ملغى',
        'order_status_rejected': 'مرفوض',
        'order_status_confirmed': 'تم التأكيد',
        'order_status_ready': 'جاهز',
        'order_status_shipped': 'قيد التوصيل',
        'order_status_deliveried': 'تم التسليم',

        'order_action_accept': 'موافقة',
        'order_action_Reject': 'رفض',
        'order_action_prepar': 'تحضير',
        'order_action_complete': 'مكتمل',
        'order_action_cancel': 'الغاء',
        'order_action_shipping': 'بدء التوصيل',
        'order_action_deliveried': 'تسليم',

        //!--- Home View ----
        'home_add_item_message': 'الرجاء اضافة وجبة',
        'home_choose_table_message': 'الرجاء اختيار طاولة',
        'home_choose_customer_message': 'الرجاء اختيار زبون',
        'home_checkout': 'الدفع',
        'home_item': 'الوجبة',
        'home_qty': 'الكمية',
        'home_price': 'السعر',
        'home_orders': 'الطلبات: ',
        'home_order_note': 'ملاحظات',
        'home_order_details': 'تفاصيل الطلب',
        'home_customer_info': 'معلومات الزبون: ',
        'home_table_info': 'معلومات الطاولة:',
        'home_table_number': 'رقم الطاولة:',
        'home_customer': 'الزبون',
        'home_address': 'العنوان',
        'home_choose_customer_address': 'اختر الزبون',
        'home_choose_address': 'اختر عنوان التوصيل',
        'home_choose_table': 'اختر الطاولة',
        'home_total': 'الاجمالي',
        'home_item_count': 'عدد الوجبات:',
        'home_qty_total': 'إجمالي الكمية: ',
        'home_confirmation': 'تأكيد',
        'home_order_type_dinein': 'داخلي',
        'home_order_type_take_away': 'خارجي',
        'home_order_type_delivery': 'توصيل',
        'home_order_added_success': 'تمت إضافة الطلب بنجاح',

        //!--- Tables View ------
        'table_capacity': 'السعة',
        'table_name': 'الإسم',
        'table_description': 'الوصف',

        'login_singup_resturant': 'المطعم',
        'login_singup_email': 'البريد الإلكتروني',
        "login_singup_username": "اسم المستخدم",
        "login_singup_name": "الاسم",
        'login_singup_password': 'كلمة المرور',
        'login_singup_login': 'تسجيل الدخول',
        'login_singup_singup': 'تسجيل حساب جديد',
        "login_singup_register": "تسجيل",
        'login_singup_instead': 'Instead',
        "login_singup_your_company": "شركتك",
        "login_singup_phone": "الهاتف",
        'login_singup_confirm_password': 'تأكيد كلمة المرور',
        "login_singup_create_account": "انشاء حساب",
        'login_singup_have_account': 'لديك حساب؟',
        'login_singup_invalid_email': 'بريد الكتروني خاطئ',
        "login_singup_invalid_username": "اسم المستخدم خاطئ",
        'login_singup_invalid_password': 'كلمة المرور قصيرة جدا',
        "login_singup_old_password": "كلمة المرور القديمة",
        "login_singup_new_password": "كلمة المرور الجديدة",
        "login_singup_forgot_password": "نسيت كلمة المرور",
        "login_singup_reset_password": "استعادة كلمة المرور",
        "login_singup_change_password": "تغيير كلمة المرور",
        'login_singup_password_dont_match': 'كلمتا المرور غير متطابقتين',
        "login_singup_login_other_method": "او تسجيل الدخول عن طريق",
        "login_singup_login_with_google": "تسجيل الدخول باستخدام جوجل",
        "login_singup_login_with_facebook": "تسجيل الدخول باستخدام فيسبوك",
        "login_singup_login_with_email":
            "تسجيل الدخول باستخدام البريد الالكتروني",
        "login_singup_login_footer_line1": "بتسجيل الدخول، أنت توافق على",
        "login_singup_login_footer_line2_terms": "شروط الخدمة",
        "login_singup_login_footer_line2_and": "و",
        "login_singup_login_footer_line2_policy": "سياسة الخصوصية",

        "login_singup_forgot_password_enter_email":
            "يرجى إدخال بريدك الإلكتروني",
        "login_singup_verification_code_email_sent":
            "لقد قمنا بارسال رمز التحقق الى \n",
        "login_singup_verification_code_verify": "التحقق من الرمز",
        "login_singup_verification_code_change_email":
            "تغيير البريد الالكتروني",
        "login_singup_verification_code_resend_code": "اعادة ارسال رمز التحقق",
        "login_singup_new_password_desc": "الرجاء ادخال كلمة السر جديدة",

        "choose_language": "اللغة",
        'language_en': 'English',
        'language_ar': 'العربية',
        'language_tr': 'Türkçe',

        "main_view_bottom_navigation_bar_item_mycard": "بطاقتي",
        "main_view_bottom_navigation_bar_item_home": "الرئيسية",
        "main_view_bottom_navigation_bar_item_settings": "الإعدادت",
        "main_view_profile": "عرض الملف الشخصي",
        "main_edit_profile": "تعديل الملف الشخصي",
        "main_save_profile": "حفظ الملف الشخصي",
        "main_share_profile": "مشاركة الملف الشخصي",
        "main_edit_profile_add_display_name": "يرجى إدخال اسم العرض الخاص بك",
        "main_edit_profile_edit_app_link_add_success":
            "تم تحديث رابط التطبيق بنجاح",
        "main_edit_profile_edit_app_link_delete_success":
            "تم حذف رابط التطبيق بنجاح",
        'toast_general_success': "تمت العملية بنجاح",
        "toast_general_rejected": "حدث خطأ أثناء الاتصال بالخادم",
        "image_picker_camera": "الكاميرا",
        "image_picker_gallery": "المعرض",
        "app_link_add_new_link": "يرجى إدخال الرابط الخاص بك",
        "app_link_delete_link_desc":
            "هل أنت متأكد أنك تريد حذف رابط هذا التطبيق؟",
        "app_link_title": "يرجى اختيار نوع الرابط",
        "app_link_search_no_result": "لم يتم العثور على أية نتائج",

        "profile_apps_list_empty": "لا يوجد تطبيقات",

        "add_app_link": "إضافة رابط التطبيق",
        "landing_welcome": "مرحباً بك",
        "landing_welcome_message": "تقنية مبتكرة جديدة \nبانتظارك",
        "copy_to_clipboard": "نسخ إلى الحافظة",
        "copy_to_clipboard_app_link_success":
            "تم نسخ رابط التطبيق إلى الحافظة بنجاح",
        "main_share_profile_msg_sent": "تفضّل بزيارة ملفي الشخصي على ",

        "nfc_write": "الكتابة على NFC",
        "nfc_read": "القراءة من NFC",
        "nfc_scan_guide_msg":
            "من فضلك اتبع الإرشادات المرئية \n انقر ابدأ عندما تكون مستعد",
        "nfc_scan_start": "ابدأ ",
        "nfc_scan_msg_ios": "امسح العلامة الخاصة بك",
        "nfc_scan_msg_ios_multi_tags_found": "!تم العثور على عدة علامات",
        "nfc_write_success": "تم الكتابة بنجاح على تقنية NFC",
        "nfc_not_disabled_msg": "يرجى التأكد من تفعيل تقنية NFC",
        "nfc_ndf_not_supported_msg": "خطأ: تقنية NDEF غير مدعومة:",
        "nfc_not_supported_msg": "ليس مدعوم NFC على هذا الجهاز",
        "nfc_read_nothing": "لم يتم العثور على نتائج",

        "nfc_card_list_title": "قائمة بطاقات الحساب",
        "nfc_card_add_new": "إضافة بطاقة جديدة",
        "nfc_card_add_success": "تم تحديث البطاقة بنجاح",
        "nfc_card_delete_success": "تم حذف البطاقة بنجاح",
        "nfc_card_delete_warning_msg":
            "هل أنت متأكد أنك تريد حذف بطاقة NFC هذه؟",

        "check_connection": "يرجى التحقق من اتصالك بالإنترنت",

        "contact_card_bottomsheet_title": "بطاقة الاتصال",
        "contact_card_first_name": "الاسم الأول",
        "contact_card_last_name": "الاسم الأخير",
        "contact_card_organization": "المنظمة",
        "contact_card_title": "المسمى الوظيفي",
        "contact_card_phone": "رقم الهاتف",
        "contact_card_address": "العنوان",
        "contact_card_email": "البريد الإلكتروني",
        "contact_card_url ": "رابط الويب",
        "contact_card_personal": "شخصي",
        "contact_card_business": "عمل",
        'validator_empty_error': "هذا الحقل مطلوب!",
        'validator_general_error': "يرجى التأكد من ملء جميع الحقول",

        'direct_link_title': "اختر رابط مباشر",
        'direct_link_description':
            "عندما تقوم بالضغط على هاتف شخص ما،\n سيتم فتح هذا الرابط بدلاً من ملفك الشخصي الكامل.",
        'direct_link_success_message': "تم تحديث الرابط المباشر بنجاح.",
        'direct_link_edit_message': "هل ترغب في تعديل أو حذف الرابط المباشر؟",

        'filter_value': 'قيم الفلتر: ',
      };
}