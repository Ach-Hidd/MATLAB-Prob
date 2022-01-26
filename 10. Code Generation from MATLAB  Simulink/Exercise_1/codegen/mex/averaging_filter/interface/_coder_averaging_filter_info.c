/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * _coder_averaging_filter_info.c
 *
 * Code generation for function '_coder_averaging_filter_info'
 *
 */

/* Include files */
#include "rt_nonfinite.h"
#include "averaging_filter.h"
#include "_coder_averaging_filter_info.h"

/* Function Definitions */
mxArray *emlrtMexFcnProperties(void)
{
  mxArray *xResult;
  mxArray *xEntryPoints;
  const char * fldNames[6] = { "Name", "NumberOfInputs", "NumberOfOutputs",
    "ConstantInputs", "FullPath", "TimeStamp" };

  mxArray *xInputs;
  const char * b_fldNames[4] = { "Version", "ResolvedFunctions", "EntryPoints",
    "CoverageInfo" };

  xEntryPoints = emlrtCreateStructMatrix(1, 1, 6, fldNames);
  xInputs = emlrtCreateLogicalMatrix(1, 1);
  emlrtSetField(xEntryPoints, 0, "Name", emlrtMxCreateString("averaging_filter"));
  emlrtSetField(xEntryPoints, 0, "NumberOfInputs", emlrtMxCreateDoubleScalar(1.0));
  emlrtSetField(xEntryPoints, 0, "NumberOfOutputs", emlrtMxCreateDoubleScalar
                (1.0));
  emlrtSetField(xEntryPoints, 0, "ConstantInputs", xInputs);
  emlrtSetField(xEntryPoints, 0, "FullPath", emlrtMxCreateString(
    "D:\\Studium\\Computer Aided Design\\Praktikum MATLABSimulink for Computer Aided Engineering\\10. Code Generation from MATLAB  Simuli"
    "nk\\Exercise_1\\averaging_filter.m"));
  emlrtSetField(xEntryPoints, 0, "TimeStamp", emlrtMxCreateDoubleScalar
                (737292.67262731481));
  xResult = emlrtCreateStructMatrix(1, 1, 4, b_fldNames);
  emlrtSetField(xResult, 0, "Version", emlrtMxCreateString(
    "9.6.0.1472908 (R2019a) Update 9"));
  emlrtSetField(xResult, 0, "ResolvedFunctions", (mxArray *)
                emlrtMexFcnResolvedFunctionsInfo());
  emlrtSetField(xResult, 0, "EntryPoints", xEntryPoints);
  return xResult;
}

const mxArray *emlrtMexFcnResolvedFunctionsInfo(void)
{
  const mxArray *nameCaptureInfo;
  const char * data[23] = {
    "789ced5d4d6c234915ee19669699c38225b4ec2224f00c6804da551cc7719c0c02e2f82771887fe29f7192d1aca7dd5db62bee3ff78f635b420a370e1c10270e"
    "1c2c715921212d2756620fe1c6cf0d2d68c58513170e1c90e088e8b6dd1e77e31a77d2ed76daae9232e59ee77e5ff5eb575f3dbf7e2e137752e93b04417c4efd",
    "bbabfe7df87b62d0de1c76846fd4df258ccd2cbf33ea1f9b8ef5769fb867384f97ff6cd4533c27838e3c3c602007320a5b05a27ac0912c18aba1791672242717"
    "bb02204420f14c1bd003490d32a0085970c44f1c1c40f5804d4e88c6079a487b1d6b00aa595058426c48af86cb4c1e1013f6797067faf5dfb3689f9f23ece333",
    "c99f275ec49f060ab24243850dc47856506420faa39006b43f0e2458e70239916ccab0a9b0fe74b47814dd2b4056514dd7f4d778d16f3a25c1d555a3021172f5"
    "40707d4d15d3c0bf0f38209232e4397f4de475357ebfae2890e800918212a80403645b7dabaaa35e518dabea5d630d767989b8ee372cdac5dcebed21f160e228",
    "b43b0bcfea7df80c02cf3792488ab5ebb38af786e9f815de5042f34a9501aff0fa36f176907846f9f3d4d149e245e2696078ef37d6833b6440e679a6ca770280"
    "65020cac06585266c86a802665b2a67001d536a3bbefe6fdbf7aeb39fde7a8bbfee6b67f2f0eaf83d067d5dfde42e0f94cf27401d227adb34eeda827d56b9df4",
    "79aac1b526c6919b81336b1c04e2d82dfd7dc4f9ab3b6fb5e6df75cacfde41e0f94c724a5ddfc435a806152247326b1c29aa6b17d568dae57373438d436fe3b8"
    "ea8678bafea31978bafcb57e21354811d081816d46ffbe3bea744b05c6961aba8a7b7e72f985a7f94f30bfcf09cfeebcfb2202cf6792773b17a91d3259ab87d7",
    "a96c822f9c2795c8456279f8ddebf318e50756fd0e15373f1cf5ef18fef7f1eeb07f32eadf732c7ebf8f18876f24a9313caf7d7ac4f1fbab3800305a1430b0cc"
    "22e280df969ee0f8ddebfcbedd8a648b2d261e6eee358ac7fb05b9158f53c9e5e1f73ee2fc159eb7c464fc7e89d067d53e5f45e0f94c7253fc0ea53d0532728a",
    "cb282c1021b5305effc8265e01896794db5effcd16733f5ff707e2bf7fc17c3f273cb7f8fee26cafd4eb751a91aca024121b312a9c27b7f730df2f37df7fdd31"
    "beff3202cf67929bf85ea2488614d7f428de7e1c6f6e56f3361fdc104fd79f9881a7cb67fa87f6f77f24ffeed04e13bee262bee617e52fe178deebfc5e6d6ce5",
    "4e3846a60b3c9b50b8835035b177b88ff97d55f8fdc7087d56edf34d049ecf2437f13b29084cb73020afa4c251da23e8149763484a7fd4af8f4fb039becfcf18"
    "9f2eaf8d465169901cad06fc4ec5fbf919f8bafc66fc8f36a3ee582efad571f91f38def7fa7aa0e462b14e24561632c53088641aa1f451a4195b9ef500cfe7e9",
    "bdde8cfee75cbefe81e99818bf6f2881922490a204bc9aafff0e12cf28bf4e9ca059448b1474db683ee0defddf7df0edf7319f7b9dcf2fca2929c9349f25376a"
    "6281699f670fb9de31e6f315e5f3b5a5cbebdc94ef715ec7d8705ec71d3c9cd771467f1f71fe6ad7593e762c5eff2c02cf3792a8d728883ced187fdf331dbfc2",
    "1b4aa8063958309ce2ef2412cf28d7ee7feeba0e2088b04dca20303292cb71fb3f4fff88e376aff377fe0032ed704e3965c85cbc94ab1e73e9f4d912d551e2f9"
    "6b6c467f7b82ebe56f88a7eb5f749ded4bc4f870bdbc37f070bdbc33fa31cf1b9bd1df36705d2581eb2a27c76dc16f705de51cf1705da533fa31ef1b9bd1dfc2",
    "8ec5f756fd4dbd4e0a48526574c915c8098a2c39977fbf6efec62edf97907846b92dff986e3497f3f1389f334f3cb7e65f3092de69c7c0712822d5cf8b00f4ca"
    "5b24882f0fdfe3f93cbdd71b2aeec7f99debe1e1fccebcf0866d55f0707ec719fd98f7a7f77a33f8df656cccfb3f44e8b36ab7af21f07c26b989f7299e93e40c",
    "cf1520576780cc7371682d7f31afbccfad5807907538d3cce5f63a40487f2be1f8dfebebc061ed48d9d80b93dd0cdb939aa25c7fb6d3585fa23a4c3c8fa78fdf"
    "e877dbb89ede221eaea7b78b376cab8287ebe99dd18fe3f9e9bdde8cf1fc9163799cb711783e937c6a3d7da2beb0f8bd6f136f17896794df6cddd7cdb3c6bae7",
    "1757ffc2f9fadbcbf356f7298e6e7235fe701d16d64fb772b9e0513d1ade6488e5e1f93ee2fcd59db76abb4c8ff95c40e8b36a9f374dc784e97dba1c4adcb08e"
    "44d67ed160717998be4dbcef22f18c724bf17a0d76002df0aa3b040cf651577817fde197f87b50b797c7adc6ebfba166b7d0aa4326568c35f3adbd7ab1594a2c",
    "d173d73ee27ccce36ee5596a50fd94d2f02a6f3f45e219e5d7e7eda15d16f03d67ccdb73c4732bfe6eb740426853d2cec94588e7735221183a3d239687b7edd6"
    "471e20f4fb4c72bbbcfda8064549ae4157fded25e9187fcfaa4bd4784aeb17c5df3fb589b785c433ca6fc2df2ed7c57ef4efbf62debeadbc6d35de2e7405c886",
    "5bf9721056e9cdd4d9712e1d6c2f51bc8de7eba47fad2f4dbee4baf5eb7d9b78385f621b6fd056050fe74b9cd1ef99b8bb07445e52dccd9b5cbd702deeae298c"
    "f638c5b3f96e47f326a6fa14cd36eee74d2e7f85f9dbfbfc2d6f6db0f97879bf7116e27b6d39cd26d34119f3f758df527faf74a2be1c85e7d4fe5f50022d8564",
    "3ccbdfdf42e219e5d7dbd75f7d111859c6f57d0176fff4c18f70ddc96de56fab79ef43a1176c45b274e934c86c803c289fc9a11d6279f8bb8f387f75e7add6fc"
    "8ee55150f7c367ea55135446575ca178716175e21fdac44b23f18cf26bade74387d05773b3a9dcfefe3ffe5d8d39e2b9c5eb61a113e924b732e279f1684bee26",
    "c55c7793229687d7f13c9e3e7ea3df7d037fefff8678ba7efcbd7fa7f1866d55f0f0f7fe9dd18ff330c666f0b7ddbc633c6f35bea078b60a39f00c50322f2618"
    "c0024edbde8b70ea73c5a27f47af38035f97dbf297a946749bffaf7a3ff93e8ef7bdceff64e474675f096f83ed58b5070e9ff1d172b6b04479783c9fa7f77a33",
    "e6e50f1796975f34eff76de22f5fbe0fe7e9e78987f3f4cee8ef23ce5fdd79abb5db93a75f34afe37cdff4f1e3bcbd3b78386fef8c7e1cc74feff566ac8f2c8c"
    "f97f41fb37926d1ed2515124bb49869465c041ae3e78df4ae7f3d1bfbf3bc55caefbcde57faa781db8adeb80d57c4eeff020142b0927ec71354b474f6a07e90e",
    "9b3dc0ebc06aae03efbbb8bf00dec711efe388f91cefe3783dfdbf439c6fd58e00a1df6792cf83cf1f513c9326cf79510bda526a2837715da8bc87557fbc8bb8"
    "ae87a6f70fda15b53b7c413bf63cf786fb3c6a8fb125d803b6e3fc45ad03bb483ca3fc6671be6e1e37f719bafc35deafc0fbeb40b355c8448554350b5342a6d4",
    "6897b6d75bf21e5e076efb3af012316e47fdd1df18f3fe25429f553b7e0581e733c907496b4eaed47891e179a1c2b7815863f88b0ad50054d3bb799e9ce9d88c"
    "a7cbaff53c68b81cbcc65eaeeefbfbf1dfefe3cf055e5f0fa4ef253a8978af973bec6c6ca637d663c7d1e0fa12d56d7e8a38dfaa1ddb08fd3e93dce979fce8f5",
    "6fa8340023680b84bbfeb9efda7e09e67dca16f439047234e8a438793c0ebc1f12debfcc0d3cbc7f9933fa31ff5bbb4e6bfe99728cff67e563d44b67c98e77f7"
    "3b9bc77e39a37ab0816516b05fcefd1f7c8ae37daff3fda9481e14dad576359207f144970def944f97e977b931df5bbb4e4bfe79e92edf430ef3fd74be879cfb",
    "7c7ff59bb71f62bef73adfd7c9d3483654ceb422d5a81c0b93d94db079bcef7dbeff1f71953cde",
    "" };

  nameCaptureInfo = NULL;
  emlrtNameCaptureMxArrayR2016a(data, 51656U, &nameCaptureInfo);
  return nameCaptureInfo;
}

/* End of code generation (_coder_averaging_filter_info.c) */
