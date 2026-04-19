import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lactos_app_with_provider/provider/authentication_provider.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatefulWidget {
	const SignInScreen({super.key});

	@override
	State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
	final _emailController = TextEditingController();
	final _passwordController = TextEditingController();
	bool _obscure = true;
	bool _remember = false;
	bool _dialogShown = false;  // ✅ track if dialog is already shown

	@override
	void dispose() {
		_emailController.dispose();
		_passwordController.dispose();
		super.dispose();
	}

	void _showLoadingDialog() {
		showDialog(
			context: context,
			barrierDismissible: false,
			builder: (ctx) => AlertDialog(
				content: Row(
					children: [
						const CircularProgressIndicator(),
						const SizedBox(width: 16),
						Text('Signing in...', style: GoogleFonts.poppins()),
					],
				),
			),
		);
	}

	void _hideLoadingDialog() {
		if (Navigator.of(context).canPop()) {
			Navigator.of(context).pop();
		}
	}

	void _showNotImplemented() {
		ScaffoldMessenger.of(context).showSnackBar(
			SnackBar(content: Text('Not implemented — UI only', style: GoogleFonts.poppins())),
		);
	}

	@override
	Widget build(BuildContext context) {
		final colorScheme = Theme.of(context).colorScheme;
		final w = MediaQuery.of(context).size.width;
		return Scaffold(
			body: SafeArea(
				child: Center(
					child: SingleChildScrollView(
						padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 36.0),
						child: ConstrainedBox(
							constraints: BoxConstraints(maxWidth: w > 520 ? 520 : w),
							child: Column(
								crossAxisAlignment: CrossAxisAlignment.stretch,
								children: [
									// Branding
									Column(
										crossAxisAlignment: CrossAxisAlignment.center,
										children: [
											Container(
												width: 72,
												height: 72,
												decoration: BoxDecoration(
													color: colorScheme.primary.withOpacity(0.12),
													shape: BoxShape.circle,
												),
												child: Icon(Icons.lock_outline, size: 36, color: colorScheme.primary),
											),
											const SizedBox(height: 12),
											Text('Welcome back', style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w600)),
											const SizedBox(height: 6),
											Text('Sign in to continue', style: GoogleFonts.poppins(color: colorScheme.onSurface.withOpacity(0.7))),
										],
									),

									const SizedBox(height: 28),

									// Email field
									Text('Email', style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
									const SizedBox(height: 8),
									TextField(
										controller: _emailController,
										keyboardType: TextInputType.emailAddress,
										decoration: InputDecoration(
											hintText: 'you@example.com',
											border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
											prefixIcon: const Icon(Icons.email_outlined),
										),
									),

									const SizedBox(height: 14),

									// Password field
									Text('Password', style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
									const SizedBox(height: 8),
									TextField(
										controller: _passwordController,
										obscureText: _obscure,
										decoration: InputDecoration(
											hintText: 'Enter your password',
											border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
											prefixIcon: const Icon(Icons.lock_outline),
											suffixIcon: IconButton(
												icon: Icon(_obscure ? Icons.visibility : Icons.visibility_off),
												onPressed: () => setState(() => _obscure = !_obscure),
											),
										),
									),

									const SizedBox(height: 12),

									// Remember + forgot
									Row(
										mainAxisAlignment: MainAxisAlignment.spaceBetween,
										children: [
											Row(
												children: [
													Checkbox(value: _remember, onChanged: (v) => setState(() => _remember = v ?? false)),
													const SizedBox(width: 6),
													Text('Remember me', style: GoogleFonts.poppins()),
												],
											),
											TextButton(
												onPressed: _showNotImplemented,
												child: Text('Forgot?', style: GoogleFonts.poppins(color: colorScheme.primary)),
											),
										],
									),

									const SizedBox(height: 16),

									// Sign in button with loading state
									Consumer<AuthenticationProvider>(
										builder: (context, authProvider, child) {
											// Show loading dialog only once when isLoading becomes true
											if (authProvider.isLoading && !_dialogShown) {
												_dialogShown = true;
												WidgetsBinding.instance.addPostFrameCallback((_) {
													_showLoadingDialog();
												});
											}

											// Hide loading dialog and show error if needed
											if (!authProvider.isLoading && _dialogShown) {
												_dialogShown = false;
												WidgetsBinding.instance.addPostFrameCallback((_) {
													_hideLoadingDialog();
													if (authProvider.errorMessage != null) {
														ScaffoldMessenger.of(context).showSnackBar(
															SnackBar(
																content: Text(authProvider.errorMessage ?? 'Error occurred'),
																backgroundColor: Colors.red,
															),
														);
													} else if (authProvider.token != null) {
												
														ScaffoldMessenger.of(context).showSnackBar(
															SnackBar(
																content: Text('Login successful!', style: GoogleFonts.poppins()),
																backgroundColor: Colors.green,
															),
														);
													}
												});
											}

											return SizedBox(
												height: 48,
												child: ElevatedButton(
													onPressed: authProvider.isLoading
														? null
														: () {
															if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
																ScaffoldMessenger.of(context).showSnackBar(
																	const SnackBar(content: Text('Please fill all fields')),
																);
																return;
															}
															authProvider.signIn(_emailController.text, _passwordController.text);
														},
													style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
													child: Text('Sign in', style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600)),
												),
											);
										},
									),

									const SizedBox(height: 14),

									// Or divider
									Row(children: [
										const Expanded(child: Divider()),
										Padding(
											padding: const EdgeInsets.symmetric(horizontal: 12.0),
											child: Text('or continue with', style: GoogleFonts.poppins(fontSize: 12, color: colorScheme.onSurface.withOpacity(0.6))),
										),
										const Expanded(child: Divider()),
									]),

									const SizedBox(height: 12),

									// Social buttons
									Row(
										children: [
											Expanded(
												child: OutlinedButton.icon(
													onPressed: _showNotImplemented,
													icon: Image.asset('assets/google_logo.png', height: 18, width: 18, errorBuilder: (c,_,__) => const Icon(Icons.g_mobiledata)),
													label: Text('Google', style: GoogleFonts.poppins()),
													style: OutlinedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 12)),
												),
											),
											const SizedBox(width: 12),
											Expanded(
												child: OutlinedButton.icon(
													onPressed: _showNotImplemented,
													icon: const Icon(Icons.apple),
													label: Text('Apple', style: GoogleFonts.poppins()),
													style: OutlinedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 12)),
												),
											),
										],
									),

									const SizedBox(height: 20),

									// Sign up link
									Row(
										mainAxisAlignment: MainAxisAlignment.center,
										children: [
											Text("Don't have an account? ", style: GoogleFonts.poppins()),
											TextButton(onPressed: _showNotImplemented, child: Text('Sign up', style: GoogleFonts.poppins(color: colorScheme.primary))),
										],
									),
								],
							),
						),
					),
				),
			),
		);
	}
}

