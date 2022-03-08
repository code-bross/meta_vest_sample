import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:dart_web3/dart_web3.dart';

class EthereumRepository {
  late Client _httpClient;
  late Web3Client _client;

  factory EthereumRepository() => _instance;
  static final EthereumRepository _instance = EthereumRepository._internal();

  EthereumRepository._internal() {
    _httpClient = Client();
    _client = Web3Client('http:/localhost:7545', _httpClient);
  }

  Future<DeployedContract> loadContract() async {
    String abiCode = await rootBundle.loadString("assets/abi.json");
    String contractAddress = "0x8A30f78133176ed5E6CcB0AE8429AEEBf4c82Ffc";

    final contract = DeployedContract(ContractAbi.fromJson(abiCode, "MetaCoin"),
        EthereumAddress.fromHex(contractAddress));
    return contract;
  }

  Future<String> submit(String functionName, List<dynamic> args) async {
    EthPrivateKey credentials = EthPrivateKey.fromHex(
        "0x4b6662BF32d871eC087fbfcaFcdE2AfeE9A1D9cB");

    DeployedContract contract = await loadContract();

    final ethFunction = contract.function(functionName);

    var result = await _client.sendTransaction(
      credentials,
      Transaction.callContract(
        contract: contract,
        function: ethFunction,
        parameters: args,
      ),
    );
    return result;
  }

  Future<List<dynamic>> query(String functionName, List<dynamic> args) async {
    final contract = await loadContract();
    final ethFunction = contract.function(functionName);
    final data = await _client.call(
        contract: contract, function: ethFunction, params: args);
    return data;
  }

  Future<String> sendCoind(String targetAddressHex, int amount) async {
    EthereumAddress address = EthereumAddress.fromHex(targetAddressHex);
    // uint in smart contract means BigInt for us
    var bigAmount = BigInt.from(amount);
    // sendCoin transaction
    var response = await submit("sendCoin", [address, bigAmount]);
    // hash of the transaction
    return response;
  }

  Future<List<dynamic>> getBalance(String targetAddressHex) async {
    EthereumAddress address = EthereumAddress.fromHex(targetAddressHex);
    // getBalance transaction
    List<dynamic> result = await query("getBalance", [address]);
    // returns list of results, in this case a list with only the balance
    return result;
  }
}
