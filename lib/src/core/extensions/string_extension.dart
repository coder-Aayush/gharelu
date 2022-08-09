extension StringX on String ***REMOVED***
  bool validatePassword() =>
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).***REMOVED***8,***REMOVED***$')
          .hasMatch(this);
***REMOVED***
