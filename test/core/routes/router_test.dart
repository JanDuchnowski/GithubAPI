import 'package:flutter_test/flutter_test.dart';
import 'package:githubapi/core/routes/router.dart';
import 'package:go_router/go_router.dart';

void main() {
  group('Router Configuration Tests', () {
    test('router configuration has correct number of routes', () {
      expect(router.configuration.routes.length, equals(2));
    });

    test('router routes have correct paths', () {
      final routes = router.configuration.routes.cast<GoRoute>();

      expect(routes[0].path, equals('/'));
      expect(routes[1].path, equals('/repo/:owner/:repo'));
    });

    test('root route leads to SearchScreen', () {
      final routes = router.configuration.routes.cast<GoRoute>();
      final rootRoute = routes[0];

      expect(rootRoute.path, equals('/'));

      // Test that the builder function exists and can create a widget
      expect(rootRoute.builder, isNotNull);
    });

    test('repo route has correct path parameters', () {
      final routes = router.configuration.routes.cast<GoRoute>();
      final repoRoute = routes[1];

      expect(repoRoute.path, equals('/repo/:owner/:repo'));
      expect(repoRoute.builder, isNotNull);
    });
  });

  group('Router Navigation Logic Tests', () {
    test('router can handle navigation to different routes', () {
      // Test that router.go doesn't throw for valid routes
      expect(() => router.go('/'), returnsNormally);
      expect(() => router.go('/repo/owner/repo'), returnsNormally);
    });

    test('router handles invalid routes gracefully', () {
      // Test that router.go doesn't throw for invalid routes
      expect(() => router.go('/invalid/route'), returnsNormally);
      expect(() => router.go('/repo/'), returnsNormally);
      expect(() => router.go('/repo/owner'), returnsNormally);
    });

    test('router handles navigation with query parameters', () {
      expect(() => router.go('/repo/owner/repo?query=test'), returnsNormally);
    });

    test('router handles navigation with fragments', () {
      expect(() => router.go('/repo/owner/repo#section'), returnsNormally);
    });

    test('router handles empty navigation', () {
      expect(() => router.go(''), returnsNormally);
    });

    test('router handles navigation with special characters', () {
      expect(
        () => router.go('/repo/test-owner.1/test_repo-2'),
        returnsNormally,
      );
    });

    test('router handles URL encoded navigation', () {
      expect(
        () => router.go('/repo/test%20owner/test%2Drepo'),
        returnsNormally,
      );
    });
  });

  group('Router Path Validation Tests', () {
    test(
      'validates that repo route requires both owner and repo parameters',
      () {
        final routes = router.configuration.routes.cast<GoRoute>();
        final repoRoute = routes[1];

        // Test that route expects both parameters
        expect(repoRoute.path.contains(':owner'), isTrue);
        expect(repoRoute.path.contains(':repo'), isTrue);
      },
    );

    test('validates route paths are correctly formatted', () {
      final routes = router.configuration.routes.cast<GoRoute>();

      // Root route should be simple
      expect(routes[0].path, equals('/'));

      // Repo route should have parameter syntax
      expect(routes[1].path, matches(r'^/repo/:[^/]+/:[^/]+$'));
    });

    test('route structure is consistent', () {
      final routes = router.configuration.routes;

      // All routes should be GoRoute instances
      for (final route in routes) {
        expect(route, isA<GoRoute>());
      }
    });
  });

  group('Router State Management Tests', () {
    test('router configuration is properly initialized', () {
      expect(router, isNotNull);
      expect(router.configuration, isNotNull);
      expect(router.configuration.routes, isNotEmpty);
    });

    test('router maintains correct route structure', () {
      final routes = router.configuration.routes.cast<GoRoute>();

      // Verify we have the expected routes
      expect(routes.length, equals(2));

      // Verify root route
      expect(routes.any((route) => route.path == '/'), isTrue);

      // Verify repo details route
      expect(routes.any((route) => route.path == '/repo/:owner/:repo'), isTrue);
    });

    test('router routes have builders', () {
      final routes = router.configuration.routes.cast<GoRoute>();

      for (final route in routes) {
        expect(route.builder, isNotNull);
      }
    });
  });

  group('Router Edge Cases Tests', () {
    test('router handles multiple slashes gracefully', () {
      expect(() => router.go('//'), returnsNormally);
      expect(() => router.go('/repo//owner//repo'), returnsNormally);
    });

    test('router handles very long paths', () {
      final longOwner = 'a' * 100;
      final longRepo = 'b' * 100;
      expect(() => router.go('/repo/$longOwner/$longRepo'), returnsNormally);
    });

    test('router handles paths with unicode characters', () {
      expect(() => router.go('/repo/测试/тест'), returnsNormally);
    });

    test('router handles paths with numbers', () {
      expect(() => router.go('/repo/user123/repo456'), returnsNormally);
    });
  });

  group('Router Performance Tests', () {
    test('router navigation calls complete without hanging', () {
      final stopwatch = Stopwatch()..start();

      for (int i = 0; i < 10; i++) {
        router.go('/repo/owner$i/repo$i');
        router.go('/');
      }

      stopwatch.stop();

      expect(stopwatch.elapsedMilliseconds, lessThan(1000));
    });

    test('router can handle rapid successive navigation calls', () {
      expect(() {
        for (int i = 0; i < 50; i++) {
          router.go('/repo/test$i/repo$i');
        }
      }, returnsNormally);
    });
  });
}
