import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatefulWidget {
	const SignUpScreen({super.key});

	@override
	State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
	final _nameCtrl = TextEditingController();
	final _emailCtrl = TextEditingController();
	final _passwordCtrl = TextEditingController();
	bool _obscure = true;

	@override
	void dispose() {
		_nameCtrl.dispose();
		_emailCtrl.dispose();
		_passwordCtrl.dispose();
		super.dispose();
	}

	void _notImplemented() {
		ScaffoldMessenger.of(context).showSnackBar(
			SnackBar(content: Text('UI only - implement logic', style: GoogleFonts.poppins())),
		);
	}

	@override
	Widget build(BuildContext context) {
		final colorScheme = Theme.of(context).colorScheme;

		return Scaffold(
			body: SafeArea(
				child: Center(
					child: SingleChildScrollView(
						padding: const EdgeInsets.all(20),
						child: ConstrainedBox(
							constraints: const BoxConstraints(maxWidth: 480),
							child: Column(
								crossAxisAlignment: CrossAxisAlignment.stretch,
								children: [
									const SizedBox(height: 8),
									Text('Create account', style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.w700)),
									const SizedBox(height: 6),
									Text('Join us! Enter your details below', style: GoogleFonts.poppins(color: colorScheme.onSurface.withOpacity(0.7))),
									const SizedBox(height: 20),

									// Name
									Text('Full name', style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
									const SizedBox(height: 8),
									TextField(controller: _nameCtrl, decoration: InputDecoration(hintText: 'John Doe', border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)))),
									const SizedBox(height: 12),

									// Email
									Text('Email', style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
									const SizedBox(height: 8),
									TextField(controller: _emailCtrl, keyboardType: TextInputType.emailAddress, decoration: InputDecoration(hintText: 'you@example.com', border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)))),
									const SizedBox(height: 12),

									// Password
									Text('Password', style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
									const SizedBox(height: 8),
									TextField(
										controller: _passwordCtrl,
										obscureText: _obscure,
										decoration: InputDecoration(
											hintText: 'Create a password',
											border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
											suffixIcon: IconButton(icon: Icon(_obscure ? Icons.visibility : Icons.visibility_off), onPressed: () => setState(() => _obscure = !_obscure)),
										),
									),

									const SizedBox(height: 18),
									SizedBox(
										height: 48,
										child: ElevatedButton(onPressed: _notImplemented, child: Text('Sign up', style: GoogleFonts.poppins(fontWeight: FontWeight.w600))),
									),

									const SizedBox(height: 12),
									Row(mainAxisAlignment: MainAxisAlignment.center, children: [
										Text('Already have an account? ', style: GoogleFonts.poppins()),
										TextButton(onPressed: _notImplemented, child: Text('Sign in', style: GoogleFonts.poppins(color: colorScheme.primary))),
									]),

									const SizedBox(height: 12),
									Row(children: const [Expanded(child: Divider()), Padding(padding: EdgeInsets.symmetric(horizontal: 8.0), child: Text('or')), Expanded(child: Divider())]),
									const SizedBox(height: 12),

									// Minimal social sign-up row (visual)
									Row(children: [
										Expanded(child: OutlinedButton.icon(onPressed: _notImplemented, icon: const Icon(Icons.mail_outline), label: Text('Email', style: GoogleFonts.poppins()))),
										const SizedBox(width: 10),
										Expanded(child: OutlinedButton.icon(onPressed: _notImplemented, icon: const Icon(Icons.phone_android), label: Text('Phone', style: GoogleFonts.poppins()))),
									]),
								],
							),
						),
					),
				),
			),
		);
	}
}

