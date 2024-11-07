// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderResponseImpl _$$OrderResponseImplFromJson(Map<String, dynamic> json) =>
    _$OrderResponseImpl(
      projects: (json['data'] as List<dynamic>?)
          ?.map((e) => Order.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$OrderResponseImplToJson(_$OrderResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.projects,
    };

_$OrderImpl _$$OrderImplFromJson(Map<String, dynamic> json) => _$OrderImpl(
      id: json['id'] as int?,
      name: json['name'] as String?,
      provider: json['provider'] == null
          ? null
          : Providers.fromJson(json['provider'] as Map<String, dynamic>),
      proposals: (json['proposals'] as List<dynamic>?)
              ?.map((e) => Proposals.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      status: json['status'] as String?,
      location_lat: (json['location_lat'] as num?)?.toDouble(),
      location_lang: (json['location_lang'] as num?)?.toDouble(),
      description: json['description'] as String?,
      reviewed: json['reviewed'] as bool?,
      have_a_proposal: json['have_a_proposal'] as bool?,
      available_time: json['available_time'] as String?,
      equipment_cost: (json['equipment_cost'] as num?)?.toDouble() ?? 0,
      avg_rate: (json['avg_rate'] as num?)?.toDouble(),
      attachment_audios: (json['attachment_audios'] as List<dynamic>?)
          ?.map((e) => Attachment.fromJson(e as Map<String, dynamic>))
          .toList(),
      attachment_images: (json['attachment_images'] as List<dynamic>?)
          ?.map((e) => Attachment.fromJson(e as Map<String, dynamic>))
          .toList(),
      attachments_videos: (json['attachments_videos'] as List<dynamic>?)
          ?.map((e) => Attachment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$OrderImplToJson(_$OrderImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'provider': instance.provider,
      'proposals': instance.proposals,
      'status': instance.status,
      'location_lat': instance.location_lat,
      'location_lang': instance.location_lang,
      'description': instance.description,
      'reviewed': instance.reviewed,
      'have_a_proposal': instance.have_a_proposal,
      'available_time': instance.available_time,
      'equipment_cost': instance.equipment_cost,
      'avg_rate': instance.avg_rate,
      'attachment_audios': instance.attachment_audios,
      'attachment_images': instance.attachment_images,
      'attachments_videos': instance.attachments_videos,
    };

_$ProposalsImpl _$$ProposalsImplFromJson(Map<String, dynamic> json) =>
    _$ProposalsImpl(
      id: json['id'] as int?,
      price: (json['price'] as num?)?.toDouble(),
      original_price: (json['original_price'] as num?)?.toDouble(),
      description: json['description'] as String?,
      provider: json['provider'] == null
          ? null
          : Providers.fromJson(json['provider'] as Map<String, dynamic>),
      attachment_audios: (json['attachment_audios'] as List<dynamic>?)
              ?.map((e) => Attachment.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      attachments: (json['attachments'] as List<dynamic>?)
              ?.map((e) => Attachment.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      project: json['project'] == null
          ? null
          : Project.fromJson(json['project'] as Map<String, dynamic>),
      status: json['status'] as String?,
      created_at: json['created_at'] as String?,
    );

Map<String, dynamic> _$$ProposalsImplToJson(_$ProposalsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'original_price': instance.original_price,
      'description': instance.description,
      'provider': instance.provider,
      'attachment_audios': instance.attachment_audios,
      'attachments': instance.attachments,
      'project': instance.project,
      'status': instance.status,
      'created_at': instance.created_at,
    };

_$ProvidersImpl _$$ProvidersImplFromJson(Map<String, dynamic> json) =>
    _$ProvidersImpl(
      id: json['id'] as int?,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      avatar: json['avatar'] as String?,
      firebase_token: json['firebase_token'] as String?,
      avg_rate: (json['avg_rate'] as num?)?.toDouble(),
      location_lat: json['location_lat'] as String?,
      location_lang: json['location_lang'] as String?,
    );

Map<String, dynamic> _$$ProvidersImplToJson(_$ProvidersImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'avatar': instance.avatar,
      'firebase_token': instance.firebase_token,
      'avg_rate': instance.avg_rate,
      'location_lat': instance.location_lat,
      'location_lang': instance.location_lang,
    };

_$ProjectImpl _$$ProjectImplFromJson(Map<String, dynamic> json) =>
    _$ProjectImpl(
      id: json['id'] as int?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      location_lat: json['location_lat'],
      location_lang: json['location_lang'],
      available_time: json['available_time'] as String?,
      date: json['date'] as String?,
      status: json['status'] as String?,
      equipment_cost: (json['equipment_cost'] as num?)?.toDouble() ?? 0,
      reviewed: json['reviewed'] as bool?,
      attachment_audios: (json['attachment_audios'] as List<dynamic>?)
          ?.map((e) => Attachment.fromJson(e as Map<String, dynamic>))
          .toList(),
      attachment_images: (json['attachment_images'] as List<dynamic>?)
          ?.map((e) => Attachment.fromJson(e as Map<String, dynamic>))
          .toList(),
      attachments_videos: (json['attachments_videos'] as List<dynamic>?)
          ?.map((e) => Attachment.fromJson(e as Map<String, dynamic>))
          .toList(),
      attachments: (json['attachments'] as List<dynamic>?)
          ?.map((e) => Attachment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ProjectImplToJson(_$ProjectImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'location_lat': instance.location_lat,
      'location_lang': instance.location_lang,
      'available_time': instance.available_time,
      'date': instance.date,
      'status': instance.status,
      'equipment_cost': instance.equipment_cost,
      'reviewed': instance.reviewed,
      'attachment_audios': instance.attachment_audios,
      'attachment_images': instance.attachment_images,
      'attachments_videos': instance.attachments_videos,
      'attachments': instance.attachments,
    };

_$ReviewImpl _$$ReviewImplFromJson(Map<String, dynamic> json) => _$ReviewImpl(
      id: json['id'] as int?,
      rate: json['rate'] as int?,
      review: json['review'] as String?,
      avatar: json['avatar'] as String?,
    );

Map<String, dynamic> _$$ReviewImplToJson(_$ReviewImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'rate': instance.rate,
      'review': instance.review,
      'avatar': instance.avatar,
    };

_$AttachmentImpl _$$AttachmentImplFromJson(Map<String, dynamic> json) =>
    _$AttachmentImpl(
      id: json['id'] as int?,
      url: json['url'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$$AttachmentImplToJson(_$AttachmentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'type': instance.type,
    };

_$NotificationImpl _$$NotificationImplFromJson(Map<String, dynamic> json) =>
    _$NotificationImpl(
      body: json['body'] as String?,
      title: json['title'] as String?,
      project: json['project'] == null
          ? null
          : Project.fromJson(json['project'] as Map<String, dynamic>),
      created_at: json['created_at'] as String?,
    );

Map<String, dynamic> _$$NotificationImplToJson(_$NotificationImpl instance) =>
    <String, dynamic>{
      'body': instance.body,
      'title': instance.title,
      'project': instance.project,
      'created_at': instance.created_at,
    };
