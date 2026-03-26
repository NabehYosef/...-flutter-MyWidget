import 'package:flutter/material.dart';

class LoginScreen
    extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() =>
      _LoginScreenState();
}

class _LoginScreenState
    extends State<LoginScreen> {
  final _formKey =
      GlobalKey<FormState>();
  final _emailController =
      TextEditingController();
  final _passwordController =
      TextEditingController();

  bool _isPasswordVisible = false;
  bool _isLoading = false;
  bool _rememberMe = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    if (_formKey.currentState!
        .validate()) {
      setState(() => _isLoading = true);

      // محاكاة طلب الشبكة
      await Future.delayed(
          const Duration(seconds: 2));

      setState(
          () => _isLoading = false);

      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(
          SnackBar(
            content: const Text(
                'تم تسجيل الدخول بنجاح! 🎉'),
            backgroundColor:
                Colors.green.shade600,
            behavior: SnackBarBehavior
                .floating,
            shape:
                RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(
                      12),
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color(0xFFF5F5FF),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets
              .symmetric(
              horizontal: 24.0),
          child: Column(
            children: [
              const SizedBox(
                  height: 60),

              // ====== الشعار والعنوان ======
              _buildHeader(),

              const SizedBox(
                  height: 48),

              // ====== بطاقة النموذج ======
              _buildFormCard(),

              const SizedBox(
                  height: 24),

              // ====== تسجيل الدخول بحسابات أخرى ======
              _buildSocialLogin(),

              const SizedBox(
                  height: 32),

              // ====== رابط إنشاء الحساب ======
              _buildSignUpRow(),

              const SizedBox(
                  height: 24),
            ],
          ),
        ),
      ),
    );
  }

  // ============================
  // الشعار والعنوان
  // ============================
  Widget _buildHeader() {
    return Column(
      children: [
        Container(
          width: 90,
          height: 90,
          decoration: BoxDecoration(
            gradient:
                const LinearGradient(
              colors: [
                Color(0xFF6C63FF),
                Color(0xFF3B82F6)
              ],
              begin: Alignment.topLeft,
              end:
                  Alignment.bottomRight,
            ),
            borderRadius:
                BorderRadius.circular(
                    24),
            boxShadow: [
              BoxShadow(
                color: const Color(
                        0xFF6C63FF)
                    .withOpacity(0.4),
                blurRadius: 20,
                offset:
                    const Offset(0, 8),
              ),
            ],
          ),
          child: const Icon(
            Icons.lock_rounded,
            color: Colors.white,
            size: 44,
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'مرحباً بعودتك! 👋',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1E1B4B),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'سجّل دخولك للمتابعة',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey.shade600,
          ),
        ),
      ],
    );
  }

  // ============================
  // بطاقة النموذج
  // ============================
  Widget _buildFormCard() {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
            BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black
                .withOpacity(0.06),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment
                  .stretch,
          children: [
            // حقل البريد الإلكتروني
            _buildTextField(
              controller:
                  _emailController,
              label:
                  'البريد الإلكتروني',
              hint: 'example@email.com',
              icon:
                  Icons.email_outlined,
              keyboardType:
                  TextInputType
                      .emailAddress,
              validator: (value) {
                if (value == null ||
                    value.isEmpty) {
                  return 'يرجى إدخال البريد الإلكتروني';
                }
                if (!RegExp(
                        r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$')
                    .hasMatch(value)) {
                  return 'يرجى إدخال بريد إلكتروني صحيح';
                }
                return null;
              },
            ),

            const SizedBox(height: 20),

            // حقل كلمة المرور
            _buildTextField(
              controller:
                  _passwordController,
              label: 'كلمة المرور',
              hint: '••••••••',
              icon: Icons
                  .lock_outline_rounded,
              isPassword: true,
              validator: (value) {
                if (value == null ||
                    value.isEmpty) {
                  return 'يرجى إدخال كلمة المرور';
                }
                if (value.length < 6) {
                  return 'كلمة المرور يجب أن تكون 6 أحرف على الأقل';
                }
                return null;
              },
            ),

            const SizedBox(height: 16),

            // تذكرني + نسيت كلمة المرور
            Row(
              children: [
                GestureDetector(
                  onTap: () => setState(
                      () => _rememberMe =
                          !_rememberMe),
                  child: Row(
                    children: [
                      AnimatedContainer(
                        duration:
                            const Duration(
                                milliseconds:
                                    200),
                        width: 22,
                        height: 22,
                        decoration:
                            BoxDecoration(
                          color: _rememberMe
                              ? const Color(
                                  0xFF6C63FF)
                              : Colors
                                  .transparent,
                          border: Border
                              .all(
                            color: _rememberMe
                                ? const Color(
                                    0xFF6C63FF)
                                : Colors
                                    .grey
                                    .shade400,
                            width: 2,
                          ),
                          borderRadius:
                              BorderRadius
                                  .circular(
                                      6),
                        ),
                        child: _rememberMe
                            ? const Icon(
                                Icons
                                    .check,
                                color: Colors
                                    .white,
                                size:
                                    14)
                            : null,
                      ),
                      const SizedBox(
                          width: 8),
                      Text(
                        'تذكرني',
                        style:
                            TextStyle(
                          color: Colors
                              .grey
                              .shade700,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {},
                  style: TextButton
                      .styleFrom(
                    padding:
                        EdgeInsets.zero,
                    minimumSize:
                        Size.zero,
                    tapTargetSize:
                        MaterialTapTargetSize
                            .shrinkWrap,
                  ),
                  child: const Text(
                    'نسيت كلمة المرور؟',
                    style: TextStyle(
                      color: Color(
                          0xFF6C63FF),
                      fontSize: 14,
                      fontWeight:
                          FontWeight
                              .w600,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 28),

            // زر تسجيل الدخول
            _buildLoginButton(),
          ],
        ),
      ),
    );
  }

  // ============================
  // حقل الإدخال
  // ============================
  Widget _buildTextField({
    required TextEditingController
        controller,
    required String label,
    required String hint,
    required IconData icon,
    bool isPassword = false,
    TextInputType keyboardType =
        TextInputType.text,
    String? Function(String?)?
        validator,
  }) {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1E1B4B),
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          obscureText: isPassword &&
              !_isPasswordVisible,
          keyboardType: keyboardType,
          textDirection:
              TextDirection.ltr,
          validator: validator,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
                color: Colors
                    .grey.shade400),
            prefixIcon: Icon(icon,
                color: const Color(
                    0xFF6C63FF),
                size: 22),
            suffixIcon: isPassword
                ? IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons
                              .visibility_off_outlined
                          : Icons
                              .visibility_outlined,
                      color: Colors.grey
                          .shade500,
                      size: 22,
                    ),
                    onPressed: () =>
                        setState(() =>
                            _isPasswordVisible =
                                !_isPasswordVisible),
                  )
                : null,
            filled: true,
            fillColor:
                const Color(0xFFF8F8FF),
            border: OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(
                      14),
              borderSide: BorderSide(
                  color: Colors
                      .grey.shade200),
            ),
            enabledBorder:
                OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(
                      14),
              borderSide: BorderSide(
                  color: Colors
                      .grey.shade200),
            ),
            focusedBorder:
                OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(
                      14),
              borderSide:
                  const BorderSide(
                      color: Color(
                          0xFF6C63FF),
                      width: 2),
            ),
            errorBorder:
                OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(
                      14),
              borderSide:
                  const BorderSide(
                      color: Colors.red,
                      width: 1.5),
            ),
            focusedErrorBorder:
                OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(
                      14),
              borderSide:
                  const BorderSide(
                      color: Colors.red,
                      width: 2),
            ),
            contentPadding:
                const EdgeInsets
                    .symmetric(
                    vertical: 16,
                    horizontal: 16),
          ),
        ),
      ],
    );
  }

  // ============================
  // زر تسجيل الدخول
  // ============================
  Widget _buildLoginButton() {
    return AnimatedContainer(
      duration: const Duration(
          milliseconds: 200),
      height: 56,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF6C63FF),
            Color(0xFF3B82F6)
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius:
            BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color:
                const Color(0xFF6C63FF)
                    .withOpacity(0.45),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius:
              BorderRadius.circular(16),
          onTap: _isLoading
              ? null
              : _handleLogin,
          child: Center(
            child: _isLoading
                ? const SizedBox(
                    width: 24,
                    height: 24,
                    child:
                        CircularProgressIndicator(
                      color:
                          Colors.white,
                      strokeWidth: 2.5,
                    ),
                  )
                : const Text(
                    'تسجيل الدخول',
                    style: TextStyle(
                      color:
                          Colors.white,
                      fontSize: 17,
                      fontWeight:
                          FontWeight
                              .bold,
                      letterSpacing:
                          0.5,
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  // ============================
  // تسجيل الدخول الاجتماعي
  // ============================
  Widget _buildSocialLogin() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
                child: Divider(
                    color: Colors.grey
                        .shade300)),
            Padding(
              padding: const EdgeInsets
                  .symmetric(
                  horizontal: 16),
              child: Text(
                'أو تابع بـ',
                style: TextStyle(
                    color: Colors
                        .grey.shade500,
                    fontSize: 14),
              ),
            ),
            Expanded(
                child: Divider(
                    color: Colors.grey
                        .shade300)),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: _buildSocialButton(
                label: 'Google',
                color: Colors.white,
                textColor: const Color(
                    0xFF333333),
                icon: Icons
                    .g_mobiledata_rounded,
                iconColor: Colors.red,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _buildSocialButton(
                label: 'Apple',
                color: Colors.black,
                textColor: Colors.white,
                icon:
                    Icons.apple_rounded,
                iconColor: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSocialButton({
    required String label,
    required Color color,
    required Color textColor,
    required IconData icon,
    required Color iconColor,
  }) {
    return Container(
      height: 52,
      decoration: BoxDecoration(
        color: color,
        borderRadius:
            BorderRadius.circular(14),
        border: Border.all(
            color:
                Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black
                .withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius:
              BorderRadius.circular(14),
          onTap: () {},
          child: Row(
            mainAxisAlignment:
                MainAxisAlignment
                    .center,
            children: [
              Icon(icon,
                  color: iconColor,
                  size: 26),
              const SizedBox(width: 8),
              Text(
                label,
                style: TextStyle(
                  color: textColor,
                  fontWeight:
                      FontWeight.w600,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ============================
  // رابط إنشاء الحساب
  // ============================
  Widget _buildSignUpRow() {
    return Row(
      mainAxisAlignment:
          MainAxisAlignment.center,
      children: [
        Text(
          'ليس لديك حساب؟ ',
          style: TextStyle(
              color:
                  Colors.grey.shade600,
              fontSize: 15),
        ),
        GestureDetector(
          onTap: () {},
          child: const Text(
            'إنشاء حساب',
            style: TextStyle(
              color: Color(0xFF6C63FF),
              fontSize: 15,
              fontWeight:
                  FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
