import 'package:flutter/material.dart';

class _FormUser {
  final String username;
  final _Role role;

  _FormUser({required this.username, required this.role});

  void printDetails() {
    print('Nutzer $username (Rolle $role)');
  }
}

enum _Role {
  admin, user
}

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  _Role? _selectedRole;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _usernameController,
                validator: (text) {
                  if (text == null || text.length < 3) {
                    return 'Der Nutzername sollte mindestens 3 Zeichen lang sein.';
                  }

                  return null;
                },
              ),
              const SizedBox(height: 20.0),
              DropdownButtonFormField<_Role>(
                value: _selectedRole,
                items: const [
                  DropdownMenuItem(value: _Role.user, child: Text('Nutzer')),
                  DropdownMenuItem(value: _Role.admin, child: Text('Admin')),
                ],
                onChanged: (role) => _selectedRole = role,
                validator: (role) {
                  if (role == null) {
                    return 'Bitte wähle eine Rolle aus.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      final formUser = _FormUser(
                          username: _usernameController.text,
                          role: _selectedRole!,
                      );
                      formUser.printDetails();
                    }
                  },
                  child: const Text('Absenden')
              ),
            ],
          ),
        ),
      ),
    );
  }
}
