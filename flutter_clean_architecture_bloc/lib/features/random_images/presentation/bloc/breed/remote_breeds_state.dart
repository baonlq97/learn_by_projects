part of 'remote_breeds_bloc.dart';

sealed class RemoteBreedsState extends Equatable {
  const RemoteBreedsState();
  
  @override
  List<Object> get props => [];
}

final class RemoteBreedsLoading extends RemoteBreedsState {}
