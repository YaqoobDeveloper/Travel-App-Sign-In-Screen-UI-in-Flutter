import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/traverlo/traverlo_components.dart';
import '../theme/traverlo_colors.dart';
import '../utils/validators.dart';

enum _Social { facebook, google, apple }

class TraverloLoginScreen extends StatefulWidget {
  const TraverloLoginScreen({super.key});

  @override
  State<TraverloLoginScreen> createState() => _TraverloLoginScreenState();
}

class _TraverloLoginScreenState extends State<TraverloLoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  _Social _social = _Social.facebook;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _showMessage(String text) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(text)));
  }

  void _signIn() {
    FocusScope.of(context).unfocus();
    if (!_formKey.currentState!.validate()) return;
    _showMessage('Signed in as ${_emailController.text}');
  }

  Future<void> _pasteEmail() async {
    final data = await Clipboard.getData(Clipboard.kTextPlain);
    final text = data?.text?.trim();
    if (text == null || text.isEmpty) return;
    _emailController.text = text;
  }

  void _selectSocial(_Social social, String name) {
    setState(() => _social = social);
    _showMessage('Continue with $name');
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: Stack(
          children: [
            const Positioned.fill(child: SparkleBackground()),
            SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(24, 32, 24, 24),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 420),
                    child: _buildContent(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Center(child: BrandLogo(name: 'Traverlo')),
          const SizedBox(height: 28),
          Text(
            'Sign in',
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: TraverloColors.text,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Please fill your information',
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(fontSize: 14, color: TraverloColors.muted),
          ),
          const SizedBox(height: 28),
          GlassCard(
            children: [
              CardTextField(
                controller: _emailController,
                label: 'Email',
                hint: 'you@gmail.com',
                trailingIcon: Icons.content_paste_rounded,
                onTrailingTap: _pasteEmail,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                validator: Validators.email,
              ),
              CardPasswordField(
                controller: _passwordController,
                onSubmitted: (_) => _signIn(),
                validator: Validators.password,
              ),
            ],
          ),
          const SizedBox(height: 24),
          PrimaryButton(label: 'Sign in now', onTap: _signIn),
          const SizedBox(height: 10),
          Center(
            child: UnderlineLink(
              label: 'Sign up',
              onTap: () => _showMessage('Sign up coming soon'),
            ),
          ),
          const SizedBox(height: 20),
          const OrDivider(label: 'or continue with'),
          const SizedBox(height: 18),
          SocialOptionTile(
            icon: Container(
              width: 32,
              height: 32,
              decoration: const BoxDecoration(
                color: TraverloColors.blue,
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: FaIcon(
                  FontAwesomeIcons.facebookF,
                  size: 15,
                  color: Colors.white,
                ),
              ),
            ),
            label: 'Facebook',
            selected: _social == _Social.facebook,
            onTap: () => _selectSocial(_Social.facebook, 'Facebook'),
          ),
          const SizedBox(height: 12),
          SocialOptionTile(
            icon: const FaIcon(
              FontAwesomeIcons.google,
              size: 17,
              color: Colors.white,
            ),
            label: 'Google',
            selected: _social == _Social.google,
            onTap: () => _selectSocial(_Social.google, 'Google'),
          ),
          const SizedBox(height: 12),
          SocialOptionTile(
            icon: const FaIcon(
              FontAwesomeIcons.apple,
              size: 20,
              color: Colors.white,
            ),
            label: 'Apple',
            selected: _social == _Social.apple,
            onTap: () => _selectSocial(_Social.apple, 'Apple'),
          ),
        ],
      ),
    );
  }
}
