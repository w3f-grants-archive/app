// AUTO GENERATED FILE, DO NOT EDIT.
// Generated by `flutter_rust_bridge`@ 1.75.3.
// ignore_for_file: non_constant_identifier_names, unused_element, duplicate_ignore, directives_ordering, curly_braces_in_flow_control_structures, unnecessary_lambdas, slash_for_doc_comments, prefer_const_literals_to_create_immutables, implicit_dynamic_list_literal, duplicate_import, unused_import, unnecessary_import, prefer_single_quotes, prefer_const_constructors, use_super_parameters, always_use_package_imports, annotate_overrides, invalid_use_of_protected_member, constant_identifier_names, invalid_use_of_internal_member, prefer_is_empty, unnecessary_const

import 'dart:convert';
import 'dart:async';
import 'package:meta/meta.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge.dart';
import 'package:uuid/uuid.dart';

abstract class RustWraper {
  Future<String> connectWallet({dynamic hint});

  FlutterRustBridgeTaskConstMeta get kConnectWalletConstMeta;

  Future<int> connect({required String url, dynamic hint});

  FlutterRustBridgeTaskConstMeta get kConnectConstMeta;

  /// 获取种子
  Future<List<String>> seedGenerate({dynamic hint});

  FlutterRustBridgeTaskConstMeta get kSeedGenerateConstMeta;

  /// 种子换取账户信息
  Future<String> getSeedPhrase(
      {required String seedStr,
      required String name,
      required String password,
      dynamic hint});

  FlutterRustBridgeTaskConstMeta get kGetSeedPhraseConstMeta;

  Future<bool> addKeyring(
      {required String keyringStr, required String password, dynamic hint});

  FlutterRustBridgeTaskConstMeta get kAddKeyringConstMeta;

  Future<String> addSeed({required String seed, dynamic hint});

  FlutterRustBridgeTaskConstMeta get kAddSeedConstMeta;

  Future<String> signFromAddress(
      {required String address, required String ctx, dynamic hint});

  FlutterRustBridgeTaskConstMeta get kSignFromAddressConstMeta;

  Future<void> startClient({required int client, dynamic hint});

  FlutterRustBridgeTaskConstMeta get kStartClientConstMeta;

  Future<void> createDao(
      {required int client,
      required String from,
      required String name,
      required String purpose,
      required String metaData,
      dynamic hint});

  FlutterRustBridgeTaskConstMeta get kCreateDaoConstMeta;

  Future<void> createAsset(
      {required int client,
      required String from,
      required int daoId,
      required String name,
      required String symbol,
      required int totalSupply,
      required int decimals,
      dynamic hint});

  FlutterRustBridgeTaskConstMeta get kCreateAssetConstMeta;

  Future<int> getBlockNumber({required int client, dynamic hint});

  FlutterRustBridgeTaskConstMeta get kGetBlockNumberConstMeta;

  Future<AssetAccountData> nativeBalance(
      {required int client, required String address, dynamic hint});

  FlutterRustBridgeTaskConstMeta get kNativeBalanceConstMeta;

  Future<void> daoInitFromPair(
      {required int client, required String address, dynamic hint});

  FlutterRustBridgeTaskConstMeta get kDaoInitFromPairConstMeta;

  Future<AssetAccountData> daoBalance(
      {required int client,
      required int daoId,
      required String address,
      dynamic hint});

  FlutterRustBridgeTaskConstMeta get kDaoBalanceConstMeta;

  Future<DaoInfo> daoInfo(
      {required int client, required int daoId, dynamic hint});

  FlutterRustBridgeTaskConstMeta get kDaoInfoConstMeta;

  Future<int> daoTotalIssuance(
      {required int client, required int daoId, dynamic hint});

  FlutterRustBridgeTaskConstMeta get kDaoTotalIssuanceConstMeta;

  Future<List<Quarter>> daoRoadmap(
      {required int client,
      required int daoId,
      required int year,
      dynamic hint});

  FlutterRustBridgeTaskConstMeta get kDaoRoadmapConstMeta;

  Future<bool> daoCreateRoadmapTask(
      {required String from,
      required int client,
      required int daoId,
      required int roadmapId,
      required String name,
      required int priority,
      required Uint8List tags,
      dynamic hint});

  FlutterRustBridgeTaskConstMeta get kDaoCreateRoadmapTaskConstMeta;

  Future<bool> joinDao(
      {required String from,
      required int client,
      required int daoId,
      required int shareExpect,
      required int value,
      dynamic hint});

  FlutterRustBridgeTaskConstMeta get kJoinDaoConstMeta;

  Future<List<String>> daoMemebers(
      {required int client, required int daoId, dynamic hint});

  FlutterRustBridgeTaskConstMeta get kDaoMemebersConstMeta;

  Future<List<ProjectInfo>> daoProjects(
      {required int client, required int daoId, dynamic hint});

  FlutterRustBridgeTaskConstMeta get kDaoProjectsConstMeta;

  Future<List<GuildInfo>> daoGuilds(
      {required int client, required int daoId, dynamic hint});

  FlutterRustBridgeTaskConstMeta get kDaoGuildsConstMeta;

  Future<String> ss58({required String address, int? prefix, dynamic hint});

  FlutterRustBridgeTaskConstMeta get kSs58ConstMeta;

  Future<bool> createProject(
      {required String from,
      required int client,
      required int daoId,
      required String name,
      required String desc,
      WithGovPs? ext,
      dynamic hint});

  FlutterRustBridgeTaskConstMeta get kCreateProjectConstMeta;

  Future<bool> createGuild(
      {required String from,
      required int client,
      required int daoId,
      required String name,
      required String desc,
      WithGovPs? ext,
      dynamic hint});

  FlutterRustBridgeTaskConstMeta get kCreateGuildConstMeta;

  Future<List<GovProps>> daoGovPendingReferendumList(
      {required int client, required int daoId, dynamic hint});

  FlutterRustBridgeTaskConstMeta get kDaoGovPendingReferendumListConstMeta;

  Future<List<GovReferendum>> daoGovReferendumList(
      {required int client, required int daoId, dynamic hint});

  FlutterRustBridgeTaskConstMeta get kDaoGovReferendumListConstMeta;

  Future<bool> daoGovStartReferendum(
      {required String from,
      required int client,
      required int daoId,
      required int index,
      dynamic hint});

  FlutterRustBridgeTaskConstMeta get kDaoGovStartReferendumConstMeta;

  Future<bool> daoGovVoteForReferendum(
      {required String from,
      required int client,
      required int daoId,
      required int index,
      required int vote,
      required bool approve,
      dynamic hint});

  FlutterRustBridgeTaskConstMeta get kDaoGovVoteForReferendumConstMeta;

  Future<List<GovVote>> daoGovVotesOfUser(
      {required String from,
      required int client,
      required int daoId,
      dynamic hint});

  FlutterRustBridgeTaskConstMeta get kDaoGovVotesOfUserConstMeta;

  Future<bool> daoGovRunProposal(
      {required String from,
      required int client,
      required int daoId,
      required int index,
      dynamic hint});

  FlutterRustBridgeTaskConstMeta get kDaoGovRunProposalConstMeta;

  Future<bool> daoGovUnlock(
      {required String from,
      required int client,
      required int daoId,
      dynamic hint});

  FlutterRustBridgeTaskConstMeta get kDaoGovUnlockConstMeta;

  Future<List<String>> daoMemeberList(
      {required int client, required int daoId, dynamic hint});

  FlutterRustBridgeTaskConstMeta get kDaoMemeberListConstMeta;

  Future<List<String>> daoGuildMemeberList(
      {required int client,
      required int daoId,
      required int guildId,
      dynamic hint});

  FlutterRustBridgeTaskConstMeta get kDaoGuildMemeberListConstMeta;

  Future<List<String>> daoProjectMemberList(
      {required int client,
      required int daoId,
      required int projectId,
      dynamic hint});

  FlutterRustBridgeTaskConstMeta get kDaoProjectMemberListConstMeta;

  Future<List<TaskInfo>> daoProjectTaskList(
      {required int client, required int projectId, dynamic hint});

  FlutterRustBridgeTaskConstMeta get kDaoProjectTaskListConstMeta;

  Future<TaskInfo> daoProjectTaskInfo(
      {required int client,
      required int projectId,
      required int taskId,
      dynamic hint});

  FlutterRustBridgeTaskConstMeta get kDaoProjectTaskInfoConstMeta;

  Future<bool> daoProjectCreateTask(
      {required String from,
      required int client,
      required int daoId,
      required int projectId,
      required String name,
      required String desc,
      required int priority,
      required int point,
      List<String>? assignees,
      List<String>? reviewers,
      Uint8List? skills,
      int? maxAssignee,
      required int amount,
      dynamic hint});

  FlutterRustBridgeTaskConstMeta get kDaoProjectCreateTaskConstMeta;

  Future<bool> daoProjectStartTask(
      {required String from,
      required int client,
      required int daoId,
      required int projectId,
      required int taskId,
      dynamic hint});

  FlutterRustBridgeTaskConstMeta get kDaoProjectStartTaskConstMeta;

  Future<bool> daoProjectRequestReview(
      {required String from,
      required int client,
      required int daoId,
      required int projectId,
      required int taskId,
      dynamic hint});

  FlutterRustBridgeTaskConstMeta get kDaoProjectRequestReviewConstMeta;

  Future<bool> daoProjectTaskDone(
      {required String from,
      required int client,
      required int daoId,
      required int projectId,
      required int taskId,
      dynamic hint});

  FlutterRustBridgeTaskConstMeta get kDaoProjectTaskDoneConstMeta;

  Future<bool> daoProjectJoinTask(
      {required String from,
      required int client,
      required int daoId,
      required int projectId,
      required int taskId,
      dynamic hint});

  FlutterRustBridgeTaskConstMeta get kDaoProjectJoinTaskConstMeta;

  Future<bool> daoProjectLeaveTask(
      {required String from,
      required int client,
      required int daoId,
      required int projectId,
      required int taskId,
      dynamic hint});

  FlutterRustBridgeTaskConstMeta get kDaoProjectLeaveTaskConstMeta;

  Future<bool> daoProjectJoinTaskReview(
      {required String from,
      required int client,
      required int daoId,
      required int projectId,
      required int taskId,
      dynamic hint});

  FlutterRustBridgeTaskConstMeta get kDaoProjectJoinTaskReviewConstMeta;

  Future<bool> daoProjectLeaveTaskReview(
      {required String from,
      required int client,
      required int daoId,
      required int projectId,
      required int taskId,
      dynamic hint});

  FlutterRustBridgeTaskConstMeta get kDaoProjectLeaveTaskReviewConstMeta;

  Future<bool> daoProjectMakeReview(
      {required String from,
      required int client,
      required int daoId,
      required int projectId,
      required int taskId,
      required bool approve,
      required String meta,
      dynamic hint});

  FlutterRustBridgeTaskConstMeta get kDaoProjectMakeReviewConstMeta;

  Future<bool> daoProjectJoinRequest(
      {required String from,
      required int client,
      required int daoId,
      required int projectId,
      WithGovPs? ext,
      dynamic hint});

  FlutterRustBridgeTaskConstMeta get kDaoProjectJoinRequestConstMeta;

  Future<bool> daoProjectJoinRequestWithRoot(
      {required String from,
      required int client,
      required int daoId,
      required int projectId,
      required String user,
      dynamic hint});

  FlutterRustBridgeTaskConstMeta get kDaoProjectJoinRequestWithRootConstMeta;

  Future<bool> daoGuildJoinRequest(
      {required String from,
      required int client,
      required int daoId,
      required int guildId,
      WithGovPs? ext,
      dynamic hint});

  FlutterRustBridgeTaskConstMeta get kDaoGuildJoinRequestConstMeta;

  Future<int> daoMemberPoint(
      {required int client,
      required int daoId,
      required String member,
      dynamic hint});

  FlutterRustBridgeTaskConstMeta get kDaoMemberPointConstMeta;

  Future<bool> daoApplyProjectFunds(
      {required String from,
      required int client,
      required int daoId,
      required int projectId,
      required int amount,
      WithGovPs? ext,
      dynamic hint});

  FlutterRustBridgeTaskConstMeta get kDaoApplyProjectFundsConstMeta;
}

class AssetAccountData {
  final int free;
  final int reserved;
  final int frozen;

  const AssetAccountData({
    required this.free,
    required this.reserved,
    required this.frozen,
  });
}

/// DAO specific information
/// 组织信息
class DaoInfo {
  final int id;

  /// creator of DAO
  /// 创建者
  final String creator;

  /// The block that creates the DAO
  /// DAO创建的区块
  final int startBlock;

  /// DAO account id.
  /// DAO 链上账户ID
  final String daoAccountId;

  /// name of the DAO.
  /// DAO 名字
  final String name;

  /// Purpose of the DAO.
  /// DAO 目标宗旨
  final String purpose;

  /// DAO 元数据 图片等内容
  final String metaData;

  /// 区块链 1 Unit 等于多少余额
  final int chainUnit;

  const DaoInfo({
    required this.id,
    required this.creator,
    required this.startBlock,
    required this.daoAccountId,
    required this.name,
    required this.purpose,
    required this.metaData,
    required this.chainUnit,
  });
}

/// Waiting to start voting information
/// 待开始投票信息
class GovProps {
  final int index;

  /// The hash of referendum.
  final String hash;

  /// The hash of the proposal being voted on.
  /// 投票后执行内容
  final String runtimeCall;

  /// 执行范围
  final MemberGroup memberGroup;
  final String account;

  const GovProps({
    required this.index,
    required this.hash,
    required this.runtimeCall,
    required this.memberGroup,
    required this.account,
  });
}

class GovReferendum {
  final int id;

  /// The hash of referendum.
  final String hash;

  /// When voting on this referendum will end.
  /// 投票结束事件
  final int end;

  /// The hash of the proposal being voted on.
  /// 投票后执行内容
  final String proposal;

  /// The delay (in blocks) to wait after a successful referendum before deploying.
  /// 投票完成后多久被允许执行
  final int delay;

  /// The current tally of votes in this referendum.
  /// 投票统计
  final Tally tally;

  /// 投票范围
  final MemberGroup memberGroup;

  /// 投票状态
  final int status;

  const GovReferendum({
    required this.id,
    required this.hash,
    required this.end,
    required this.proposal,
    required this.delay,
    required this.tally,
    required this.memberGroup,
    required this.status,
  });
}

class GovVote {
  /// The id of the Dao where the vote is located.
  /// 投票所在组织
  final int daoId;

  /// The specific thing that the vote pledged.
  /// 抵押
  final int pledge;

  /// Object or agree.
  /// 是否同意
  final int opinion;

  /// voting weight.
  /// 投票权重
  final int voteWeight;

  /// Block height that can be unlocked.
  /// 投票解锁阶段
  final int unlockBlock;

  /// The referendum id corresponding to the vote.
  /// 投票的全民公投
  final int referendumIndex;

  const GovVote({
    required this.daoId,
    required this.pledge,
    required this.opinion,
    required this.voteWeight,
    required this.unlockBlock,
    required this.referendumIndex,
  });
}

/// Guild information
/// 组织内公会信息
class GuildInfo {
  /// boardID
  /// 看板ID
  final int id;

  /// creator of DAO
  /// 创建者
  final String creator;

  /// DAO account id.
  /// DAO 链上账户ID
  final String daoAccountId;

  /// The block that creates the DAO
  /// DAO创建的区块
  final int startBlock;

  /// Purpose of the DAO.
  /// DAO 目标宗旨
  final String name;

  /// Purpose of the DAO.
  /// DAO 目标宗旨
  final String desc;

  /// DAO 元数据 图片等内容
  final String metaData;

  /// State of the DAO
  /// DAO状态
  final int status;

  const GuildInfo({
    required this.id,
    required this.creator,
    required this.daoAccountId,
    required this.startBlock,
    required this.name,
    required this.desc,
    required this.metaData,
    required this.status,
  });
}

class MemberGroup {
  final int scope;
  final int id;

  const MemberGroup({
    required this.scope,
    required this.id,
  });
}

/// Project specific information
/// 项目信息
class ProjectInfo {
  /// boardID
  /// 看板ID
  final int id;

  /// 项目名
  final String name;

  /// DAO account id.
  /// DAO 链上账户ID
  final String daoAccountId;

  /// 项目介绍
  final String description;

  /// creator of WETEE
  /// 创建者
  final String creator;

  /// State of the WETEE
  /// WETEE状态
  final int status;

  const ProjectInfo({
    required this.id,
    required this.name,
    required this.daoAccountId,
    required this.description,
    required this.creator,
    required this.status,
  });
}

/// roadmap 季度
class Quarter {
  final int year;
  final int quarter;
  final List<QuarterTask> tasks;

  const Quarter({
    required this.year,
    required this.quarter,
    required this.tasks,
  });
}

/// roadmap 任务
class QuarterTask {
  final int id;

  /// 任务名称
  /// name of the Task.
  final String name;

  /// priority
  /// 优先程度
  final int priority;

  /// creator of Task
  /// 创建者
  final String creator;

  /// tag info
  /// 数据标签
  final List<U8Wrap> tags;

  /// State of the Task
  /// DAO状态
  /// ToDo = 0,
  /// InProgress = 1,
  /// InReview = 2,
  /// Done = 3,
  final int status;

  const QuarterTask({
    required this.id,
    required this.name,
    required this.priority,
    required this.creator,
    required this.tags,
    required this.status,
  });
}

class Reward {
  final int assetId;
  final int amount;

  const Reward({
    required this.assetId,
    required this.amount,
  });
}

class Tally {
  /// The number of yes votes
  /// 同意的数量
  final int yes;

  /// The number of no votes
  /// 不同意的数量
  final int no;

  const Tally({
    required this.yes,
    required this.no,
  });
}

/// task specific information
/// 任务信息
class TaskInfo {
  final int id;
  final String name;
  final String description;

  /// task point
  /// 任务价值点
  final int point;

  /// priority
  /// 优先程度
  final int priority;

  /// projectID
  /// 看板ID
  final int projectId;

  /// creator of WETEE
  /// 创建者
  final String creator;

  /// rewards
  /// 奖金
  final List<Reward> rewards;
  final int maxAssignee;

  /// assignes info
  /// 受托人
  final List<String> assignees;

  /// reviewer
  /// 审查人
  final List<String> reviewers;

  /// skill info
  /// 技能
  final List<U8Wrap> skills;

  /// State of the WETEE
  /// WETEE状态
  final int status;

  const TaskInfo({
    required this.id,
    required this.name,
    required this.description,
    required this.point,
    required this.priority,
    required this.projectId,
    required this.creator,
    required this.rewards,
    required this.maxAssignee,
    required this.assignees,
    required this.reviewers,
    required this.skills,
    required this.status,
  });
}

class U8Wrap {
  final int value;

  const U8Wrap({
    required this.value,
  });
}

/// vote yes or no
/// 投票
class WithGovPs {
  final int runType;
  final int amount;
  final MemberGroup member;

  const WithGovPs({
    required this.runType,
    required this.amount,
    required this.member,
  });
}
