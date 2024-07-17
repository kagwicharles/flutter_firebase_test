import 'package:flutter/material.dart';

class PolynomialUtil {
  String derivePolynomial(String polynomial) {
    final RegExp termRegExp = RegExp(r'([+-]?\d*x?(\^(\d+))?)');
    final Iterable<RegExpMatch> matches = termRegExp.allMatches(polynomial);

    List<String> derivedTerms = [];

    for (final match in matches) {
      final term = match.group(0);
      if (term == null || term.isEmpty) {
        continue;
      }

      final RegExp termComponentsRegExp = RegExp(r'([+-]?\d*)(x?)(\^(\d+))?');
      final termComponents = termComponentsRegExp.firstMatch(term);

      if (termComponents != null) {
        final String coefficientStr = termComponents.group(1) ?? '';
        final String variable = termComponents.group(2) ?? '';
        final String exponentStr = termComponents.group(4) ?? '1';

        int coefficient = coefficientStr.isEmpty || coefficientStr == '+'
            ? 1
            : coefficientStr == '-'
                ? -1
                : int.parse(coefficientStr);
        int exponent = int.parse(exponentStr);

        if (variable.isEmpty && exponentStr == '1') {
          // Constant term
          continue;
        }

        if (exponent == 1) {
          // Linear term
          derivedTerms.add(coefficient.toString());
        } else {
          // Higher degree term
          coefficient *= exponent;
          exponent -= 1;
          if (exponent == 1) {
            derivedTerms.add('${coefficient}x');
          } else {
            derivedTerms.add('${coefficient}x^$exponent');
          }
        }
      }
    }

    var result = derivedTerms.join('+').replaceAll('+-', '-');
    debugPrint("polynomial result--->$result");
    return result;
  }
}
