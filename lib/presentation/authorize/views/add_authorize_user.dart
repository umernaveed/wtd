import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:we_ship_faas/app/core/get_di.dart';
import 'package:we_ship_faas/app/util/flush_snackbar.dart';
import 'package:we_ship_faas/data/models/all_authorize_users_response/all_authorize_users_response.dart';
import 'package:we_ship_faas/presentation/auth/views/login_screen.dart';
import 'package:we_ship_faas/presentation/auth/widgets/text_field.dart';
import 'package:we_ship_faas/presentation/authorize/controllers/add_authorize_user_controller.dart';
import 'package:we_ship_faas/presentation/base_screen.dart';
import 'package:we_ship_faas/presentation/bottom_nav/controllers/bottom_nav_controller.dart';
import 'package:we_ship_faas/presentation/dashboard/views/dashboard.dart';

class AddAuthorizeUser extends GetView<AddAuthorizeUserController> {
  const AddAuthorizeUser({super.key});

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments;
    final isEditing = args != null;
    final user = isEditing
        ? args as AuthorizeUsersResponse
        : AuthorizeUsersResponse.empty();

    return BaseScreen(
      wrapWithAnnotatedRegion: true,
      value: SystemUiOverlayStyle.dark,
      backgroundColor: Dashboard.pageBg,
      showGradients: false,
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(18, 8, 18, 126),
          child: Column(
            children: [
              const _PageHeader(),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(18, 18, 18, 20),
                decoration: _cardDecoration(),
                child: FormBuilder(
                  key: controller.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const _TileIcon(
                            icon: Icons.person_add_alt_1_outlined,
                            iconColor: Dashboard.blue,
                            background: Color(0xFFE6F5FA),
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Text(
                              isEditing
                                  ? 'Update Authorize User'
                                  : 'Add Authorize User',
                              style: const TextStyle(
                                color: Dashboard.darkBlue,
                                fontSize: 20,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        'Manage people authorized for package pickup.',
                        style: TextStyle(
                          color: Color(0xFF4D566B),
                          fontSize: 13,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 22),
                      AppTextField(
                        title: 'Name',
                        hint: 'Name',
                        name: 'name',
                        initialValue: user.name,
                        validator: FormBuilderValidators.compose(
                          [FormBuilderValidators.required()],
                        ),
                      ),
                      const SizedBox(height: 20),
                      AppTextField(
                        title: 'Phone #',
                        hint: 'Phone #',
                        name: 'phone',
                        initialValue: user.phone,
                        keyboardType: TextInputType.phone,
                        validator: FormBuilderValidators.compose(
                          [
                            FormBuilderValidators.required(),
                            FormBuilderValidators.numeric(),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      AppTextField(
                        title: 'ID/Proof',
                        hint: 'ID/Proof',
                        name: 'proof',
                        initialValue: user.proof,
                        validator: FormBuilderValidators.compose(
                          [FormBuilderValidators.required()],
                        ),
                      ),
                      const SizedBox(height: 28),
                      AppButton(
                        title: 'Submit',
                        onTap: () {
                          final bottomNavNestedID =
                              find<BottomNavController>().bottomNavNestedID;
                          controller
                              .onSubmit(
                                  isEditing: isEditing, idForUpdate: user.id)
                              .then((value) {
                            if (!value.isDone) return;
                            Get.back(id: bottomNavNestedID);
                            if (value.message.isNotEmpty) {
                              FlushSnackbar.showSnackBar(value.message);
                            }
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PageHeader extends StatelessWidget {
  const _PageHeader();
  @override
  Widget build(BuildContext context) => SafeArea(
        bottom: false,
        child: SizedBox(
          height: 96,
          child: Stack(alignment: Alignment.center, children: [
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon: const Icon(Icons.chevron_left_rounded),
                color: Dashboard.darkBlue,
                iconSize: 38,
                onPressed: () => Get.back<void>(),
              ),
            ),
            const _LiteLogo(),
          ]),
        ),
      );
}

class _LiteLogo extends StatelessWidget {
  const _LiteLogo();

  @override
  Widget build(BuildContext context) => Image.asset(
        'assets/images/brand_logo.png',
        width: 126,
        height: 58,
        fit: BoxFit.contain,
      );
}

class _TileIcon extends StatelessWidget {
  const _TileIcon({required this.icon, required this.iconColor, required this.background});
  final IconData icon;
  final Color iconColor;
  final Color background;
  @override
  Widget build(BuildContext context) => Container(
        width: 42,
        height: 42,
        alignment: Alignment.center,
        decoration: BoxDecoration(color: background, borderRadius: BorderRadius.circular(10)),
        child: Icon(icon, color: iconColor, size: 27),
      );
}

BoxDecoration _cardDecoration() => BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: const Color(0xFFF0F4FA)),
      boxShadow: [BoxShadow(color: const Color(0xFF8CA7CA).withOpacity(0.12), offset: const Offset(0, 8), blurRadius: 20)],
    );
