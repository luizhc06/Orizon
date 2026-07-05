enum SiteStatusState { checking, online, offline }

class SiteStatus {
  final String sourceId;
  final String name;
  final String baseUrl;
  final SiteStatusState state;
  final int? latencyMs;

  const SiteStatus({
    required this.sourceId,
    required this.name,
    required this.baseUrl,
    required this.state,
    this.latencyMs,
  });

  SiteStatus copyWith({SiteStatusState? state, int? latencyMs}) => SiteStatus(
    sourceId: sourceId,
    name: name,
    baseUrl: baseUrl,
    state: state ?? this.state,
    latencyMs: latencyMs ?? this.latencyMs,
  );
}
