import 'package:dartz/dartz.dart';
import '../error/failure.dart';

typedef FutureEither<T> = Future<Either<Failure, T>>;
// typedef StreamEither<T> = Stream<Either<Failure, T>>;

// /// Helper function to handle errors and convert them to Left<Failure>
// Future<Either<Failure, T>> handleFutureEither<T>(
//   Future<T> Function() function, {
//   String defaultErrorMessage = 'An unexpected error occurred',
// }) async {
//   try {
//     final result = await function();
//     return Right(result);
//   } catch (e) {
//     return Left(
//       UnexpectedFailure(
//         message: e.toString() != 'null' ? e.toString() : defaultErrorMessage,
//         exception: e,
//       ),
//     );
//   }
// }

// /// Helper function to transform a Stream into a StreamEither
// StreamEither<T> handleStreamEither<T>(
//   Stream<T> stream, {
//   String defaultErrorMessage = 'An unexpected error occurred',
// }) {
//   return stream
//       .map((data) => Right<Failure, T>(data))
//       .handleError(
//         (error) => Left<Failure, T>(
//           UnexpectedFailure(
//             message:
//                 error.toString() != 'null'
//                     ? error.toString()
//                     : defaultErrorMessage,
//             exception: error,
//           ),
//         ),
//       );
// }
