#loc = loc(unknown)
module attributes {
  vaimlconf.device = "stx",
  vaimlconf.install_dir = "/scratch/thozerbs/ryzen_ai/venv/lib/python3.12/site-packages/flexml/flexml_extras",
  vaimlconf.library_metadata = ["${vaimlconf.install_dir}/../../../../../../../git/RyzenAI-SW/CNN-examples/getting_started_resnet/bf16/my_cache_dir/resnet_trained_for_cifar10/vaiml_partition_fe.flexml/custom_ops", "/embedded/libraryMetadata/L1", "/embedded/libraryMetadata/L1", "/embedded/libraryMetadata/L2", "${vaimlconf.install_dir}/../../vitis_mllib/L1/metadata", "${vaimlconf.install_dir}/../../vitis_mllib/L2/metadata", "/embedded/L1/metadata", "/embedded/L2/metadata", "/embedded/libraryMetadata/DMAC", "/embedded/tiling-recipe-specs"],
  vaimlconf.overlay_for_TGs = "rai_1x4x4",
  vaimlconf.single_core_compiler = "peano",
  vaimlconf.unified_overlay = "rai_2x4x4.json"} {
  func.func private @forward_outlined_part_0(%arg0: tensor<1x3x32x32xbf16> {onnx.name = "input", xten_nn.RTAnnotations = {scale_factor = 1.000000e+00 : f32, tensor_name = "input"}} loc(unknown)) -> (tensor<1x10xbf16> {onnx.name = "output", xten_nn.RTAnnotations = {scale_factor = 1.000000e+00 : f32, tensor_name = "output"}}) attributes {aie_partition = 0 : i32, kernel} {
    %0 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<64xbf16>}> : () -> tensor<64xbf16> loc(#loc246)
    %1 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<64x3x7x7xbf16>}> : () -> tensor<64x3x7x7xbf16> loc(#loc247)
    %2 = xten_nn.subgraph (%arg1 = %arg0: tensor<1x3x32x32xbf16>, %arg2 = %1: tensor<64x3x7x7xbf16>, %arg3 = %0: tensor<64xbf16>)  attributes {
      IfmOperands = [0 : index],
      LayerName = "/relu/Relu",
      Operands = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:4",
          l3_extend_end = dense<[0, 1, 0, 0]> : vector<4xindex>,
          l3_tile_count = dense<[1, 3, 32, 32]> : vector<4xindex>
        },
        {
          UnknownDataFormat = true,
          l3_extend_end = dense<[0, 1, 0, 0]> : vector<4xindex>,
          l3_tile_count = dense<[64, 3, 7, 7]> : vector<4xindex>
        },
        {
          UnknownDataFormat = true
        }
      ],
      OutputName = "/conv1/Conv",
      Reason = "InCoreChain",
      Results = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 64, 16, 16]> : vector<4xindex>
        }
      ],
      TilingRecipe = {
        "conv-spatial-2d" = false,
        "conv-split-stamps" = true,
        "conv-split-stamps-OC-only" = false,
        "conv-split-stamps-OH-only" = false,
        "convtype-set-by-overlay-heuristic" = false,
        "disable-oh-spatial" = false,
        "disable-ow-spatial" = false,
        "dwc-split-stamps" = false,
        "elt-split-stamps" = true,
        "fm-superiters" = false,
        "icw-superiters" = false,
        "ocw-superiters" = true,
        "ow-superiters" = false,
        "pool-split-stamps" = false,
        "reduce-split-stamps" = false
      },
      logical_mode = "2x_4x4_1x4_vertBroadcastLeft_horizBroadcastRight",
      memory_configuration = {
        L1 = {layout = "strictlegacy"},
        L2 = {ifm_buffering = "single", layout = "flexible", limited_wts_space = false, ofm_buffering = "single", weights_buffering = "double"}
      }} {
      %169 = xten_nn.subgraph (%arg4 = %arg1: tensor<1x3x32x32xbf16>, %arg5 = %arg2: tensor<64x3x7x7xbf16>, %arg6 = %arg3: tensor<64xbf16>)  attributes {
        Dilations = array<i64: 1, 1>,
        HWPadding = [[3, 2], [3, 2]],
        LayerName = "/relu/Relu",
        Operands = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:4",
            Port = "data_io.ifm",
            l3_extend_end = dense<[0, 1, 0, 0]> : vector<4xindex>,
            l3_tile_count = dense<[1, 3, 32, 32]> : vector<4xindex>
          },
          {
            Port = "data_io.wts",
            SubPort = "wts_data",
            UnknownDataFormat = true,
            l3_extend_end = dense<[0, 1, 0, 0]> : vector<4xindex>,
            l3_tile_count = dense<[64, 3, 7, 7]> : vector<4xindex>
          },
          {
            Port = "data_io.wts",
            SubPort = "bias",
            UnknownDataFormat = true
          }
        ],
        OutputName = "/conv1/Conv",
        Reason = "MllibKernel",
        Results = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Port = "data_io.ofm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 64, 16, 16]> : vector<4xindex>
          }
        ],
        Specializes = "Conv2DBf16",
        Traits = {
          AllowDMAOptimization = true,
          NonNegativeOut = true
        },
        With = {
          config.AIE_API_EMULATE_BFLOAT16_MMUL_WITH_BFP16 = 1 : ui8,
          config.act = 1 : ui8,
          config.act_type = "RELU",
          config.aie_arch = "aie2p",
          config.batch_size = 1 : ui8,
          config.compiler = "peano",
          config.conv_type = [0 : ui8, 12 : ui8, 64 : ui8, 3 : ui8],
          config.dtype_ifm = "bfloat16",
          config.dtype_ofm = "bfloat16",
          config.dtype_wts = "bfloat16",
          config.enable_bfp16_wts = 0 : ui8,
          config.ksize.height = 7 : ui8,
          config.ksize.width = 7 : ui8,
          config.lrelu_alpha = 0.000000e+00 : f32,
          config.stride_h = 2 : ui8,
          config.stride_w = 2 : ui8
        }} {
        %170 = "tosa.const"() <{value = dense<[0, 3, 1, 2]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc248)
        %171 = "tosa.const"() <{value = dense<[0, 2, 3, 1]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc248)
        %172 = tosa.transpose %arg5, %171 : (tensor<64x3x7x7xbf16>, tensor<4xi32>) -> tensor<64x7x7x3xbf16> loc(#loc247)
        %173 = tosa.transpose %arg4, %171 : (tensor<1x3x32x32xbf16>, tensor<4xi32>) -> tensor<1x32x32x3xbf16> loc(#loc247)
        %174 = tosa.conv2d %173, %172, %arg6 {
          PartOfLayerName = "/conv1/Conv",
          PartOfOutputName = "/conv1/Conv",
          acc_type = f32,
          dilation = array<i64: 1, 1>,
          pad = array<i64: 3, 2, 3, 2>,
          stride = array<i64: 2, 2>} : (tensor<1x32x32x3xbf16>, tensor<64x7x7x3xbf16>, tensor<64xbf16>) -> tensor<1x16x16x64xbf16> loc(#loc249)
        %175 = tosa.clamp %174 {
          LayerName = "/relu/Relu",
          OutputName = "/relu/Relu",
          max_fp = 3.40282347E+38 : f32,
          max_int = 2147483647 : i64,
          min_fp = 0.000000e+00 : f32,
          min_int = 0 : i64} : (tensor<1x16x16x64xbf16>) -> tensor<1x16x16x64xbf16> loc(#loc250)
        %176 = tosa.transpose %175, %170 : (tensor<1x16x16x64xbf16>, tensor<4xi32>) -> tensor<1x64x16x16xbf16> loc(#loc247)
        xten_nn.output %176 : tensor<1x64x16x16xbf16> loc(#loc250)
      } -> tensor<1x64x16x16xbf16> loc(#loc247)
      xten_nn.output %169 : tensor<1x64x16x16xbf16> loc(#loc247)
    } -> tensor<1x64x16x16xbf16> loc(#loc247)
    %3 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<2048x512x1x1xbf16>}> : () -> tensor<2048x512x1x1xbf16> loc(#loc248)
    %4 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<512x512x3x3xbf16>}> : () -> tensor<512x512x3x3xbf16> loc(#loc248)
    %5 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<512x2048x1x1xbf16>}> : () -> tensor<512x2048x1x1xbf16> loc(#loc248)
    %6 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<2048x512x1x1xbf16>}> : () -> tensor<2048x512x1x1xbf16> loc(#loc248)
    %7 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<512x512x3x3xbf16>}> : () -> tensor<512x512x3x3xbf16> loc(#loc248)
    %8 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<512x2048x1x1xbf16>}> : () -> tensor<512x2048x1x1xbf16> loc(#loc248)
    %9 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<2048x1024x1x1xbf16>}> : () -> tensor<2048x1024x1x1xbf16> loc(#loc248)
    %10 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<2048x512x1x1xbf16>}> : () -> tensor<2048x512x1x1xbf16> loc(#loc248)
    %11 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<512x512x3x3xbf16>}> : () -> tensor<512x512x3x3xbf16> loc(#loc248)
    %12 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<512x1024x1x1xbf16>}> : () -> tensor<512x1024x1x1xbf16> loc(#loc248)
    %13 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<1024x256x1x1xbf16>}> : () -> tensor<1024x256x1x1xbf16> loc(#loc248)
    %14 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<256x256x3x3xbf16>}> : () -> tensor<256x256x3x3xbf16> loc(#loc248)
    %15 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<256x1024x1x1xbf16>}> : () -> tensor<256x1024x1x1xbf16> loc(#loc248)
    %16 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<1024x256x1x1xbf16>}> : () -> tensor<1024x256x1x1xbf16> loc(#loc248)
    %17 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<256x256x3x3xbf16>}> : () -> tensor<256x256x3x3xbf16> loc(#loc248)
    %18 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<256x1024x1x1xbf16>}> : () -> tensor<256x1024x1x1xbf16> loc(#loc248)
    %19 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<1024x256x1x1xbf16>}> : () -> tensor<1024x256x1x1xbf16> loc(#loc248)
    %20 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<256x256x3x3xbf16>}> : () -> tensor<256x256x3x3xbf16> loc(#loc248)
    %21 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<256x1024x1x1xbf16>}> : () -> tensor<256x1024x1x1xbf16> loc(#loc248)
    %22 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<1024x256x1x1xbf16>}> : () -> tensor<1024x256x1x1xbf16> loc(#loc248)
    %23 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<256x256x3x3xbf16>}> : () -> tensor<256x256x3x3xbf16> loc(#loc248)
    %24 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<256x1024x1x1xbf16>}> : () -> tensor<256x1024x1x1xbf16> loc(#loc248)
    %25 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<1024x256x1x1xbf16>}> : () -> tensor<1024x256x1x1xbf16> loc(#loc248)
    %26 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<256x256x3x3xbf16>}> : () -> tensor<256x256x3x3xbf16> loc(#loc248)
    %27 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<256x1024x1x1xbf16>}> : () -> tensor<256x1024x1x1xbf16> loc(#loc248)
    %28 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<1024x512x1x1xbf16>}> : () -> tensor<1024x512x1x1xbf16> loc(#loc248)
    %29 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<1024x256x1x1xbf16>}> : () -> tensor<1024x256x1x1xbf16> loc(#loc248)
    %30 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<256x256x3x3xbf16>}> : () -> tensor<256x256x3x3xbf16> loc(#loc248)
    %31 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<256x512x1x1xbf16>}> : () -> tensor<256x512x1x1xbf16> loc(#loc248)
    %32 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<512x128x1x1xbf16>}> : () -> tensor<512x128x1x1xbf16> loc(#loc248)
    %33 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<128x128x3x3xbf16>}> : () -> tensor<128x128x3x3xbf16> loc(#loc248)
    %34 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<128x512x1x1xbf16>}> : () -> tensor<128x512x1x1xbf16> loc(#loc248)
    %35 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<512x128x1x1xbf16>}> : () -> tensor<512x128x1x1xbf16> loc(#loc248)
    %36 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<128x128x3x3xbf16>}> : () -> tensor<128x128x3x3xbf16> loc(#loc248)
    %37 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<128x512x1x1xbf16>}> : () -> tensor<128x512x1x1xbf16> loc(#loc248)
    %38 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<512x128x1x1xbf16>}> : () -> tensor<512x128x1x1xbf16> loc(#loc248)
    %39 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<128x128x3x3xbf16>}> : () -> tensor<128x128x3x3xbf16> loc(#loc248)
    %40 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<128x512x1x1xbf16>}> : () -> tensor<128x512x1x1xbf16> loc(#loc248)
    %41 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<512x256x1x1xbf16>}> : () -> tensor<512x256x1x1xbf16> loc(#loc248)
    %42 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<512x128x1x1xbf16>}> : () -> tensor<512x128x1x1xbf16> loc(#loc248)
    %43 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<128x128x3x3xbf16>}> : () -> tensor<128x128x3x3xbf16> loc(#loc248)
    %44 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<128x256x1x1xbf16>}> : () -> tensor<128x256x1x1xbf16> loc(#loc248)
    %45 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<256x64x1x1xbf16>}> : () -> tensor<256x64x1x1xbf16> loc(#loc248)
    %46 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<64x64x3x3xbf16>}> : () -> tensor<64x64x3x3xbf16> loc(#loc248)
    %47 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<64x256x1x1xbf16>}> : () -> tensor<64x256x1x1xbf16> loc(#loc248)
    %48 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<256x64x1x1xbf16>}> : () -> tensor<256x64x1x1xbf16> loc(#loc248)
    %49 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<64x64x3x3xbf16>}> : () -> tensor<64x64x3x3xbf16> loc(#loc248)
    %50 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<64x256x1x1xbf16>}> : () -> tensor<64x256x1x1xbf16> loc(#loc248)
    %51 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<256x64x1x1xbf16>}> : () -> tensor<256x64x1x1xbf16> loc(#loc248)
    %52 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<256x64x1x1xbf16>}> : () -> tensor<256x64x1x1xbf16> loc(#loc248)
    %53 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<64x64x3x3xbf16>}> : () -> tensor<64x64x3x3xbf16> loc(#loc248)
    %54 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<64x64x1x1xbf16>}> : () -> tensor<64x64x1x1xbf16> loc(#loc248)
    %55 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<1x64x10xbf16>}> : () -> tensor<1x64x10xbf16> loc(#loc248)
    %56 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<1x2048x64xbf16>}> : () -> tensor<1x2048x64xbf16> loc(#loc248)
    %57 = "tosa.const"() <{value = dense<[[[7.714840e-02, -1.289060e-01, -7.324210e-02, 3.417970e-02, 6.079100e-02, 3.369140e-02, 9.521480e-02, 1.977540e-02, -3.784180e-02, -7.958980e-02]]]> : tensor<1x1x10xbf16>}> : () -> tensor<1x1x10xbf16> loc(#loc248)
    %58 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<1x1x64xbf16>}> : () -> tensor<1x1x64xbf16> loc(#loc248)
    %59 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<256xbf16>}> : () -> tensor<256xbf16> loc(#loc251)
    %60 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<512xbf16>}> : () -> tensor<512xbf16> loc(#loc252)
    %61 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<1024xbf16>}> : () -> tensor<1024xbf16> loc(#loc253)
    %62 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<128xbf16>}> : () -> tensor<128xbf16> loc(#loc254)
    %63 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<128xbf16>}> : () -> tensor<128xbf16> loc(#loc255)
    %64 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<512xbf16>}> : () -> tensor<512xbf16> loc(#loc256)
    %65 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<128xbf16>}> : () -> tensor<128xbf16> loc(#loc257)
    %66 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<1024xbf16>}> : () -> tensor<1024xbf16> loc(#loc258)
    %67 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<64xbf16>}> : () -> tensor<64xbf16> loc(#loc259)
    %68 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<128xbf16>}> : () -> tensor<128xbf16> loc(#loc260)
    %69 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<256xbf16>}> : () -> tensor<256xbf16> loc(#loc261)
    %70 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<512xbf16>}> : () -> tensor<512xbf16> loc(#loc262)
    %71 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<256xbf16>}> : () -> tensor<256xbf16> loc(#loc263)
    %72 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<128xbf16>}> : () -> tensor<128xbf16> loc(#loc264)
    %73 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<512xbf16>}> : () -> tensor<512xbf16> loc(#loc265)
    %74 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<256xbf16>}> : () -> tensor<256xbf16> loc(#loc266)
    %75 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<512xbf16>}> : () -> tensor<512xbf16> loc(#loc267)
    %76 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<256xbf16>}> : () -> tensor<256xbf16> loc(#loc268)
    %77 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<64xbf16>}> : () -> tensor<64xbf16> loc(#loc269)
    %78 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<512xbf16>}> : () -> tensor<512xbf16> loc(#loc270)
    %79 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<1024xbf16>}> : () -> tensor<1024xbf16> loc(#loc271)
    %80 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<256xbf16>}> : () -> tensor<256xbf16> loc(#loc272)
    %81 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<256xbf16>}> : () -> tensor<256xbf16> loc(#loc273)
    %82 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<256xbf16>}> : () -> tensor<256xbf16> loc(#loc274)
    %83 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<64xbf16>}> : () -> tensor<64xbf16> loc(#loc275)
    %84 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<128xbf16>}> : () -> tensor<128xbf16> loc(#loc276)
    %85 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<512xbf16>}> : () -> tensor<512xbf16> loc(#loc277)
    %86 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<256xbf16>}> : () -> tensor<256xbf16> loc(#loc278)
    %87 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<128xbf16>}> : () -> tensor<128xbf16> loc(#loc279)
    %88 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<128xbf16>}> : () -> tensor<128xbf16> loc(#loc280)
    %89 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<256xbf16>}> : () -> tensor<256xbf16> loc(#loc281)
    %90 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<2048xbf16>}> : () -> tensor<2048xbf16> loc(#loc282)
    %91 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<256xbf16>}> : () -> tensor<256xbf16> loc(#loc283)
    %92 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<1024xbf16>}> : () -> tensor<1024xbf16> loc(#loc284)
    %93 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<512xbf16>}> : () -> tensor<512xbf16> loc(#loc285)
    %94 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<1024xbf16>}> : () -> tensor<1024xbf16> loc(#loc286)
    %95 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<256xbf16>}> : () -> tensor<256xbf16> loc(#loc287)
    %96 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<2048xbf16>}> : () -> tensor<2048xbf16> loc(#loc288)
    %97 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<2048xbf16>}> : () -> tensor<2048xbf16> loc(#loc289)
    %98 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<256xbf16>}> : () -> tensor<256xbf16> loc(#loc290)
    %99 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<512xbf16>}> : () -> tensor<512xbf16> loc(#loc291)
    %100 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<2048xbf16>}> : () -> tensor<2048xbf16> loc(#loc292)
    %101 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<512xbf16>}> : () -> tensor<512xbf16> loc(#loc293)
    %102 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<256xbf16>}> : () -> tensor<256xbf16> loc(#loc294)
    %103 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<64xbf16>}> : () -> tensor<64xbf16> loc(#loc295)
    %104 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<1024xbf16>}> : () -> tensor<1024xbf16> loc(#loc296)
    %105 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<512xbf16>}> : () -> tensor<512xbf16> loc(#loc297)
    %106 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<1024xbf16>}> : () -> tensor<1024xbf16> loc(#loc298)
    %107 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<64xbf16>}> : () -> tensor<64xbf16> loc(#loc299)
    %108 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<256xbf16>}> : () -> tensor<256xbf16> loc(#loc300)
    %109 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<64xbf16>}> : () -> tensor<64xbf16> loc(#loc301)
    %110 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<256xbf16>}> : () -> tensor<256xbf16> loc(#loc302)
    %111 = xten_nn.subgraph (%arg1 = %2: tensor<1x64x16x16xbf16>)  attributes {
      IfmOperands = [0 : index],
      LayerName = "/maxpool/MaxPool_Duplicated#1",
      Operands = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          Name = "/relu/Relu_output_0",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 64, 16, 16]> : vector<4xindex>
        }
      ],
      OutputName = "/maxpool/MaxPool_Duplicated#1",
      Reason = "InCoreChain",
      Results = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          Name = "/maxpool/MaxPool_output_0",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 64, 8, 8]> : vector<4xindex>
        }
      ],
      TilingRecipe = {
        "conv-spatial-2d" = false,
        "conv-split-stamps" = true,
        "conv-split-stamps-OC-only" = false,
        "conv-split-stamps-OH-only" = false,
        "convtype-set-by-overlay-heuristic" = false,
        "disable-oh-spatial" = false,
        "disable-ow-spatial" = false,
        "dwc-split-stamps" = false,
        "elt-split-stamps" = true,
        "fm-superiters" = false,
        "icw-superiters" = false,
        "ocw-superiters" = true,
        "ow-superiters" = false,
        "pool-split-stamps" = false,
        "reduce-split-stamps" = false
      },
      logical_mode = "2x_4x4_1x4_vertBroadcastLeft_horizBroadcastRight",
      memory_configuration = {
        L1 = {layout = "strictlegacy"},
        L2 = {ifm_buffering = "single", layout = "flexible", limited_wts_space = false, ofm_buffering = "single", weights_buffering = "double"}
      }} {
      %169 = xten_nn.subgraph (%arg2 = %arg1: tensor<1x64x16x16xbf16>)  attributes {
        Dilations = array<i64: 1, 1>,
        HWPadding = [[1, 0], [1, 0]],
        LayerName = "/maxpool/MaxPool_Duplicated#1",
        Operands = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/relu/Relu_output_0",
            Port = "data_io.ifm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 64, 16, 16]> : vector<4xindex>
          }
        ],
        OutputName = "/maxpool/MaxPool_Duplicated#1",
        PadValue = 0.000000e+00 : bf16,
        Reason = "MllibKernel",
        Results = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/maxpool/MaxPool_output_0",
            Port = "data_io.ofm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 64, 8, 8]> : vector<4xindex>
          }
        ],
        Specializes = "MaxPool2dBf16",
        Traits = {
          NonNegativeIn = true,
          NonNegativeOut = true
        },
        With = {
          config.aie_arch = "aie2p",
          config.batch_size = 1 : ui8,
          config.compiler = "peano",
          config.dtype = "bfloat16",
          config.ksize = 3 : ui8,
          config.stride_log2 = 1 : ui8
        }} {
        %170 = "tosa.const"() <{value = dense<[0, 2, 3, 1]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc248)
        %171 = "tosa.const"() <{value = dense<[0, 3, 1, 2]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc248)
        %172 = tosa.const_shape  {value = dense<[0, 0, 0, 0, 1, 0, 1, 0]> : tensor<8xindex>} : () -> !tosa.shape<8> loc(#loc248)
        %173 = "tosa.const"() <{value = dense<0xFF80> : tensor<bf16>}> : () -> tensor<bf16> loc(#loc248)
        %174 = tosa.pad %arg2, %172, %173 : (tensor<1x64x16x16xbf16>, !tosa.shape<8>, tensor<bf16>) -> tensor<1x64x17x17xbf16> loc(#loc303)
        %175 = tosa.transpose %174, %170 : (tensor<1x64x17x17xbf16>, tensor<4xi32>) -> tensor<1x17x17x64xbf16> loc(#loc303)
        %176 = tosa.max_pool2d %175 {
          OutputName = "/maxpool/MaxPool",
          PartOfLayerName = "/maxpool/MaxPool",
          kernel = array<i64: 3, 3>,
          pad = array<i64: 0, 0, 0, 0>,
          stride = array<i64: 2, 2>} : (tensor<1x17x17x64xbf16>) -> tensor<1x8x8x64xbf16> loc(#loc303)
        %177 = tosa.transpose %176, %171 : (tensor<1x8x8x64xbf16>, tensor<4xi32>) -> tensor<1x64x8x8xbf16> loc(#loc303)
        xten_nn.output %177 : tensor<1x64x8x8xbf16> loc(#loc303)
      } -> tensor<1x64x8x8xbf16> loc(#loc303)
      xten_nn.output %169 : tensor<1x64x8x8xbf16> loc(#loc303)
    } -> tensor<1x64x8x8xbf16> loc(#loc303)
    %112 = xten_nn.subgraph (%arg1 = %111: tensor<1x64x8x8xbf16>, %arg2 = %54: tensor<64x64x1x1xbf16>, %arg3 = %107: tensor<64xbf16>)  attributes {
      IfmOperands = [0 : index],
      LayerName = "/layer1/layer1.0/relu/Relu",
      Operands = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 64, 8, 8]> : vector<4xindex>
        },
        {
          UnknownDataFormat = true,
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[64, 64, 1, 1]> : vector<4xindex>
        },
        {
          UnknownDataFormat = true
        }
      ],
      OutputName = "/layer1/layer1.0/conv1/Conv",
      Reason = "InCoreChain",
      Results = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          Name = "/layer1/layer1.0/conv1/Conv_output_0",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 64, 8, 8]> : vector<4xindex>
        }
      ],
      TilingRecipe = {
        "conv-spatial-2d" = false,
        "conv-split-stamps" = true,
        "conv-split-stamps-OC-only" = false,
        "conv-split-stamps-OH-only" = false,
        "convtype-set-by-overlay-heuristic" = false,
        "disable-oh-spatial" = false,
        "disable-ow-spatial" = false,
        "dwc-split-stamps" = false,
        "elt-split-stamps" = true,
        "fm-superiters" = false,
        "icw-superiters" = false,
        "ocw-superiters" = true,
        "ow-superiters" = false,
        "pool-split-stamps" = false,
        "reduce-split-stamps" = false
      },
      logical_mode = "2x_4x4_1x4_vertBroadcastLeft_horizBroadcastRight",
      memory_configuration = {
        L1 = {layout = "strictlegacy"},
        L2 = {ifm_buffering = "single", layout = "flexible", limited_wts_space = false, ofm_buffering = "single", weights_buffering = "double"}
      }} {
      %169 = xten_nn.subgraph (%arg4 = %arg1: tensor<1x64x8x8xbf16>, %arg5 = %arg2: tensor<64x64x1x1xbf16>, %arg6 = %arg3: tensor<64xbf16>)  attributes {
        Dilations = array<i64: 1, 1>,
        HWPadding = [[0, 0], [0, 0]],
        LayerName = "/layer1/layer1.0/relu/Relu",
        Operands = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Port = "data_io.ifm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 64, 8, 8]> : vector<4xindex>
          },
          {
            Port = "data_io.wts",
            SubPort = "wts_data",
            UnknownDataFormat = true,
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[64, 64, 1, 1]> : vector<4xindex>
          },
          {
            Port = "data_io.wts",
            SubPort = "bias",
            UnknownDataFormat = true
          }
        ],
        OutputName = "/layer1/layer1.0/conv1/Conv",
        Reason = "MllibKernel",
        Results = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer1/layer1.0/conv1/Conv_output_0",
            Port = "data_io.ofm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 64, 8, 8]> : vector<4xindex>
          }
        ],
        Specializes = "Conv2DBf16",
        Traits = {
          AllowDMAOptimization = true,
          NonNegativeOut = true
        },
        With = {
          config.AIE_API_EMULATE_BFLOAT16_MMUL_WITH_BFP16 = 1 : ui8,
          config.act = 1 : ui8,
          config.act_type = "RELU",
          config.aie_arch = "aie2p",
          config.batch_size = 1 : ui8,
          config.compiler = "peano",
          config.conv_type = [0 : ui8, 12 : ui8, 64 : ui8],
          config.dtype_ifm = "bfloat16",
          config.dtype_ofm = "bfloat16",
          config.dtype_wts = "bfloat16",
          config.enable_bfp16_wts = 0 : ui8,
          config.ksize.height = 1 : ui8,
          config.ksize.width = 1 : ui8,
          config.lrelu_alpha = 0.000000e+00 : f32,
          config.stride_h = 1 : ui8,
          config.stride_w = 1 : ui8
        }} {
        %170 = "tosa.const"() <{value = dense<[0, 3, 1, 2]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc248)
        %171 = "tosa.const"() <{value = dense<[0, 2, 3, 1]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc248)
        %172 = tosa.reshape %arg5 {new_shape = array<i64: 64, 1, 1, 64>} : (tensor<64x64x1x1xbf16>) -> tensor<64x1x1x64xbf16> loc(#loc304)
        %173 = tosa.transpose %arg4, %171 : (tensor<1x64x8x8xbf16>, tensor<4xi32>) -> tensor<1x8x8x64xbf16> loc(#loc304)
        %174 = tosa.conv2d %173, %172, %arg6 {
          PartOfLayerName = "/layer1/layer1.0/conv1/Conv",
          PartOfOutputName = "/layer1/layer1.0/conv1/Conv",
          acc_type = f32,
          dilation = array<i64: 1, 1>,
          pad = array<i64: 0, 0, 0, 0>,
          stride = array<i64: 1, 1>} : (tensor<1x8x8x64xbf16>, tensor<64x1x1x64xbf16>, tensor<64xbf16>) -> tensor<1x8x8x64xbf16> loc(#loc305)
        %175 = tosa.clamp %174 {
          LayerName = "/layer1/layer1.0/relu/Relu",
          OutputName = "/layer1/layer1.0/relu/Relu",
          max_fp = 3.40282347E+38 : f32,
          max_int = 2147483647 : i64,
          min_fp = 0.000000e+00 : f32,
          min_int = 0 : i64} : (tensor<1x8x8x64xbf16>) -> tensor<1x8x8x64xbf16> loc(#loc306)
        %176 = tosa.transpose %175, %170 : (tensor<1x8x8x64xbf16>, tensor<4xi32>) -> tensor<1x64x8x8xbf16> loc(#loc304)
        xten_nn.output %176 : tensor<1x64x8x8xbf16> loc(#loc306)
      } -> tensor<1x64x8x8xbf16> loc(#loc304)
      xten_nn.output %169 : tensor<1x64x8x8xbf16> loc(#loc304)
    } -> tensor<1x64x8x8xbf16> loc(#loc304)
    %113 = xten_nn.subgraph (%arg1 = %112: tensor<1x64x8x8xbf16>, %arg2 = %53: tensor<64x64x3x3xbf16>, %arg3 = %77: tensor<64xbf16>)  attributes {
      IfmOperands = [0 : index],
      LayerName = "/layer1/layer1.0/relu_1/Relu",
      Operands = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 64, 8, 8]> : vector<4xindex>
        },
        {
          UnknownDataFormat = true,
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[64, 64, 3, 3]> : vector<4xindex>
        },
        {
          UnknownDataFormat = true
        }
      ],
      OutputName = "/layer1/layer1.0/conv2/Conv",
      Reason = "InCoreChain",
      Results = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          Name = "/layer1/layer1.0/conv2/Conv_output_0",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 64, 8, 8]> : vector<4xindex>
        }
      ],
      TilingRecipe = {
        "conv-spatial-2d" = false,
        "conv-split-stamps" = true,
        "conv-split-stamps-OC-only" = false,
        "conv-split-stamps-OH-only" = false,
        "convtype-set-by-overlay-heuristic" = false,
        "disable-oh-spatial" = false,
        "disable-ow-spatial" = false,
        "dwc-split-stamps" = false,
        "elt-split-stamps" = true,
        "fm-superiters" = false,
        "icw-superiters" = false,
        "ocw-superiters" = true,
        "ow-superiters" = false,
        "pool-split-stamps" = false,
        "reduce-split-stamps" = false
      },
      logical_mode = "2x_4x4_1x4_vertBroadcastLeft_horizBroadcastRight",
      memory_configuration = {
        L1 = {layout = "strictlegacy"},
        L2 = {ifm_buffering = "single", layout = "flexible", limited_wts_space = false, ofm_buffering = "single", weights_buffering = "double"}
      }} {
      %169 = xten_nn.subgraph (%arg4 = %arg1: tensor<1x64x8x8xbf16>, %arg5 = %arg2: tensor<64x64x3x3xbf16>, %arg6 = %arg3: tensor<64xbf16>)  attributes {
        Dilations = array<i64: 1, 1>,
        HWPadding = [[1, 1], [1, 1]],
        LayerName = "/layer1/layer1.0/relu_1/Relu",
        Operands = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Port = "data_io.ifm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 64, 8, 8]> : vector<4xindex>
          },
          {
            Port = "data_io.wts",
            SubPort = "wts_data",
            UnknownDataFormat = true,
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[64, 64, 3, 3]> : vector<4xindex>
          },
          {
            Port = "data_io.wts",
            SubPort = "bias",
            UnknownDataFormat = true
          }
        ],
        OutputName = "/layer1/layer1.0/conv2/Conv",
        Reason = "MllibKernel",
        Results = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer1/layer1.0/conv2/Conv_output_0",
            Port = "data_io.ofm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 64, 8, 8]> : vector<4xindex>
          }
        ],
        Specializes = "Conv2DBf16",
        Traits = {
          AllowDMAOptimization = true,
          NonNegativeOut = true
        },
        With = {
          config.AIE_API_EMULATE_BFLOAT16_MMUL_WITH_BFP16 = 1 : ui8,
          config.act = 1 : ui8,
          config.act_type = "RELU",
          config.aie_arch = "aie2p",
          config.batch_size = 1 : ui8,
          config.compiler = "peano",
          config.conv_type = [0 : ui8, 12 : ui8, 64 : ui8],
          config.dtype_ifm = "bfloat16",
          config.dtype_ofm = "bfloat16",
          config.dtype_wts = "bfloat16",
          config.enable_bfp16_wts = 0 : ui8,
          config.ksize.height = 3 : ui8,
          config.ksize.width = 3 : ui8,
          config.lrelu_alpha = 0.000000e+00 : f32,
          config.stride_h = 1 : ui8,
          config.stride_w = 1 : ui8
        }} {
        %170 = "tosa.const"() <{value = dense<[0, 3, 1, 2]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc248)
        %171 = "tosa.const"() <{value = dense<[0, 2, 3, 1]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc248)
        %172 = tosa.transpose %arg5, %171 : (tensor<64x64x3x3xbf16>, tensor<4xi32>) -> tensor<64x3x3x64xbf16> loc(#loc307)
        %173 = tosa.transpose %arg4, %171 : (tensor<1x64x8x8xbf16>, tensor<4xi32>) -> tensor<1x8x8x64xbf16> loc(#loc307)
        %174 = tosa.conv2d %173, %172, %arg6 {
          PartOfLayerName = "/layer1/layer1.0/conv2/Conv",
          PartOfOutputName = "/layer1/layer1.0/conv2/Conv",
          acc_type = f32,
          dilation = array<i64: 1, 1>,
          pad = array<i64: 1, 1, 1, 1>,
          stride = array<i64: 1, 1>} : (tensor<1x8x8x64xbf16>, tensor<64x3x3x64xbf16>, tensor<64xbf16>) -> tensor<1x8x8x64xbf16> loc(#loc308)
        %175 = tosa.clamp %174 {
          LayerName = "/layer1/layer1.0/relu_1/Relu",
          OutputName = "/layer1/layer1.0/relu_1/Relu",
          max_fp = 3.40282347E+38 : f32,
          max_int = 2147483647 : i64,
          min_fp = 0.000000e+00 : f32,
          min_int = 0 : i64} : (tensor<1x8x8x64xbf16>) -> tensor<1x8x8x64xbf16> loc(#loc309)
        %176 = tosa.transpose %175, %170 : (tensor<1x8x8x64xbf16>, tensor<4xi32>) -> tensor<1x64x8x8xbf16> loc(#loc307)
        xten_nn.output %176 : tensor<1x64x8x8xbf16> loc(#loc309)
      } -> tensor<1x64x8x8xbf16> loc(#loc307)
      xten_nn.output %169 : tensor<1x64x8x8xbf16> loc(#loc307)
    } -> tensor<1x64x8x8xbf16> loc(#loc307)
    %114 = xten_nn.subgraph (%arg1 = %111: tensor<1x64x8x8xbf16>, %arg2 = %51: tensor<256x64x1x1xbf16>, %arg3 = %108: tensor<256xbf16>)  attributes {
      IfmOperands = [0 : index],
      LayerName = "/layer1/layer1.0/downsample/downsample.0/Conv",
      Operands = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          Name = "/maxpool/MaxPool_output_0",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 64, 8, 8]> : vector<4xindex>
        },
        {
          Name = "onnx::Conv_513",
          UnknownDataFormat = true,
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[256, 64, 1, 1]> : vector<4xindex>
        },
        {
          Name = "onnx::Conv_514",
          UnknownDataFormat = true
        }
      ],
      OutputName = "/layer1/layer1.0/downsample/downsample.0/Conv",
      Reason = "InCoreChain",
      Results = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          Name = "/layer1/layer1.0/downsample/downsample.0/Conv_output_0",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 256, 8, 8]> : vector<4xindex>
        }
      ],
      TilingRecipe = {
        "conv-spatial-2d" = false,
        "conv-split-stamps" = true,
        "conv-split-stamps-OC-only" = false,
        "conv-split-stamps-OH-only" = false,
        "convtype-set-by-overlay-heuristic" = false,
        "disable-oh-spatial" = false,
        "disable-ow-spatial" = false,
        "dwc-split-stamps" = false,
        "elt-split-stamps" = true,
        "fm-superiters" = false,
        "icw-superiters" = false,
        "ocw-superiters" = true,
        "ow-superiters" = false,
        "pool-split-stamps" = false,
        "reduce-split-stamps" = false
      },
      logical_mode = "2x_4x4_1x4_vertBroadcastLeft_horizBroadcastRight",
      memory_configuration = {
        L1 = {layout = "strictlegacy"},
        L2 = {ifm_buffering = "single", layout = "flexible", limited_wts_space = false, ofm_buffering = "single", weights_buffering = "double"}
      }} {
      %169 = xten_nn.subgraph (%arg4 = %arg1: tensor<1x64x8x8xbf16>, %arg5 = %arg2: tensor<256x64x1x1xbf16>, %arg6 = %arg3: tensor<256xbf16>)  attributes {
        Dilations = array<i64: 1, 1>,
        HWPadding = [[0, 0], [0, 0]],
        LayerName = "/layer1/layer1.0/downsample/downsample.0/Conv",
        Operands = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/maxpool/MaxPool_output_0",
            Port = "data_io.ifm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 64, 8, 8]> : vector<4xindex>
          },
          {
            Name = "onnx::Conv_513",
            Port = "data_io.wts",
            SubPort = "wts_data",
            UnknownDataFormat = true,
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[256, 64, 1, 1]> : vector<4xindex>
          },
          {
            Name = "onnx::Conv_514",
            Port = "data_io.wts",
            SubPort = "bias",
            UnknownDataFormat = true
          }
        ],
        OutputName = "/layer1/layer1.0/downsample/downsample.0/Conv",
        Reason = "MllibKernel",
        Results = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer1/layer1.0/downsample/downsample.0/Conv_output_0",
            Port = "data_io.ofm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 256, 8, 8]> : vector<4xindex>
          }
        ],
        Specializes = "Conv2DBf16",
        Traits = {
          AllowDMAOptimization = true
        },
        With = {
          config.AIE_API_EMULATE_BFLOAT16_MMUL_WITH_BFP16 = 1 : ui8,
          config.act = 0 : ui8,
          config.act_type = "RELU",
          config.aie_arch = "aie2p",
          config.batch_size = 1 : ui8,
          config.compiler = "peano",
          config.conv_type = [0 : ui8, 12 : ui8, 64 : ui8],
          config.dtype_ifm = "bfloat16",
          config.dtype_ofm = "bfloat16",
          config.dtype_wts = "bfloat16",
          config.enable_bfp16_wts = 0 : ui8,
          config.ksize.height = 1 : ui8,
          config.ksize.width = 1 : ui8,
          config.lrelu_alpha = 1.000000e+00 : f32,
          config.stride_h = 1 : ui8,
          config.stride_w = 1 : ui8
        }} {
        %170 = "tosa.const"() <{value = dense<[0, 3, 1, 2]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc248)
        %171 = "tosa.const"() <{value = dense<[0, 2, 3, 1]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc248)
        %172 = tosa.reshape %arg5 {new_shape = array<i64: 256, 1, 1, 64>} : (tensor<256x64x1x1xbf16>) -> tensor<256x1x1x64xbf16> loc(#loc310)
        %173 = tosa.transpose %arg4, %171 : (tensor<1x64x8x8xbf16>, tensor<4xi32>) -> tensor<1x8x8x64xbf16> loc(#loc310)
        %174 = tosa.conv2d %173, %172, %arg6 {
          PartOfLayerName = "/layer1/layer1.0/downsample/downsample.0/Conv",
          PartOfOutputName = "/layer1/layer1.0/downsample/downsample.0/Conv",
          acc_type = f32,
          dilation = array<i64: 1, 1>,
          pad = array<i64: 0, 0, 0, 0>,
          stride = array<i64: 1, 1>} : (tensor<1x8x8x64xbf16>, tensor<256x1x1x64xbf16>, tensor<256xbf16>) -> tensor<1x8x8x256xbf16> loc(#loc310)
        %175 = tosa.transpose %174, %170 : (tensor<1x8x8x256xbf16>, tensor<4xi32>) -> tensor<1x256x8x8xbf16> loc(#loc310)
        xten_nn.output %175 : tensor<1x256x8x8xbf16> loc(#loc310)
      } -> tensor<1x256x8x8xbf16> loc(#loc310)
      xten_nn.output %169 : tensor<1x256x8x8xbf16> loc(#loc310)
    } -> tensor<1x256x8x8xbf16> loc(#loc310)
    %115 = xten_nn.subgraph (%arg1 = %113: tensor<1x64x8x8xbf16>, %arg2 = %52: tensor<256x64x1x1xbf16>, %arg3 = %110: tensor<256xbf16>, %arg4 = %114: tensor<1x256x8x8xbf16>)  attributes {
      IfmOperands = [0 : index, 3 : index],
      LayerName = "/layer1/layer1.0/conv3/Conv",
      OfmShare = 3 : index,
      Operands = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          Name = "/layer1/layer1.0/relu_1/Relu_output_0",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 64, 8, 8]> : vector<4xindex>
        },
        {
          Name = "onnx::Conv_510",
          UnknownDataFormat = true,
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[256, 64, 1, 1]> : vector<4xindex>
        },
        {
          Name = "onnx::Conv_511",
          UnknownDataFormat = true
        },
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          Name = "/layer1/layer1.0/Add_output_0",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 256, 8, 8]> : vector<4xindex>
        }
      ],
      OutputName = "/layer1/layer1.0/Add",
      Reason = "InCoreChain",
      Results = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          Name = "/layer1/layer1.0/Add_output_0",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 256, 8, 8]> : vector<4xindex>
        }
      ],
      TilingRecipe = {
        "conv-spatial-2d" = false,
        "conv-split-stamps" = true,
        "conv-split-stamps-OC-only" = false,
        "conv-split-stamps-OH-only" = false,
        "convtype-set-by-overlay-heuristic" = false,
        "disable-oh-spatial" = false,
        "disable-ow-spatial" = false,
        "dwc-split-stamps" = false,
        "elt-split-stamps" = true,
        "fm-superiters" = false,
        "icw-superiters" = false,
        "ocw-superiters" = true,
        "ow-superiters" = false,
        "pool-split-stamps" = false,
        "reduce-split-stamps" = false
      },
      logical_mode = "2x_4x4_1x4_vertBroadcastLeft_horizBroadcastRight",
      memory_configuration = {
        L1 = {layout = "strictlegacy"},
        L2 = {ifm_buffering = "single", layout = "flexible", limited_wts_space = false, ofm_buffering = "single", weights_buffering = "double"}
      }} {
      %169 = xten_nn.subgraph (%arg5 = %arg1: tensor<1x64x8x8xbf16>, %arg6 = %arg2: tensor<256x64x1x1xbf16>, %arg7 = %arg3: tensor<256xbf16>)  attributes {
        Dilations = array<i64: 1, 1>,
        HWPadding = [[0, 0], [0, 0]],
        LayerName = "/layer1/layer1.0/conv3/Conv",
        Operands = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer1/layer1.0/relu_1/Relu_output_0",
            Port = "data_io.ifm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 64, 8, 8]> : vector<4xindex>
          },
          {
            Name = "onnx::Conv_510",
            Port = "data_io.wts",
            SubPort = "wts_data",
            UnknownDataFormat = true,
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[256, 64, 1, 1]> : vector<4xindex>
          },
          {
            Name = "onnx::Conv_511",
            Port = "data_io.wts",
            SubPort = "bias",
            UnknownDataFormat = true
          }
        ],
        OutputName = "/layer1/layer1.0/conv3/Conv",
        Reason = "MllibKernel",
        Results = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer1/layer1.0/conv3/Conv_output_0",
            Port = "data_io.ofm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 256, 8, 8]> : vector<4xindex>
          }
        ],
        Specializes = "Conv2DBf16",
        Traits = {
          AllowDMAOptimization = true
        },
        With = {
          config.AIE_API_EMULATE_BFLOAT16_MMUL_WITH_BFP16 = 1 : ui8,
          config.act = 0 : ui8,
          config.act_type = "RELU",
          config.aie_arch = "aie2p",
          config.batch_size = 1 : ui8,
          config.compiler = "peano",
          config.conv_type = [0 : ui8, 12 : ui8, 64 : ui8],
          config.dtype_ifm = "bfloat16",
          config.dtype_ofm = "bfloat16",
          config.dtype_wts = "bfloat16",
          config.enable_bfp16_wts = 0 : ui8,
          config.ksize.height = 1 : ui8,
          config.ksize.width = 1 : ui8,
          config.lrelu_alpha = 1.000000e+00 : f32,
          config.stride_h = 1 : ui8,
          config.stride_w = 1 : ui8
        }} {
        %171 = "tosa.const"() <{value = dense<[0, 3, 1, 2]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc248)
        %172 = "tosa.const"() <{value = dense<[0, 2, 3, 1]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc248)
        %173 = tosa.reshape %arg6 {new_shape = array<i64: 256, 1, 1, 64>} : (tensor<256x64x1x1xbf16>) -> tensor<256x1x1x64xbf16> loc(#loc312)
        %174 = tosa.transpose %arg5, %172 : (tensor<1x64x8x8xbf16>, tensor<4xi32>) -> tensor<1x8x8x64xbf16> loc(#loc312)
        %175 = tosa.conv2d %174, %173, %arg7 {
          PartOfLayerName = "/layer1/layer1.0/conv3/Conv",
          PartOfOutputName = "/layer1/layer1.0/conv3/Conv",
          acc_type = f32,
          dilation = array<i64: 1, 1>,
          pad = array<i64: 0, 0, 0, 0>,
          stride = array<i64: 1, 1>} : (tensor<1x8x8x64xbf16>, tensor<256x1x1x64xbf16>, tensor<256xbf16>) -> tensor<1x8x8x256xbf16> loc(#loc312)
        %176 = tosa.transpose %175, %171 : (tensor<1x8x8x256xbf16>, tensor<4xi32>) -> tensor<1x256x8x8xbf16> loc(#loc312)
        xten_nn.output %176 : tensor<1x256x8x8xbf16> loc(#loc312)
      } -> tensor<1x256x8x8xbf16> loc(#loc312)
      %170 = xten_nn.subgraph (%arg5 = %169: tensor<1x256x8x8xbf16>, %arg6 = %arg4: tensor<1x256x8x8xbf16>)  attributes {
        LayerName = "/layer1/layer1.0/relu_2/Relu",
        Operands = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer1/layer1.0/Add_output_0",
            Port = "data_io.ifm1",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 256, 8, 8]> : vector<4xindex>
          },
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer1/layer1.0/Add_output_0",
            Port = "data_io.ifm2",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 256, 8, 8]> : vector<4xindex>
          }
        ],
        OutputName = "/layer1/layer1.0/Add",
        Reason = "MllibKernel",
        Results = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer1/layer1.0/Add_output_0",
            Port = "data_io.ofm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 256, 8, 8]> : vector<4xindex>
          }
        ],
        Specializes = "AddBf16",
        Traits = {
          Binary = true,
          Elementwise = true,
          NonNegativeOut = true
        },
        With = {
          config.act = 1 : ui8,
          config.act_type = "RELU",
          config.aie_arch = "aie2p",
          config.compiler = "peano",
          config.dtype = "bfloat16"
        }} {
        %171 = tosa.add %arg5, %arg6 {LayerName = "/layer1/layer1.0/Add", OutputName = "/layer1/layer1.0/Add"} : (tensor<1x256x8x8xbf16>, tensor<1x256x8x8xbf16>) -> tensor<1x256x8x8xbf16> loc(#loc314)
        %172 = tosa.clamp %171 {
          LayerName = "/layer1/layer1.0/relu_2/Relu",
          OutputName = "/layer1/layer1.0/relu_2/Relu",
          max_fp = 3.40282347E+38 : f32,
          max_int = 2147483647 : i64,
          min_fp = 0.000000e+00 : f32,
          min_int = 0 : i64} : (tensor<1x256x8x8xbf16>) -> tensor<1x256x8x8xbf16> loc(#loc315)
        xten_nn.output %172 : tensor<1x256x8x8xbf16> loc(#loc315)
      } -> tensor<1x256x8x8xbf16> loc(#loc313)
      xten_nn.output %170 : tensor<1x256x8x8xbf16> loc(#loc313)
    } -> tensor<1x256x8x8xbf16> loc(#loc311)
    %116 = xten_nn.subgraph (%arg1 = %115: tensor<1x256x8x8xbf16>, %arg2 = %50: tensor<64x256x1x1xbf16>, %arg3 = %103: tensor<64xbf16>)  attributes {
      IfmOperands = [0 : index],
      LayerName = "/layer1/layer1.1/relu/Relu",
      Operands = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 256, 8, 8]> : vector<4xindex>
        },
        {
          UnknownDataFormat = true,
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[64, 256, 1, 1]> : vector<4xindex>
        },
        {
          UnknownDataFormat = true
        }
      ],
      OutputName = "/layer1/layer1.1/conv1/Conv",
      Reason = "InCoreChain",
      Results = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          Name = "/layer1/layer1.1/conv1/Conv_output_0",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 64, 8, 8]> : vector<4xindex>
        }
      ],
      TilingRecipe = {
        "conv-spatial-2d" = false,
        "conv-split-stamps" = true,
        "conv-split-stamps-OC-only" = false,
        "conv-split-stamps-OH-only" = false,
        "convtype-set-by-overlay-heuristic" = false,
        "disable-oh-spatial" = false,
        "disable-ow-spatial" = false,
        "dwc-split-stamps" = false,
        "elt-split-stamps" = true,
        "fm-superiters" = false,
        "icw-superiters" = false,
        "ocw-superiters" = true,
        "ow-superiters" = false,
        "pool-split-stamps" = false,
        "reduce-split-stamps" = false
      },
      logical_mode = "2x_4x4_1x4_vertBroadcastLeft_horizBroadcastRight",
      memory_configuration = {
        L1 = {layout = "strictlegacy"},
        L2 = {ifm_buffering = "single", layout = "flexible", limited_wts_space = false, ofm_buffering = "single", weights_buffering = "double"}
      }} {
      %169 = xten_nn.subgraph (%arg4 = %arg1: tensor<1x256x8x8xbf16>, %arg5 = %arg2: tensor<64x256x1x1xbf16>, %arg6 = %arg3: tensor<64xbf16>)  attributes {
        Dilations = array<i64: 1, 1>,
        HWPadding = [[0, 0], [0, 0]],
        LayerName = "/layer1/layer1.1/relu/Relu",
        Operands = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Port = "data_io.ifm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 256, 8, 8]> : vector<4xindex>
          },
          {
            Port = "data_io.wts",
            SubPort = "wts_data",
            UnknownDataFormat = true,
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[64, 256, 1, 1]> : vector<4xindex>
          },
          {
            Port = "data_io.wts",
            SubPort = "bias",
            UnknownDataFormat = true
          }
        ],
        OutputName = "/layer1/layer1.1/conv1/Conv",
        Reason = "MllibKernel",
        Results = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer1/layer1.1/conv1/Conv_output_0",
            Port = "data_io.ofm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 64, 8, 8]> : vector<4xindex>
          }
        ],
        Specializes = "Conv2DBf16",
        Traits = {
          AllowDMAOptimization = true,
          NonNegativeOut = true
        },
        With = {
          config.AIE_API_EMULATE_BFLOAT16_MMUL_WITH_BFP16 = 1 : ui8,
          config.act = 1 : ui8,
          config.act_type = "RELU",
          config.aie_arch = "aie2p",
          config.batch_size = 1 : ui8,
          config.compiler = "peano",
          config.conv_type = [0 : ui8, 12 : ui8, 64 : ui8],
          config.dtype_ifm = "bfloat16",
          config.dtype_ofm = "bfloat16",
          config.dtype_wts = "bfloat16",
          config.enable_bfp16_wts = 0 : ui8,
          config.ksize.height = 1 : ui8,
          config.ksize.width = 1 : ui8,
          config.lrelu_alpha = 0.000000e+00 : f32,
          config.stride_h = 1 : ui8,
          config.stride_w = 1 : ui8
        }} {
        %170 = "tosa.const"() <{value = dense<[0, 3, 1, 2]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc248)
        %171 = "tosa.const"() <{value = dense<[0, 2, 3, 1]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc248)
        %172 = tosa.reshape %arg5 {new_shape = array<i64: 64, 1, 1, 256>} : (tensor<64x256x1x1xbf16>) -> tensor<64x1x1x256xbf16> loc(#loc316)
        %173 = tosa.transpose %arg4, %171 : (tensor<1x256x8x8xbf16>, tensor<4xi32>) -> tensor<1x8x8x256xbf16> loc(#loc316)
        %174 = tosa.conv2d %173, %172, %arg6 {
          PartOfLayerName = "/layer1/layer1.1/conv1/Conv",
          PartOfOutputName = "/layer1/layer1.1/conv1/Conv",
          acc_type = f32,
          dilation = array<i64: 1, 1>,
          pad = array<i64: 0, 0, 0, 0>,
          stride = array<i64: 1, 1>} : (tensor<1x8x8x256xbf16>, tensor<64x1x1x256xbf16>, tensor<64xbf16>) -> tensor<1x8x8x64xbf16> loc(#loc317)
        %175 = tosa.clamp %174 {
          LayerName = "/layer1/layer1.1/relu/Relu",
          OutputName = "/layer1/layer1.1/relu/Relu",
          max_fp = 3.40282347E+38 : f32,
          max_int = 2147483647 : i64,
          min_fp = 0.000000e+00 : f32,
          min_int = 0 : i64} : (tensor<1x8x8x64xbf16>) -> tensor<1x8x8x64xbf16> loc(#loc318)
        %176 = tosa.transpose %175, %170 : (tensor<1x8x8x64xbf16>, tensor<4xi32>) -> tensor<1x64x8x8xbf16> loc(#loc316)
        xten_nn.output %176 : tensor<1x64x8x8xbf16> loc(#loc318)
      } -> tensor<1x64x8x8xbf16> loc(#loc316)
      xten_nn.output %169 : tensor<1x64x8x8xbf16> loc(#loc316)
    } -> tensor<1x64x8x8xbf16> loc(#loc316)
    %117 = xten_nn.subgraph (%arg1 = %116: tensor<1x64x8x8xbf16>, %arg2 = %49: tensor<64x64x3x3xbf16>, %arg3 = %67: tensor<64xbf16>)  attributes {
      IfmOperands = [0 : index],
      LayerName = "/layer1/layer1.1/relu_1/Relu",
      Operands = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 64, 8, 8]> : vector<4xindex>
        },
        {
          UnknownDataFormat = true,
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[64, 64, 3, 3]> : vector<4xindex>
        },
        {
          UnknownDataFormat = true
        }
      ],
      OutputName = "/layer1/layer1.1/conv2/Conv",
      Reason = "InCoreChain",
      Results = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          Name = "/layer1/layer1.1/conv2/Conv_output_0",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 64, 8, 8]> : vector<4xindex>
        }
      ],
      TilingRecipe = {
        "conv-spatial-2d" = false,
        "conv-split-stamps" = true,
        "conv-split-stamps-OC-only" = false,
        "conv-split-stamps-OH-only" = false,
        "convtype-set-by-overlay-heuristic" = false,
        "disable-oh-spatial" = false,
        "disable-ow-spatial" = false,
        "dwc-split-stamps" = false,
        "elt-split-stamps" = true,
        "fm-superiters" = false,
        "icw-superiters" = false,
        "ocw-superiters" = true,
        "ow-superiters" = false,
        "pool-split-stamps" = false,
        "reduce-split-stamps" = false
      },
      logical_mode = "2x_4x4_1x4_vertBroadcastLeft_horizBroadcastRight",
      memory_configuration = {
        L1 = {layout = "strictlegacy"},
        L2 = {ifm_buffering = "single", layout = "flexible", limited_wts_space = false, ofm_buffering = "single", weights_buffering = "double"}
      }} {
      %169 = xten_nn.subgraph (%arg4 = %arg1: tensor<1x64x8x8xbf16>, %arg5 = %arg2: tensor<64x64x3x3xbf16>, %arg6 = %arg3: tensor<64xbf16>)  attributes {
        Dilations = array<i64: 1, 1>,
        HWPadding = [[1, 1], [1, 1]],
        LayerName = "/layer1/layer1.1/relu_1/Relu",
        Operands = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Port = "data_io.ifm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 64, 8, 8]> : vector<4xindex>
          },
          {
            Port = "data_io.wts",
            SubPort = "wts_data",
            UnknownDataFormat = true,
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[64, 64, 3, 3]> : vector<4xindex>
          },
          {
            Port = "data_io.wts",
            SubPort = "bias",
            UnknownDataFormat = true
          }
        ],
        OutputName = "/layer1/layer1.1/conv2/Conv",
        Reason = "MllibKernel",
        Results = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer1/layer1.1/conv2/Conv_output_0",
            Port = "data_io.ofm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 64, 8, 8]> : vector<4xindex>
          }
        ],
        Specializes = "Conv2DBf16",
        Traits = {
          AllowDMAOptimization = true,
          NonNegativeOut = true
        },
        With = {
          config.AIE_API_EMULATE_BFLOAT16_MMUL_WITH_BFP16 = 1 : ui8,
          config.act = 1 : ui8,
          config.act_type = "RELU",
          config.aie_arch = "aie2p",
          config.batch_size = 1 : ui8,
          config.compiler = "peano",
          config.conv_type = [0 : ui8, 12 : ui8, 64 : ui8],
          config.dtype_ifm = "bfloat16",
          config.dtype_ofm = "bfloat16",
          config.dtype_wts = "bfloat16",
          config.enable_bfp16_wts = 0 : ui8,
          config.ksize.height = 3 : ui8,
          config.ksize.width = 3 : ui8,
          config.lrelu_alpha = 0.000000e+00 : f32,
          config.stride_h = 1 : ui8,
          config.stride_w = 1 : ui8
        }} {
        %170 = "tosa.const"() <{value = dense<[0, 3, 1, 2]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc248)
        %171 = "tosa.const"() <{value = dense<[0, 2, 3, 1]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc248)
        %172 = tosa.transpose %arg5, %171 : (tensor<64x64x3x3xbf16>, tensor<4xi32>) -> tensor<64x3x3x64xbf16> loc(#loc319)
        %173 = tosa.transpose %arg4, %171 : (tensor<1x64x8x8xbf16>, tensor<4xi32>) -> tensor<1x8x8x64xbf16> loc(#loc319)
        %174 = tosa.conv2d %173, %172, %arg6 {
          PartOfLayerName = "/layer1/layer1.1/conv2/Conv",
          PartOfOutputName = "/layer1/layer1.1/conv2/Conv",
          acc_type = f32,
          dilation = array<i64: 1, 1>,
          pad = array<i64: 1, 1, 1, 1>,
          stride = array<i64: 1, 1>} : (tensor<1x8x8x64xbf16>, tensor<64x3x3x64xbf16>, tensor<64xbf16>) -> tensor<1x8x8x64xbf16> loc(#loc320)
        %175 = tosa.clamp %174 {
          LayerName = "/layer1/layer1.1/relu_1/Relu",
          OutputName = "/layer1/layer1.1/relu_1/Relu",
          max_fp = 3.40282347E+38 : f32,
          max_int = 2147483647 : i64,
          min_fp = 0.000000e+00 : f32,
          min_int = 0 : i64} : (tensor<1x8x8x64xbf16>) -> tensor<1x8x8x64xbf16> loc(#loc321)
        %176 = tosa.transpose %175, %170 : (tensor<1x8x8x64xbf16>, tensor<4xi32>) -> tensor<1x64x8x8xbf16> loc(#loc319)
        xten_nn.output %176 : tensor<1x64x8x8xbf16> loc(#loc321)
      } -> tensor<1x64x8x8xbf16> loc(#loc319)
      xten_nn.output %169 : tensor<1x64x8x8xbf16> loc(#loc319)
    } -> tensor<1x64x8x8xbf16> loc(#loc319)
    %118 = xten_nn.subgraph (%arg1 = %117: tensor<1x64x8x8xbf16>, %arg2 = %48: tensor<256x64x1x1xbf16>, %arg3 = %80: tensor<256xbf16>, %arg4 = %115: tensor<1x256x8x8xbf16>)  attributes {
      IfmOperands = [0 : index, 3 : index],
      LayerName = "/layer1/layer1.1/conv3/Conv",
      OfmShare = 3 : index,
      Operands = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          Name = "/layer1/layer1.1/relu_1/Relu_output_0",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 64, 8, 8]> : vector<4xindex>
        },
        {
          Name = "onnx::Conv_522",
          UnknownDataFormat = true,
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[256, 64, 1, 1]> : vector<4xindex>
        },
        {
          Name = "onnx::Conv_523",
          UnknownDataFormat = true
        },
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          Name = "/layer1/layer1.1/Add_output_0",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 256, 8, 8]> : vector<4xindex>
        }
      ],
      OutputName = "/layer1/layer1.1/Add",
      Reason = "InCoreChain",
      Results = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          Name = "/layer1/layer1.1/Add_output_0",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 256, 8, 8]> : vector<4xindex>
        }
      ],
      TilingRecipe = {
        "conv-spatial-2d" = false,
        "conv-split-stamps" = true,
        "conv-split-stamps-OC-only" = false,
        "conv-split-stamps-OH-only" = false,
        "convtype-set-by-overlay-heuristic" = false,
        "disable-oh-spatial" = false,
        "disable-ow-spatial" = false,
        "dwc-split-stamps" = false,
        "elt-split-stamps" = true,
        "fm-superiters" = false,
        "icw-superiters" = false,
        "ocw-superiters" = true,
        "ow-superiters" = false,
        "pool-split-stamps" = false,
        "reduce-split-stamps" = false
      },
      logical_mode = "2x_4x4_1x4_vertBroadcastLeft_horizBroadcastRight",
      memory_configuration = {
        L1 = {layout = "strictlegacy"},
        L2 = {ifm_buffering = "single", layout = "flexible", limited_wts_space = false, ofm_buffering = "single", weights_buffering = "double"}
      }} {
      %169 = xten_nn.subgraph (%arg5 = %arg1: tensor<1x64x8x8xbf16>, %arg6 = %arg2: tensor<256x64x1x1xbf16>, %arg7 = %arg3: tensor<256xbf16>)  attributes {
        Dilations = array<i64: 1, 1>,
        HWPadding = [[0, 0], [0, 0]],
        LayerName = "/layer1/layer1.1/conv3/Conv",
        Operands = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer1/layer1.1/relu_1/Relu_output_0",
            Port = "data_io.ifm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 64, 8, 8]> : vector<4xindex>
          },
          {
            Name = "onnx::Conv_522",
            Port = "data_io.wts",
            SubPort = "wts_data",
            UnknownDataFormat = true,
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[256, 64, 1, 1]> : vector<4xindex>
          },
          {
            Name = "onnx::Conv_523",
            Port = "data_io.wts",
            SubPort = "bias",
            UnknownDataFormat = true
          }
        ],
        OutputName = "/layer1/layer1.1/conv3/Conv",
        Reason = "MllibKernel",
        Results = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer1/layer1.1/conv3/Conv_output_0",
            Port = "data_io.ofm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 256, 8, 8]> : vector<4xindex>
          }
        ],
        Specializes = "Conv2DBf16",
        Traits = {
          AllowDMAOptimization = true
        },
        With = {
          config.AIE_API_EMULATE_BFLOAT16_MMUL_WITH_BFP16 = 1 : ui8,
          config.act = 0 : ui8,
          config.act_type = "RELU",
          config.aie_arch = "aie2p",
          config.batch_size = 1 : ui8,
          config.compiler = "peano",
          config.conv_type = [0 : ui8, 12 : ui8, 64 : ui8],
          config.dtype_ifm = "bfloat16",
          config.dtype_ofm = "bfloat16",
          config.dtype_wts = "bfloat16",
          config.enable_bfp16_wts = 0 : ui8,
          config.ksize.height = 1 : ui8,
          config.ksize.width = 1 : ui8,
          config.lrelu_alpha = 1.000000e+00 : f32,
          config.stride_h = 1 : ui8,
          config.stride_w = 1 : ui8
        }} {
        %171 = "tosa.const"() <{value = dense<[0, 3, 1, 2]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc248)
        %172 = "tosa.const"() <{value = dense<[0, 2, 3, 1]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc248)
        %173 = tosa.reshape %arg6 {new_shape = array<i64: 256, 1, 1, 64>} : (tensor<256x64x1x1xbf16>) -> tensor<256x1x1x64xbf16> loc(#loc323)
        %174 = tosa.transpose %arg5, %172 : (tensor<1x64x8x8xbf16>, tensor<4xi32>) -> tensor<1x8x8x64xbf16> loc(#loc323)
        %175 = tosa.conv2d %174, %173, %arg7 {
          PartOfLayerName = "/layer1/layer1.1/conv3/Conv",
          PartOfOutputName = "/layer1/layer1.1/conv3/Conv",
          acc_type = f32,
          dilation = array<i64: 1, 1>,
          pad = array<i64: 0, 0, 0, 0>,
          stride = array<i64: 1, 1>} : (tensor<1x8x8x64xbf16>, tensor<256x1x1x64xbf16>, tensor<256xbf16>) -> tensor<1x8x8x256xbf16> loc(#loc323)
        %176 = tosa.transpose %175, %171 : (tensor<1x8x8x256xbf16>, tensor<4xi32>) -> tensor<1x256x8x8xbf16> loc(#loc323)
        xten_nn.output %176 : tensor<1x256x8x8xbf16> loc(#loc323)
      } -> tensor<1x256x8x8xbf16> loc(#loc323)
      %170 = xten_nn.subgraph (%arg5 = %169: tensor<1x256x8x8xbf16>, %arg6 = %arg4: tensor<1x256x8x8xbf16>)  attributes {
        LayerName = "/layer1/layer1.1/relu_2/Relu",
        Operands = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer1/layer1.1/Add_output_0",
            Port = "data_io.ifm1",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 256, 8, 8]> : vector<4xindex>
          },
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer1/layer1.1/Add_output_0",
            Port = "data_io.ifm2",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 256, 8, 8]> : vector<4xindex>
          }
        ],
        OutputName = "/layer1/layer1.1/Add",
        Reason = "MllibKernel",
        Results = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer1/layer1.1/Add_output_0",
            Port = "data_io.ofm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 256, 8, 8]> : vector<4xindex>
          }
        ],
        Specializes = "AddBf16",
        Traits = {
          Binary = true,
          Elementwise = true,
          NonNegativeOut = true
        },
        With = {
          config.act = 1 : ui8,
          config.act_type = "RELU",
          config.aie_arch = "aie2p",
          config.compiler = "peano",
          config.dtype = "bfloat16"
        }} {
        %171 = tosa.add %arg5, %arg6 {LayerName = "/layer1/layer1.1/Add", OutputName = "/layer1/layer1.1/Add"} : (tensor<1x256x8x8xbf16>, tensor<1x256x8x8xbf16>) -> tensor<1x256x8x8xbf16> loc(#loc325)
        %172 = tosa.clamp %171 {
          LayerName = "/layer1/layer1.1/relu_2/Relu",
          OutputName = "/layer1/layer1.1/relu_2/Relu",
          max_fp = 3.40282347E+38 : f32,
          max_int = 2147483647 : i64,
          min_fp = 0.000000e+00 : f32,
          min_int = 0 : i64} : (tensor<1x256x8x8xbf16>) -> tensor<1x256x8x8xbf16> loc(#loc326)
        xten_nn.output %172 : tensor<1x256x8x8xbf16> loc(#loc326)
      } -> tensor<1x256x8x8xbf16> loc(#loc324)
      xten_nn.output %170 : tensor<1x256x8x8xbf16> loc(#loc324)
    } -> tensor<1x256x8x8xbf16> loc(#loc322)
    %119 = xten_nn.subgraph (%arg1 = %118: tensor<1x256x8x8xbf16>, %arg2 = %47: tensor<64x256x1x1xbf16>, %arg3 = %109: tensor<64xbf16>)  attributes {
      IfmOperands = [0 : index],
      LayerName = "/layer1/layer1.2/relu/Relu",
      Operands = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 256, 8, 8]> : vector<4xindex>
        },
        {
          UnknownDataFormat = true,
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[64, 256, 1, 1]> : vector<4xindex>
        },
        {
          UnknownDataFormat = true
        }
      ],
      OutputName = "/layer1/layer1.2/conv1/Conv",
      Reason = "InCoreChain",
      Results = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          Name = "/layer1/layer1.2/conv1/Conv_output_0",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 64, 8, 8]> : vector<4xindex>
        }
      ],
      TilingRecipe = {
        "conv-spatial-2d" = false,
        "conv-split-stamps" = true,
        "conv-split-stamps-OC-only" = false,
        "conv-split-stamps-OH-only" = false,
        "convtype-set-by-overlay-heuristic" = false,
        "disable-oh-spatial" = false,
        "disable-ow-spatial" = false,
        "dwc-split-stamps" = false,
        "elt-split-stamps" = true,
        "fm-superiters" = false,
        "icw-superiters" = false,
        "ocw-superiters" = true,
        "ow-superiters" = false,
        "pool-split-stamps" = false,
        "reduce-split-stamps" = false
      },
      logical_mode = "2x_4x4_1x4_vertBroadcastLeft_horizBroadcastRight",
      memory_configuration = {
        L1 = {layout = "strictlegacy"},
        L2 = {ifm_buffering = "single", layout = "flexible", limited_wts_space = false, ofm_buffering = "single", weights_buffering = "double"}
      }} {
      %169 = xten_nn.subgraph (%arg4 = %arg1: tensor<1x256x8x8xbf16>, %arg5 = %arg2: tensor<64x256x1x1xbf16>, %arg6 = %arg3: tensor<64xbf16>)  attributes {
        Dilations = array<i64: 1, 1>,
        HWPadding = [[0, 0], [0, 0]],
        LayerName = "/layer1/layer1.2/relu/Relu",
        Operands = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Port = "data_io.ifm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 256, 8, 8]> : vector<4xindex>
          },
          {
            Port = "data_io.wts",
            SubPort = "wts_data",
            UnknownDataFormat = true,
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[64, 256, 1, 1]> : vector<4xindex>
          },
          {
            Port = "data_io.wts",
            SubPort = "bias",
            UnknownDataFormat = true
          }
        ],
        OutputName = "/layer1/layer1.2/conv1/Conv",
        Reason = "MllibKernel",
        Results = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer1/layer1.2/conv1/Conv_output_0",
            Port = "data_io.ofm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 64, 8, 8]> : vector<4xindex>
          }
        ],
        Specializes = "Conv2DBf16",
        Traits = {
          AllowDMAOptimization = true,
          NonNegativeOut = true
        },
        With = {
          config.AIE_API_EMULATE_BFLOAT16_MMUL_WITH_BFP16 = 1 : ui8,
          config.act = 1 : ui8,
          config.act_type = "RELU",
          config.aie_arch = "aie2p",
          config.batch_size = 1 : ui8,
          config.compiler = "peano",
          config.conv_type = [0 : ui8, 12 : ui8, 64 : ui8],
          config.dtype_ifm = "bfloat16",
          config.dtype_ofm = "bfloat16",
          config.dtype_wts = "bfloat16",
          config.enable_bfp16_wts = 0 : ui8,
          config.ksize.height = 1 : ui8,
          config.ksize.width = 1 : ui8,
          config.lrelu_alpha = 0.000000e+00 : f32,
          config.stride_h = 1 : ui8,
          config.stride_w = 1 : ui8
        }} {
        %170 = "tosa.const"() <{value = dense<[0, 3, 1, 2]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc248)
        %171 = "tosa.const"() <{value = dense<[0, 2, 3, 1]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc248)
        %172 = tosa.reshape %arg5 {new_shape = array<i64: 64, 1, 1, 256>} : (tensor<64x256x1x1xbf16>) -> tensor<64x1x1x256xbf16> loc(#loc327)
        %173 = tosa.transpose %arg4, %171 : (tensor<1x256x8x8xbf16>, tensor<4xi32>) -> tensor<1x8x8x256xbf16> loc(#loc327)
        %174 = tosa.conv2d %173, %172, %arg6 {
          PartOfLayerName = "/layer1/layer1.2/conv1/Conv",
          PartOfOutputName = "/layer1/layer1.2/conv1/Conv",
          acc_type = f32,
          dilation = array<i64: 1, 1>,
          pad = array<i64: 0, 0, 0, 0>,
          stride = array<i64: 1, 1>} : (tensor<1x8x8x256xbf16>, tensor<64x1x1x256xbf16>, tensor<64xbf16>) -> tensor<1x8x8x64xbf16> loc(#loc328)
        %175 = tosa.clamp %174 {
          LayerName = "/layer1/layer1.2/relu/Relu",
          OutputName = "/layer1/layer1.2/relu/Relu",
          max_fp = 3.40282347E+38 : f32,
          max_int = 2147483647 : i64,
          min_fp = 0.000000e+00 : f32,
          min_int = 0 : i64} : (tensor<1x8x8x64xbf16>) -> tensor<1x8x8x64xbf16> loc(#loc329)
        %176 = tosa.transpose %175, %170 : (tensor<1x8x8x64xbf16>, tensor<4xi32>) -> tensor<1x64x8x8xbf16> loc(#loc327)
        xten_nn.output %176 : tensor<1x64x8x8xbf16> loc(#loc329)
      } -> tensor<1x64x8x8xbf16> loc(#loc327)
      xten_nn.output %169 : tensor<1x64x8x8xbf16> loc(#loc327)
    } -> tensor<1x64x8x8xbf16> loc(#loc327)
    %120 = xten_nn.subgraph (%arg1 = %119: tensor<1x64x8x8xbf16>, %arg2 = %46: tensor<64x64x3x3xbf16>, %arg3 = %83: tensor<64xbf16>)  attributes {
      IfmOperands = [0 : index],
      LayerName = "/layer1/layer1.2/relu_1/Relu",
      Operands = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 64, 8, 8]> : vector<4xindex>
        },
        {
          UnknownDataFormat = true,
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[64, 64, 3, 3]> : vector<4xindex>
        },
        {
          UnknownDataFormat = true
        }
      ],
      OutputName = "/layer1/layer1.2/conv2/Conv",
      Reason = "InCoreChain",
      Results = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          Name = "/layer1/layer1.2/conv2/Conv_output_0",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 64, 8, 8]> : vector<4xindex>
        }
      ],
      TilingRecipe = {
        "conv-spatial-2d" = false,
        "conv-split-stamps" = true,
        "conv-split-stamps-OC-only" = false,
        "conv-split-stamps-OH-only" = false,
        "convtype-set-by-overlay-heuristic" = false,
        "disable-oh-spatial" = false,
        "disable-ow-spatial" = false,
        "dwc-split-stamps" = false,
        "elt-split-stamps" = true,
        "fm-superiters" = false,
        "icw-superiters" = false,
        "ocw-superiters" = true,
        "ow-superiters" = false,
        "pool-split-stamps" = false,
        "reduce-split-stamps" = false
      },
      logical_mode = "2x_4x4_1x4_vertBroadcastLeft_horizBroadcastRight",
      memory_configuration = {
        L1 = {layout = "strictlegacy"},
        L2 = {ifm_buffering = "single", layout = "flexible", limited_wts_space = false, ofm_buffering = "single", weights_buffering = "double"}
      }} {
      %169 = xten_nn.subgraph (%arg4 = %arg1: tensor<1x64x8x8xbf16>, %arg5 = %arg2: tensor<64x64x3x3xbf16>, %arg6 = %arg3: tensor<64xbf16>)  attributes {
        Dilations = array<i64: 1, 1>,
        HWPadding = [[1, 1], [1, 1]],
        LayerName = "/layer1/layer1.2/relu_1/Relu",
        Operands = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Port = "data_io.ifm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 64, 8, 8]> : vector<4xindex>
          },
          {
            Port = "data_io.wts",
            SubPort = "wts_data",
            UnknownDataFormat = true,
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[64, 64, 3, 3]> : vector<4xindex>
          },
          {
            Port = "data_io.wts",
            SubPort = "bias",
            UnknownDataFormat = true
          }
        ],
        OutputName = "/layer1/layer1.2/conv2/Conv",
        Reason = "MllibKernel",
        Results = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer1/layer1.2/conv2/Conv_output_0",
            Port = "data_io.ofm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 64, 8, 8]> : vector<4xindex>
          }
        ],
        Specializes = "Conv2DBf16",
        Traits = {
          AllowDMAOptimization = true,
          NonNegativeOut = true
        },
        With = {
          config.AIE_API_EMULATE_BFLOAT16_MMUL_WITH_BFP16 = 1 : ui8,
          config.act = 1 : ui8,
          config.act_type = "RELU",
          config.aie_arch = "aie2p",
          config.batch_size = 1 : ui8,
          config.compiler = "peano",
          config.conv_type = [0 : ui8, 12 : ui8, 64 : ui8],
          config.dtype_ifm = "bfloat16",
          config.dtype_ofm = "bfloat16",
          config.dtype_wts = "bfloat16",
          config.enable_bfp16_wts = 0 : ui8,
          config.ksize.height = 3 : ui8,
          config.ksize.width = 3 : ui8,
          config.lrelu_alpha = 0.000000e+00 : f32,
          config.stride_h = 1 : ui8,
          config.stride_w = 1 : ui8
        }} {
        %170 = "tosa.const"() <{value = dense<[0, 3, 1, 2]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc248)
        %171 = "tosa.const"() <{value = dense<[0, 2, 3, 1]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc248)
        %172 = tosa.transpose %arg5, %171 : (tensor<64x64x3x3xbf16>, tensor<4xi32>) -> tensor<64x3x3x64xbf16> loc(#loc330)
        %173 = tosa.transpose %arg4, %171 : (tensor<1x64x8x8xbf16>, tensor<4xi32>) -> tensor<1x8x8x64xbf16> loc(#loc330)
        %174 = tosa.conv2d %173, %172, %arg6 {
          PartOfLayerName = "/layer1/layer1.2/conv2/Conv",
          PartOfOutputName = "/layer1/layer1.2/conv2/Conv",
          acc_type = f32,
          dilation = array<i64: 1, 1>,
          pad = array<i64: 1, 1, 1, 1>,
          stride = array<i64: 1, 1>} : (tensor<1x8x8x64xbf16>, tensor<64x3x3x64xbf16>, tensor<64xbf16>) -> tensor<1x8x8x64xbf16> loc(#loc331)
        %175 = tosa.clamp %174 {
          LayerName = "/layer1/layer1.2/relu_1/Relu",
          OutputName = "/layer1/layer1.2/relu_1/Relu",
          max_fp = 3.40282347E+38 : f32,
          max_int = 2147483647 : i64,
          min_fp = 0.000000e+00 : f32,
          min_int = 0 : i64} : (tensor<1x8x8x64xbf16>) -> tensor<1x8x8x64xbf16> loc(#loc332)
        %176 = tosa.transpose %175, %170 : (tensor<1x8x8x64xbf16>, tensor<4xi32>) -> tensor<1x64x8x8xbf16> loc(#loc330)
        xten_nn.output %176 : tensor<1x64x8x8xbf16> loc(#loc332)
      } -> tensor<1x64x8x8xbf16> loc(#loc330)
      xten_nn.output %169 : tensor<1x64x8x8xbf16> loc(#loc330)
    } -> tensor<1x64x8x8xbf16> loc(#loc330)
    %121 = xten_nn.subgraph (%arg1 = %120: tensor<1x64x8x8xbf16>, %arg2 = %45: tensor<256x64x1x1xbf16>, %arg3 = %81: tensor<256xbf16>, %arg4 = %118: tensor<1x256x8x8xbf16>)  attributes {
      IfmOperands = [0 : index, 3 : index],
      LayerName = "/layer1/layer1.2/conv3/Conv",
      OfmShare = 3 : index,
      Operands = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          Name = "/layer1/layer1.2/relu_1/Relu_output_0",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 64, 8, 8]> : vector<4xindex>
        },
        {
          Name = "onnx::Conv_531",
          UnknownDataFormat = true,
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[256, 64, 1, 1]> : vector<4xindex>
        },
        {
          Name = "onnx::Conv_532",
          UnknownDataFormat = true
        },
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          Name = "/layer1/layer1.2/Add_output_0",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 256, 8, 8]> : vector<4xindex>
        }
      ],
      OutputName = "/layer1/layer1.2/Add",
      Reason = "InCoreChain",
      Results = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          Name = "/layer1/layer1.2/Add_output_0",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 256, 8, 8]> : vector<4xindex>
        }
      ],
      TilingRecipe = {
        "conv-spatial-2d" = false,
        "conv-split-stamps" = true,
        "conv-split-stamps-OC-only" = false,
        "conv-split-stamps-OH-only" = false,
        "convtype-set-by-overlay-heuristic" = false,
        "disable-oh-spatial" = false,
        "disable-ow-spatial" = false,
        "dwc-split-stamps" = false,
        "elt-split-stamps" = true,
        "fm-superiters" = false,
        "icw-superiters" = false,
        "ocw-superiters" = true,
        "ow-superiters" = false,
        "pool-split-stamps" = false,
        "reduce-split-stamps" = false
      },
      logical_mode = "2x_4x4_1x4_vertBroadcastLeft_horizBroadcastRight",
      memory_configuration = {
        L1 = {layout = "strictlegacy"},
        L2 = {ifm_buffering = "single", layout = "flexible", limited_wts_space = false, ofm_buffering = "single", weights_buffering = "double"}
      }} {
      %169 = xten_nn.subgraph (%arg5 = %arg1: tensor<1x64x8x8xbf16>, %arg6 = %arg2: tensor<256x64x1x1xbf16>, %arg7 = %arg3: tensor<256xbf16>)  attributes {
        Dilations = array<i64: 1, 1>,
        HWPadding = [[0, 0], [0, 0]],
        LayerName = "/layer1/layer1.2/conv3/Conv",
        Operands = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer1/layer1.2/relu_1/Relu_output_0",
            Port = "data_io.ifm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 64, 8, 8]> : vector<4xindex>
          },
          {
            Name = "onnx::Conv_531",
            Port = "data_io.wts",
            SubPort = "wts_data",
            UnknownDataFormat = true,
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[256, 64, 1, 1]> : vector<4xindex>
          },
          {
            Name = "onnx::Conv_532",
            Port = "data_io.wts",
            SubPort = "bias",
            UnknownDataFormat = true
          }
        ],
        OutputName = "/layer1/layer1.2/conv3/Conv",
        Reason = "MllibKernel",
        Results = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer1/layer1.2/conv3/Conv_output_0",
            Port = "data_io.ofm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 256, 8, 8]> : vector<4xindex>
          }
        ],
        Specializes = "Conv2DBf16",
        Traits = {
          AllowDMAOptimization = true
        },
        With = {
          config.AIE_API_EMULATE_BFLOAT16_MMUL_WITH_BFP16 = 1 : ui8,
          config.act = 0 : ui8,
          config.act_type = "RELU",
          config.aie_arch = "aie2p",
          config.batch_size = 1 : ui8,
          config.compiler = "peano",
          config.conv_type = [0 : ui8, 12 : ui8, 64 : ui8],
          config.dtype_ifm = "bfloat16",
          config.dtype_ofm = "bfloat16",
          config.dtype_wts = "bfloat16",
          config.enable_bfp16_wts = 0 : ui8,
          config.ksize.height = 1 : ui8,
          config.ksize.width = 1 : ui8,
          config.lrelu_alpha = 1.000000e+00 : f32,
          config.stride_h = 1 : ui8,
          config.stride_w = 1 : ui8
        }} {
        %171 = "tosa.const"() <{value = dense<[0, 3, 1, 2]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc248)
        %172 = "tosa.const"() <{value = dense<[0, 2, 3, 1]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc248)
        %173 = tosa.reshape %arg6 {new_shape = array<i64: 256, 1, 1, 64>} : (tensor<256x64x1x1xbf16>) -> tensor<256x1x1x64xbf16> loc(#loc334)
        %174 = tosa.transpose %arg5, %172 : (tensor<1x64x8x8xbf16>, tensor<4xi32>) -> tensor<1x8x8x64xbf16> loc(#loc334)
        %175 = tosa.conv2d %174, %173, %arg7 {
          PartOfLayerName = "/layer1/layer1.2/conv3/Conv",
          PartOfOutputName = "/layer1/layer1.2/conv3/Conv",
          acc_type = f32,
          dilation = array<i64: 1, 1>,
          pad = array<i64: 0, 0, 0, 0>,
          stride = array<i64: 1, 1>} : (tensor<1x8x8x64xbf16>, tensor<256x1x1x64xbf16>, tensor<256xbf16>) -> tensor<1x8x8x256xbf16> loc(#loc334)
        %176 = tosa.transpose %175, %171 : (tensor<1x8x8x256xbf16>, tensor<4xi32>) -> tensor<1x256x8x8xbf16> loc(#loc334)
        xten_nn.output %176 : tensor<1x256x8x8xbf16> loc(#loc334)
      } -> tensor<1x256x8x8xbf16> loc(#loc334)
      %170 = xten_nn.subgraph (%arg5 = %169: tensor<1x256x8x8xbf16>, %arg6 = %arg4: tensor<1x256x8x8xbf16>)  attributes {
        LayerName = "/layer1/layer1.2/relu_2/Relu",
        Operands = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer1/layer1.2/Add_output_0",
            Port = "data_io.ifm1",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 256, 8, 8]> : vector<4xindex>
          },
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer1/layer1.2/Add_output_0",
            Port = "data_io.ifm2",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 256, 8, 8]> : vector<4xindex>
          }
        ],
        OutputName = "/layer1/layer1.2/Add",
        Reason = "MllibKernel",
        Results = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer1/layer1.2/Add_output_0",
            Port = "data_io.ofm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 256, 8, 8]> : vector<4xindex>
          }
        ],
        Specializes = "AddBf16",
        Traits = {
          Binary = true,
          Elementwise = true,
          NonNegativeOut = true
        },
        With = {
          config.act = 1 : ui8,
          config.act_type = "RELU",
          config.aie_arch = "aie2p",
          config.compiler = "peano",
          config.dtype = "bfloat16"
        }} {
        %171 = tosa.add %arg5, %arg6 {LayerName = "/layer1/layer1.2/Add", OutputName = "/layer1/layer1.2/Add"} : (tensor<1x256x8x8xbf16>, tensor<1x256x8x8xbf16>) -> tensor<1x256x8x8xbf16> loc(#loc336)
        %172 = tosa.clamp %171 {
          LayerName = "/layer1/layer1.2/relu_2/Relu",
          OutputName = "/layer1/layer1.2/relu_2/Relu",
          max_fp = 3.40282347E+38 : f32,
          max_int = 2147483647 : i64,
          min_fp = 0.000000e+00 : f32,
          min_int = 0 : i64} : (tensor<1x256x8x8xbf16>) -> tensor<1x256x8x8xbf16> loc(#loc337)
        xten_nn.output %172 : tensor<1x256x8x8xbf16> loc(#loc337)
      } -> tensor<1x256x8x8xbf16> loc(#loc335)
      xten_nn.output %170 : tensor<1x256x8x8xbf16> loc(#loc335)
    } -> tensor<1x256x8x8xbf16> loc(#loc333)
    %122 = xten_nn.subgraph (%arg1 = %121: tensor<1x256x8x8xbf16>, %arg2 = %44: tensor<128x256x1x1xbf16>, %arg3 = %88: tensor<128xbf16>)  attributes {
      IfmOperands = [0 : index],
      LayerName = "/layer2/layer2.0/relu/Relu",
      Operands = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 256, 8, 8]> : vector<4xindex>
        },
        {
          UnknownDataFormat = true,
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[128, 256, 1, 1]> : vector<4xindex>
        },
        {
          UnknownDataFormat = true
        }
      ],
      OutputName = "/layer2/layer2.0/conv1/Conv",
      Reason = "InCoreChain",
      Results = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          Name = "/layer2/layer2.0/conv1/Conv_output_0",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 128, 8, 8]> : vector<4xindex>
        }
      ],
      TilingRecipe = {
        "conv-spatial-2d" = false,
        "conv-split-stamps" = true,
        "conv-split-stamps-OC-only" = false,
        "conv-split-stamps-OH-only" = false,
        "convtype-set-by-overlay-heuristic" = false,
        "disable-oh-spatial" = false,
        "disable-ow-spatial" = false,
        "dwc-split-stamps" = false,
        "elt-split-stamps" = true,
        "fm-superiters" = false,
        "icw-superiters" = false,
        "ocw-superiters" = true,
        "ow-superiters" = false,
        "pool-split-stamps" = false,
        "reduce-split-stamps" = false
      },
      logical_mode = "2x_4x4_1x4_vertBroadcastLeft_horizBroadcastRight",
      memory_configuration = {
        L1 = {layout = "strictlegacy"},
        L2 = {ifm_buffering = "single", layout = "flexible", limited_wts_space = false, ofm_buffering = "single", weights_buffering = "double"}
      }} {
      %169 = xten_nn.subgraph (%arg4 = %arg1: tensor<1x256x8x8xbf16>, %arg5 = %arg2: tensor<128x256x1x1xbf16>, %arg6 = %arg3: tensor<128xbf16>)  attributes {
        Dilations = array<i64: 1, 1>,
        HWPadding = [[0, 0], [0, 0]],
        LayerName = "/layer2/layer2.0/relu/Relu",
        Operands = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Port = "data_io.ifm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 256, 8, 8]> : vector<4xindex>
          },
          {
            Port = "data_io.wts",
            SubPort = "wts_data",
            UnknownDataFormat = true,
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[128, 256, 1, 1]> : vector<4xindex>
          },
          {
            Port = "data_io.wts",
            SubPort = "bias",
            UnknownDataFormat = true
          }
        ],
        OutputName = "/layer2/layer2.0/conv1/Conv",
        Reason = "MllibKernel",
        Results = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer2/layer2.0/conv1/Conv_output_0",
            Port = "data_io.ofm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 128, 8, 8]> : vector<4xindex>
          }
        ],
        Specializes = "Conv2DBf16",
        Traits = {
          AllowDMAOptimization = true,
          NonNegativeOut = true
        },
        With = {
          config.AIE_API_EMULATE_BFLOAT16_MMUL_WITH_BFP16 = 1 : ui8,
          config.act = 1 : ui8,
          config.act_type = "RELU",
          config.aie_arch = "aie2p",
          config.batch_size = 1 : ui8,
          config.compiler = "peano",
          config.conv_type = [0 : ui8, 12 : ui8, 64 : ui8],
          config.dtype_ifm = "bfloat16",
          config.dtype_ofm = "bfloat16",
          config.dtype_wts = "bfloat16",
          config.enable_bfp16_wts = 0 : ui8,
          config.ksize.height = 1 : ui8,
          config.ksize.width = 1 : ui8,
          config.lrelu_alpha = 0.000000e+00 : f32,
          config.stride_h = 1 : ui8,
          config.stride_w = 1 : ui8
        }} {
        %170 = "tosa.const"() <{value = dense<[0, 3, 1, 2]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc248)
        %171 = "tosa.const"() <{value = dense<[0, 2, 3, 1]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc248)
        %172 = tosa.reshape %arg5 {new_shape = array<i64: 128, 1, 1, 256>} : (tensor<128x256x1x1xbf16>) -> tensor<128x1x1x256xbf16> loc(#loc338)
        %173 = tosa.transpose %arg4, %171 : (tensor<1x256x8x8xbf16>, tensor<4xi32>) -> tensor<1x8x8x256xbf16> loc(#loc338)
        %174 = tosa.conv2d %173, %172, %arg6 {
          PartOfLayerName = "/layer2/layer2.0/conv1/Conv",
          PartOfOutputName = "/layer2/layer2.0/conv1/Conv",
          acc_type = f32,
          dilation = array<i64: 1, 1>,
          pad = array<i64: 0, 0, 0, 0>,
          stride = array<i64: 1, 1>} : (tensor<1x8x8x256xbf16>, tensor<128x1x1x256xbf16>, tensor<128xbf16>) -> tensor<1x8x8x128xbf16> loc(#loc339)
        %175 = tosa.clamp %174 {
          LayerName = "/layer2/layer2.0/relu/Relu",
          OutputName = "/layer2/layer2.0/relu/Relu",
          max_fp = 3.40282347E+38 : f32,
          max_int = 2147483647 : i64,
          min_fp = 0.000000e+00 : f32,
          min_int = 0 : i64} : (tensor<1x8x8x128xbf16>) -> tensor<1x8x8x128xbf16> loc(#loc340)
        %176 = tosa.transpose %175, %170 : (tensor<1x8x8x128xbf16>, tensor<4xi32>) -> tensor<1x128x8x8xbf16> loc(#loc338)
        xten_nn.output %176 : tensor<1x128x8x8xbf16> loc(#loc340)
      } -> tensor<1x128x8x8xbf16> loc(#loc338)
      xten_nn.output %169 : tensor<1x128x8x8xbf16> loc(#loc338)
    } -> tensor<1x128x8x8xbf16> loc(#loc338)
    %123 = xten_nn.subgraph (%arg1 = %122: tensor<1x128x8x8xbf16>, %arg2 = %43: tensor<128x128x3x3xbf16>, %arg3 = %87: tensor<128xbf16>)  attributes {
      IfmOperands = [0 : index],
      LayerName = "/layer2/layer2.0/relu_1/Relu",
      Operands = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 128, 8, 8]> : vector<4xindex>
        },
        {
          UnknownDataFormat = true,
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[128, 128, 3, 3]> : vector<4xindex>
        },
        {
          UnknownDataFormat = true
        }
      ],
      OutputName = "/layer2/layer2.0/conv2/Conv",
      Reason = "InCoreChain",
      Results = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          Name = "/layer2/layer2.0/conv2/Conv_output_0",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 128, 4, 4]> : vector<4xindex>
        }
      ],
      TilingRecipe = {
        "conv-spatial-2d" = false,
        "conv-split-stamps" = true,
        "conv-split-stamps-OC-only" = false,
        "conv-split-stamps-OH-only" = false,
        "convtype-set-by-overlay-heuristic" = false,
        "disable-oh-spatial" = false,
        "disable-ow-spatial" = false,
        "dwc-split-stamps" = false,
        "elt-split-stamps" = true,
        "fm-superiters" = false,
        "icw-superiters" = false,
        "ocw-superiters" = true,
        "ow-superiters" = false,
        "pool-split-stamps" = false,
        "reduce-split-stamps" = false
      },
      logical_mode = "2x_4x4_1x4_vertBroadcastLeft_horizBroadcastRight",
      memory_configuration = {
        L1 = {layout = "strictlegacy"},
        L2 = {ifm_buffering = "single", layout = "flexible", limited_wts_space = false, ofm_buffering = "single", weights_buffering = "double"}
      }} {
      %169 = xten_nn.subgraph (%arg4 = %arg1: tensor<1x128x8x8xbf16>, %arg5 = %arg2: tensor<128x128x3x3xbf16>, %arg6 = %arg3: tensor<128xbf16>)  attributes {
        Dilations = array<i64: 1, 1>,
        HWPadding = [[1, 0], [1, 0]],
        LayerName = "/layer2/layer2.0/relu_1/Relu",
        Operands = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Port = "data_io.ifm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 128, 8, 8]> : vector<4xindex>
          },
          {
            Port = "data_io.wts",
            SubPort = "wts_data",
            UnknownDataFormat = true,
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[128, 128, 3, 3]> : vector<4xindex>
          },
          {
            Port = "data_io.wts",
            SubPort = "bias",
            UnknownDataFormat = true
          }
        ],
        OutputName = "/layer2/layer2.0/conv2/Conv",
        Reason = "MllibKernel",
        Results = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer2/layer2.0/conv2/Conv_output_0",
            Port = "data_io.ofm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 128, 4, 4]> : vector<4xindex>
          }
        ],
        Specializes = "Conv2DBf16",
        Traits = {
          AllowDMAOptimization = true,
          NonNegativeOut = true
        },
        With = {
          config.AIE_API_EMULATE_BFLOAT16_MMUL_WITH_BFP16 = 1 : ui8,
          config.act = 1 : ui8,
          config.act_type = "RELU",
          config.aie_arch = "aie2p",
          config.batch_size = 1 : ui8,
          config.compiler = "peano",
          config.conv_type = [0 : ui8, 12 : ui8, 64 : ui8],
          config.dtype_ifm = "bfloat16",
          config.dtype_ofm = "bfloat16",
          config.dtype_wts = "bfloat16",
          config.enable_bfp16_wts = 0 : ui8,
          config.ksize.height = 3 : ui8,
          config.ksize.width = 3 : ui8,
          config.lrelu_alpha = 0.000000e+00 : f32,
          config.stride_h = 2 : ui8,
          config.stride_w = 2 : ui8
        }} {
        %170 = "tosa.const"() <{value = dense<[0, 3, 1, 2]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc248)
        %171 = "tosa.const"() <{value = dense<[0, 2, 3, 1]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc248)
        %172 = tosa.transpose %arg5, %171 : (tensor<128x128x3x3xbf16>, tensor<4xi32>) -> tensor<128x3x3x128xbf16> loc(#loc341)
        %173 = tosa.transpose %arg4, %171 : (tensor<1x128x8x8xbf16>, tensor<4xi32>) -> tensor<1x8x8x128xbf16> loc(#loc341)
        %174 = tosa.conv2d %173, %172, %arg6 {
          PartOfLayerName = "/layer2/layer2.0/conv2/Conv",
          PartOfOutputName = "/layer2/layer2.0/conv2/Conv",
          acc_type = f32,
          dilation = array<i64: 1, 1>,
          pad = array<i64: 1, 0, 1, 0>,
          stride = array<i64: 2, 2>} : (tensor<1x8x8x128xbf16>, tensor<128x3x3x128xbf16>, tensor<128xbf16>) -> tensor<1x4x4x128xbf16> loc(#loc342)
        %175 = tosa.clamp %174 {
          LayerName = "/layer2/layer2.0/relu_1/Relu",
          OutputName = "/layer2/layer2.0/relu_1/Relu",
          max_fp = 3.40282347E+38 : f32,
          max_int = 2147483647 : i64,
          min_fp = 0.000000e+00 : f32,
          min_int = 0 : i64} : (tensor<1x4x4x128xbf16>) -> tensor<1x4x4x128xbf16> loc(#loc343)
        %176 = tosa.transpose %175, %170 : (tensor<1x4x4x128xbf16>, tensor<4xi32>) -> tensor<1x128x4x4xbf16> loc(#loc341)
        xten_nn.output %176 : tensor<1x128x4x4xbf16> loc(#loc343)
      } -> tensor<1x128x4x4xbf16> loc(#loc341)
      xten_nn.output %169 : tensor<1x128x4x4xbf16> loc(#loc341)
    } -> tensor<1x128x4x4xbf16> loc(#loc341)
    %124 = xten_nn.subgraph (%arg1 = %121: tensor<1x256x8x8xbf16>, %arg2 = %41: tensor<512x256x1x1xbf16>, %arg3 = %75: tensor<512xbf16>)  attributes {
      IfmOperands = [0 : index],
      LayerName = "/layer2/layer2.0/downsample/downsample.0/Conv",
      Operands = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          Name = "/layer1/layer1.2/relu_2/Relu_output_0",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 256, 8, 8]> : vector<4xindex>
        },
        {
          Name = "onnx::Conv_543",
          UnknownDataFormat = true,
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[512, 256, 1, 1]> : vector<4xindex>
        },
        {
          Name = "onnx::Conv_544",
          UnknownDataFormat = true
        }
      ],
      OutputName = "/layer2/layer2.0/downsample/downsample.0/Conv",
      Reason = "InCoreChain",
      Results = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          Name = "/layer2/layer2.0/downsample/downsample.0/Conv_output_0",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 512, 4, 4]> : vector<4xindex>
        }
      ],
      TilingRecipe = {
        "conv-spatial-2d" = false,
        "conv-split-stamps" = true,
        "conv-split-stamps-OC-only" = false,
        "conv-split-stamps-OH-only" = false,
        "convtype-set-by-overlay-heuristic" = false,
        "disable-oh-spatial" = false,
        "disable-ow-spatial" = false,
        "dwc-split-stamps" = false,
        "elt-split-stamps" = true,
        "fm-superiters" = false,
        "icw-superiters" = false,
        "ocw-superiters" = true,
        "ow-superiters" = false,
        "pool-split-stamps" = false,
        "reduce-split-stamps" = false
      },
      logical_mode = "2x_4x4_1x4_vertBroadcastLeft_horizBroadcastRight",
      memory_configuration = {
        L1 = {layout = "strictlegacy"},
        L2 = {ifm_buffering = "single", layout = "flexible", limited_wts_space = false, ofm_buffering = "single", weights_buffering = "double"}
      }} {
      %169 = xten_nn.subgraph (%arg4 = %arg1: tensor<1x256x8x8xbf16>, %arg5 = %arg2: tensor<512x256x1x1xbf16>, %arg6 = %arg3: tensor<512xbf16>)  attributes {
        Dilations = array<i64: 1, 1>,
        HWPadding = [[0, 0], [0, 0]],
        LayerName = "/layer2/layer2.0/downsample/downsample.0/Conv",
        Operands = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer1/layer1.2/relu_2/Relu_output_0",
            Port = "data_io.ifm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 256, 8, 8]> : vector<4xindex>
          },
          {
            Name = "onnx::Conv_543",
            Port = "data_io.wts",
            SubPort = "wts_data",
            UnknownDataFormat = true,
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[512, 256, 1, 1]> : vector<4xindex>
          },
          {
            Name = "onnx::Conv_544",
            Port = "data_io.wts",
            SubPort = "bias",
            UnknownDataFormat = true
          }
        ],
        OutputName = "/layer2/layer2.0/downsample/downsample.0/Conv",
        Reason = "MllibKernel",
        Results = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer2/layer2.0/downsample/downsample.0/Conv_output_0",
            Port = "data_io.ofm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 512, 4, 4]> : vector<4xindex>
          }
        ],
        Specializes = "Conv2DBf16",
        Traits = {
          AllowDMAOptimization = true
        },
        With = {
          config.AIE_API_EMULATE_BFLOAT16_MMUL_WITH_BFP16 = 1 : ui8,
          config.act = 0 : ui8,
          config.act_type = "RELU",
          config.aie_arch = "aie2p",
          config.batch_size = 1 : ui8,
          config.compiler = "peano",
          config.conv_type = [0 : ui8, 12 : ui8, 64 : ui8],
          config.dtype_ifm = "bfloat16",
          config.dtype_ofm = "bfloat16",
          config.dtype_wts = "bfloat16",
          config.enable_bfp16_wts = 0 : ui8,
          config.ksize.height = 1 : ui8,
          config.ksize.width = 1 : ui8,
          config.lrelu_alpha = 1.000000e+00 : f32,
          config.stride_h = 2 : ui8,
          config.stride_w = 2 : ui8
        }} {
        %170 = "tosa.const"() <{value = dense<[0, 2, 3, 1]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc248)
        %171 = "tosa.const"() <{value = dense<[0, 3, 1, 2]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc248)
        %172 = tosa.reshape %arg5 {new_shape = array<i64: 512, 1, 1, 256>} : (tensor<512x256x1x1xbf16>) -> tensor<512x1x1x256xbf16> loc(#loc344)
        %173 = tosa.transpose %arg4, %170 : (tensor<1x256x8x8xbf16>, tensor<4xi32>) -> tensor<1x8x8x256xbf16> loc(#loc344)
        %174 = tosa.slice %173 {
          PartOfLayerName = "/layer2/layer2.0/downsample/downsample.0/Conv",
          size = array<i64: 1, 7, 7, 256>,
          start = array<i64: 0, 0, 0, 0>} : (tensor<1x8x8x256xbf16>) -> tensor<1x7x7x256xbf16> loc(#loc344)
        %175 = tosa.conv2d %174, %172, %arg6 {
          PartOfLayerName = "/layer2/layer2.0/downsample/downsample.0/Conv",
          PartOfOutputName = "/layer2/layer2.0/downsample/downsample.0/Conv",
          acc_type = f32,
          dilation = array<i64: 1, 1>,
          pad = array<i64: 0, 0, 0, 0>,
          stride = array<i64: 2, 2>} : (tensor<1x7x7x256xbf16>, tensor<512x1x1x256xbf16>, tensor<512xbf16>) -> tensor<1x4x4x512xbf16> loc(#loc344)
        %176 = tosa.transpose %175, %171 : (tensor<1x4x4x512xbf16>, tensor<4xi32>) -> tensor<1x512x4x4xbf16> loc(#loc344)
        xten_nn.output %176 : tensor<1x512x4x4xbf16> loc(#loc344)
      } -> tensor<1x512x4x4xbf16> loc(#loc344)
      xten_nn.output %169 : tensor<1x512x4x4xbf16> loc(#loc344)
    } -> tensor<1x512x4x4xbf16> loc(#loc344)
    %125 = xten_nn.subgraph (%arg1 = %123: tensor<1x128x4x4xbf16>, %arg2 = %42: tensor<512x128x1x1xbf16>, %arg3 = %73: tensor<512xbf16>, %arg4 = %124: tensor<1x512x4x4xbf16>)  attributes {
      IfmOperands = [0 : index, 3 : index],
      LayerName = "/layer2/layer2.0/conv3/Conv",
      OfmShare = 3 : index,
      Operands = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          Name = "/layer2/layer2.0/relu_1/Relu_output_0",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 128, 4, 4]> : vector<4xindex>
        },
        {
          Name = "onnx::Conv_540",
          UnknownDataFormat = true,
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[512, 128, 1, 1]> : vector<4xindex>
        },
        {
          Name = "onnx::Conv_541",
          UnknownDataFormat = true
        },
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          Name = "/layer2/layer2.0/Add_output_0",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 512, 4, 4]> : vector<4xindex>
        }
      ],
      OutputName = "/layer2/layer2.0/Add",
      Reason = "InCoreChain",
      Results = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          Name = "/layer2/layer2.0/Add_output_0",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 512, 4, 4]> : vector<4xindex>
        }
      ],
      TilingRecipe = {
        "conv-spatial-2d" = false,
        "conv-split-stamps" = true,
        "conv-split-stamps-OC-only" = false,
        "conv-split-stamps-OH-only" = false,
        "convtype-set-by-overlay-heuristic" = false,
        "disable-oh-spatial" = false,
        "disable-ow-spatial" = false,
        "dwc-split-stamps" = false,
        "elt-split-stamps" = true,
        "fm-superiters" = false,
        "icw-superiters" = false,
        "ocw-superiters" = true,
        "ow-superiters" = false,
        "pool-split-stamps" = false,
        "reduce-split-stamps" = false
      },
      logical_mode = "2x_4x4_1x4_vertBroadcastLeft_horizBroadcastRight",
      memory_configuration = {
        L1 = {layout = "strictlegacy"},
        L2 = {ifm_buffering = "single", layout = "flexible", limited_wts_space = false, ofm_buffering = "single", weights_buffering = "double"}
      }} {
      %169 = xten_nn.subgraph (%arg5 = %arg1: tensor<1x128x4x4xbf16>, %arg6 = %arg2: tensor<512x128x1x1xbf16>, %arg7 = %arg3: tensor<512xbf16>)  attributes {
        Dilations = array<i64: 1, 1>,
        HWPadding = [[0, 0], [0, 0]],
        LayerName = "/layer2/layer2.0/conv3/Conv",
        Operands = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer2/layer2.0/relu_1/Relu_output_0",
            Port = "data_io.ifm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 128, 4, 4]> : vector<4xindex>
          },
          {
            Name = "onnx::Conv_540",
            Port = "data_io.wts",
            SubPort = "wts_data",
            UnknownDataFormat = true,
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[512, 128, 1, 1]> : vector<4xindex>
          },
          {
            Name = "onnx::Conv_541",
            Port = "data_io.wts",
            SubPort = "bias",
            UnknownDataFormat = true
          }
        ],
        OutputName = "/layer2/layer2.0/conv3/Conv",
        Reason = "MllibKernel",
        Results = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer2/layer2.0/conv3/Conv_output_0",
            Port = "data_io.ofm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 512, 4, 4]> : vector<4xindex>
          }
        ],
        Specializes = "Conv2DBf16",
        Traits = {
          AllowDMAOptimization = true
        },
        With = {
          config.AIE_API_EMULATE_BFLOAT16_MMUL_WITH_BFP16 = 1 : ui8,
          config.act = 0 : ui8,
          config.act_type = "RELU",
          config.aie_arch = "aie2p",
          config.batch_size = 1 : ui8,
          config.compiler = "peano",
          config.conv_type = [0 : ui8, 12 : ui8, 64 : ui8],
          config.dtype_ifm = "bfloat16",
          config.dtype_ofm = "bfloat16",
          config.dtype_wts = "bfloat16",
          config.enable_bfp16_wts = 0 : ui8,
          config.ksize.height = 1 : ui8,
          config.ksize.width = 1 : ui8,
          config.lrelu_alpha = 1.000000e+00 : f32,
          config.stride_h = 1 : ui8,
          config.stride_w = 1 : ui8
        }} {
        %171 = "tosa.const"() <{value = dense<[0, 3, 1, 2]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc248)
        %172 = "tosa.const"() <{value = dense<[0, 2, 3, 1]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc248)
        %173 = tosa.reshape %arg6 {new_shape = array<i64: 512, 1, 1, 128>} : (tensor<512x128x1x1xbf16>) -> tensor<512x1x1x128xbf16> loc(#loc346)
        %174 = tosa.transpose %arg5, %172 : (tensor<1x128x4x4xbf16>, tensor<4xi32>) -> tensor<1x4x4x128xbf16> loc(#loc346)
        %175 = tosa.conv2d %174, %173, %arg7 {
          PartOfLayerName = "/layer2/layer2.0/conv3/Conv",
          PartOfOutputName = "/layer2/layer2.0/conv3/Conv",
          acc_type = f32,
          dilation = array<i64: 1, 1>,
          pad = array<i64: 0, 0, 0, 0>,
          stride = array<i64: 1, 1>} : (tensor<1x4x4x128xbf16>, tensor<512x1x1x128xbf16>, tensor<512xbf16>) -> tensor<1x4x4x512xbf16> loc(#loc346)
        %176 = tosa.transpose %175, %171 : (tensor<1x4x4x512xbf16>, tensor<4xi32>) -> tensor<1x512x4x4xbf16> loc(#loc346)
        xten_nn.output %176 : tensor<1x512x4x4xbf16> loc(#loc346)
      } -> tensor<1x512x4x4xbf16> loc(#loc346)
      %170 = xten_nn.subgraph (%arg5 = %169: tensor<1x512x4x4xbf16>, %arg6 = %arg4: tensor<1x512x4x4xbf16>)  attributes {
        LayerName = "/layer2/layer2.0/relu_2/Relu",
        Operands = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer2/layer2.0/Add_output_0",
            Port = "data_io.ifm1",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 512, 4, 4]> : vector<4xindex>
          },
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer2/layer2.0/Add_output_0",
            Port = "data_io.ifm2",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 512, 4, 4]> : vector<4xindex>
          }
        ],
        OutputName = "/layer2/layer2.0/Add",
        Reason = "MllibKernel",
        Results = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer2/layer2.0/Add_output_0",
            Port = "data_io.ofm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 512, 4, 4]> : vector<4xindex>
          }
        ],
        Specializes = "AddBf16",
        Traits = {
          Binary = true,
          Elementwise = true,
          NonNegativeOut = true
        },
        With = {
          config.act = 1 : ui8,
          config.act_type = "RELU",
          config.aie_arch = "aie2p",
          config.compiler = "peano",
          config.dtype = "bfloat16"
        }} {
        %171 = tosa.add %arg5, %arg6 {LayerName = "/layer2/layer2.0/Add", OutputName = "/layer2/layer2.0/Add"} : (tensor<1x512x4x4xbf16>, tensor<1x512x4x4xbf16>) -> tensor<1x512x4x4xbf16> loc(#loc348)
        %172 = tosa.clamp %171 {
          LayerName = "/layer2/layer2.0/relu_2/Relu",
          OutputName = "/layer2/layer2.0/relu_2/Relu",
          max_fp = 3.40282347E+38 : f32,
          max_int = 2147483647 : i64,
          min_fp = 0.000000e+00 : f32,
          min_int = 0 : i64} : (tensor<1x512x4x4xbf16>) -> tensor<1x512x4x4xbf16> loc(#loc349)
        xten_nn.output %172 : tensor<1x512x4x4xbf16> loc(#loc349)
      } -> tensor<1x512x4x4xbf16> loc(#loc347)
      xten_nn.output %170 : tensor<1x512x4x4xbf16> loc(#loc347)
    } -> tensor<1x512x4x4xbf16> loc(#loc345)
    %126 = xten_nn.subgraph (%arg1 = %125: tensor<1x512x4x4xbf16>, %arg2 = %40: tensor<128x512x1x1xbf16>, %arg3 = %62: tensor<128xbf16>)  attributes {
      IfmOperands = [0 : index],
      LayerName = "/layer2/layer2.1/relu/Relu",
      Operands = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 512, 4, 4]> : vector<4xindex>
        },
        {
          UnknownDataFormat = true,
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[128, 512, 1, 1]> : vector<4xindex>
        },
        {
          UnknownDataFormat = true
        }
      ],
      OutputName = "/layer2/layer2.1/conv1/Conv",
      Reason = "InCoreChain",
      Results = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          Name = "/layer2/layer2.1/conv1/Conv_output_0",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 128, 4, 4]> : vector<4xindex>
        }
      ],
      TilingRecipe = {
        "conv-spatial-2d" = false,
        "conv-split-stamps" = true,
        "conv-split-stamps-OC-only" = false,
        "conv-split-stamps-OH-only" = false,
        "convtype-set-by-overlay-heuristic" = false,
        "disable-oh-spatial" = false,
        "disable-ow-spatial" = false,
        "dwc-split-stamps" = false,
        "elt-split-stamps" = true,
        "fm-superiters" = false,
        "icw-superiters" = false,
        "ocw-superiters" = true,
        "ow-superiters" = false,
        "pool-split-stamps" = false,
        "reduce-split-stamps" = false
      },
      logical_mode = "2x_4x4_1x4_vertBroadcastLeft_horizBroadcastRight",
      memory_configuration = {
        L1 = {layout = "strictlegacy"},
        L2 = {ifm_buffering = "single", layout = "flexible", limited_wts_space = false, ofm_buffering = "single", weights_buffering = "double"}
      }} {
      %169 = xten_nn.subgraph (%arg4 = %arg1: tensor<1x512x4x4xbf16>, %arg5 = %arg2: tensor<128x512x1x1xbf16>, %arg6 = %arg3: tensor<128xbf16>)  attributes {
        Dilations = array<i64: 1, 1>,
        HWPadding = [[0, 0], [0, 0]],
        LayerName = "/layer2/layer2.1/relu/Relu",
        Operands = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Port = "data_io.ifm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 512, 4, 4]> : vector<4xindex>
          },
          {
            Port = "data_io.wts",
            SubPort = "wts_data",
            UnknownDataFormat = true,
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[128, 512, 1, 1]> : vector<4xindex>
          },
          {
            Port = "data_io.wts",
            SubPort = "bias",
            UnknownDataFormat = true
          }
        ],
        OutputName = "/layer2/layer2.1/conv1/Conv",
        Reason = "MllibKernel",
        Results = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer2/layer2.1/conv1/Conv_output_0",
            Port = "data_io.ofm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 128, 4, 4]> : vector<4xindex>
          }
        ],
        Specializes = "Conv2DBf16",
        Traits = {
          AllowDMAOptimization = true,
          NonNegativeOut = true
        },
        With = {
          config.AIE_API_EMULATE_BFLOAT16_MMUL_WITH_BFP16 = 1 : ui8,
          config.act = 1 : ui8,
          config.act_type = "RELU",
          config.aie_arch = "aie2p",
          config.batch_size = 1 : ui8,
          config.compiler = "peano",
          config.conv_type = [0 : ui8, 12 : ui8, 64 : ui8],
          config.dtype_ifm = "bfloat16",
          config.dtype_ofm = "bfloat16",
          config.dtype_wts = "bfloat16",
          config.enable_bfp16_wts = 0 : ui8,
          config.ksize.height = 1 : ui8,
          config.ksize.width = 1 : ui8,
          config.lrelu_alpha = 0.000000e+00 : f32,
          config.stride_h = 1 : ui8,
          config.stride_w = 1 : ui8
        }} {
        %170 = "tosa.const"() <{value = dense<[0, 3, 1, 2]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc248)
        %171 = "tosa.const"() <{value = dense<[0, 2, 3, 1]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc248)
        %172 = tosa.reshape %arg5 {new_shape = array<i64: 128, 1, 1, 512>} : (tensor<128x512x1x1xbf16>) -> tensor<128x1x1x512xbf16> loc(#loc350)
        %173 = tosa.transpose %arg4, %171 : (tensor<1x512x4x4xbf16>, tensor<4xi32>) -> tensor<1x4x4x512xbf16> loc(#loc350)
        %174 = tosa.conv2d %173, %172, %arg6 {
          PartOfLayerName = "/layer2/layer2.1/conv1/Conv",
          PartOfOutputName = "/layer2/layer2.1/conv1/Conv",
          acc_type = f32,
          dilation = array<i64: 1, 1>,
          pad = array<i64: 0, 0, 0, 0>,
          stride = array<i64: 1, 1>} : (tensor<1x4x4x512xbf16>, tensor<128x1x1x512xbf16>, tensor<128xbf16>) -> tensor<1x4x4x128xbf16> loc(#loc351)
        %175 = tosa.clamp %174 {
          LayerName = "/layer2/layer2.1/relu/Relu",
          OutputName = "/layer2/layer2.1/relu/Relu",
          max_fp = 3.40282347E+38 : f32,
          max_int = 2147483647 : i64,
          min_fp = 0.000000e+00 : f32,
          min_int = 0 : i64} : (tensor<1x4x4x128xbf16>) -> tensor<1x4x4x128xbf16> loc(#loc352)
        %176 = tosa.transpose %175, %170 : (tensor<1x4x4x128xbf16>, tensor<4xi32>) -> tensor<1x128x4x4xbf16> loc(#loc350)
        xten_nn.output %176 : tensor<1x128x4x4xbf16> loc(#loc352)
      } -> tensor<1x128x4x4xbf16> loc(#loc350)
      xten_nn.output %169 : tensor<1x128x4x4xbf16> loc(#loc350)
    } -> tensor<1x128x4x4xbf16> loc(#loc350)
    %127 = xten_nn.subgraph (%arg1 = %126: tensor<1x128x4x4xbf16>, %arg2 = %39: tensor<128x128x3x3xbf16>, %arg3 = %84: tensor<128xbf16>)  attributes {
      IfmOperands = [0 : index],
      LayerName = "/layer2/layer2.1/relu_1/Relu",
      Operands = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 128, 4, 4]> : vector<4xindex>
        },
        {
          UnknownDataFormat = true,
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[128, 128, 3, 3]> : vector<4xindex>
        },
        {
          UnknownDataFormat = true
        }
      ],
      OutputName = "/layer2/layer2.1/conv2/Conv",
      Reason = "InCoreChain",
      Results = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          Name = "/layer2/layer2.1/conv2/Conv_output_0",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 128, 4, 4]> : vector<4xindex>
        }
      ],
      TilingRecipe = {
        "conv-spatial-2d" = false,
        "conv-split-stamps" = true,
        "conv-split-stamps-OC-only" = false,
        "conv-split-stamps-OH-only" = false,
        "convtype-set-by-overlay-heuristic" = false,
        "disable-oh-spatial" = false,
        "disable-ow-spatial" = false,
        "dwc-split-stamps" = false,
        "elt-split-stamps" = true,
        "fm-superiters" = false,
        "icw-superiters" = false,
        "ocw-superiters" = true,
        "ow-superiters" = false,
        "pool-split-stamps" = false,
        "reduce-split-stamps" = false
      },
      logical_mode = "2x_4x4_1x4_vertBroadcastLeft_horizBroadcastRight",
      memory_configuration = {
        L1 = {layout = "strictlegacy"},
        L2 = {ifm_buffering = "single", layout = "flexible", limited_wts_space = false, ofm_buffering = "single", weights_buffering = "double"}
      }} {
      %169 = xten_nn.subgraph (%arg4 = %arg1: tensor<1x128x4x4xbf16>, %arg5 = %arg2: tensor<128x128x3x3xbf16>, %arg6 = %arg3: tensor<128xbf16>)  attributes {
        Dilations = array<i64: 1, 1>,
        HWPadding = [[1, 1], [1, 1]],
        LayerName = "/layer2/layer2.1/relu_1/Relu",
        Operands = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Port = "data_io.ifm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 128, 4, 4]> : vector<4xindex>
          },
          {
            Port = "data_io.wts",
            SubPort = "wts_data",
            UnknownDataFormat = true,
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[128, 128, 3, 3]> : vector<4xindex>
          },
          {
            Port = "data_io.wts",
            SubPort = "bias",
            UnknownDataFormat = true
          }
        ],
        OutputName = "/layer2/layer2.1/conv2/Conv",
        Reason = "MllibKernel",
        Results = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer2/layer2.1/conv2/Conv_output_0",
            Port = "data_io.ofm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 128, 4, 4]> : vector<4xindex>
          }
        ],
        Specializes = "Conv2DBf16",
        Traits = {
          AllowDMAOptimization = true,
          NonNegativeOut = true
        },
        With = {
          config.AIE_API_EMULATE_BFLOAT16_MMUL_WITH_BFP16 = 1 : ui8,
          config.act = 1 : ui8,
          config.act_type = "RELU",
          config.aie_arch = "aie2p",
          config.batch_size = 1 : ui8,
          config.compiler = "peano",
          config.conv_type = [0 : ui8, 12 : ui8, 64 : ui8],
          config.dtype_ifm = "bfloat16",
          config.dtype_ofm = "bfloat16",
          config.dtype_wts = "bfloat16",
          config.enable_bfp16_wts = 0 : ui8,
          config.ksize.height = 3 : ui8,
          config.ksize.width = 3 : ui8,
          config.lrelu_alpha = 0.000000e+00 : f32,
          config.stride_h = 1 : ui8,
          config.stride_w = 1 : ui8
        }} {
        %170 = "tosa.const"() <{value = dense<[0, 3, 1, 2]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc248)
        %171 = "tosa.const"() <{value = dense<[0, 2, 3, 1]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc248)
        %172 = tosa.transpose %arg5, %171 : (tensor<128x128x3x3xbf16>, tensor<4xi32>) -> tensor<128x3x3x128xbf16> loc(#loc353)
        %173 = tosa.transpose %arg4, %171 : (tensor<1x128x4x4xbf16>, tensor<4xi32>) -> tensor<1x4x4x128xbf16> loc(#loc353)
        %174 = tosa.conv2d %173, %172, %arg6 {
          PartOfLayerName = "/layer2/layer2.1/conv2/Conv",
          PartOfOutputName = "/layer2/layer2.1/conv2/Conv",
          acc_type = f32,
          dilation = array<i64: 1, 1>,
          pad = array<i64: 1, 1, 1, 1>,
          stride = array<i64: 1, 1>} : (tensor<1x4x4x128xbf16>, tensor<128x3x3x128xbf16>, tensor<128xbf16>) -> tensor<1x4x4x128xbf16> loc(#loc354)
        %175 = tosa.clamp %174 {
          LayerName = "/layer2/layer2.1/relu_1/Relu",
          OutputName = "/layer2/layer2.1/relu_1/Relu",
          max_fp = 3.40282347E+38 : f32,
          max_int = 2147483647 : i64,
          min_fp = 0.000000e+00 : f32,
          min_int = 0 : i64} : (tensor<1x4x4x128xbf16>) -> tensor<1x4x4x128xbf16> loc(#loc355)
        %176 = tosa.transpose %175, %170 : (tensor<1x4x4x128xbf16>, tensor<4xi32>) -> tensor<1x128x4x4xbf16> loc(#loc353)
        xten_nn.output %176 : tensor<1x128x4x4xbf16> loc(#loc355)
      } -> tensor<1x128x4x4xbf16> loc(#loc353)
      xten_nn.output %169 : tensor<1x128x4x4xbf16> loc(#loc353)
    } -> tensor<1x128x4x4xbf16> loc(#loc353)
    %128 = xten_nn.subgraph (%arg1 = %127: tensor<1x128x4x4xbf16>, %arg2 = %38: tensor<512x128x1x1xbf16>, %arg3 = %85: tensor<512xbf16>, %arg4 = %125: tensor<1x512x4x4xbf16>)  attributes {
      IfmOperands = [0 : index, 3 : index],
      LayerName = "/layer2/layer2.1/conv3/Conv",
      OfmShare = 3 : index,
      Operands = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          Name = "/layer2/layer2.1/relu_1/Relu_output_0",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 128, 4, 4]> : vector<4xindex>
        },
        {
          Name = "onnx::Conv_552",
          UnknownDataFormat = true,
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[512, 128, 1, 1]> : vector<4xindex>
        },
        {
          Name = "onnx::Conv_553",
          UnknownDataFormat = true
        },
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          Name = "/layer2/layer2.1/Add_output_0",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 512, 4, 4]> : vector<4xindex>
        }
      ],
      OutputName = "/layer2/layer2.1/Add",
      Reason = "InCoreChain",
      Results = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          Name = "/layer2/layer2.1/Add_output_0",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 512, 4, 4]> : vector<4xindex>
        }
      ],
      TilingRecipe = {
        "conv-spatial-2d" = false,
        "conv-split-stamps" = true,
        "conv-split-stamps-OC-only" = false,
        "conv-split-stamps-OH-only" = false,
        "convtype-set-by-overlay-heuristic" = false,
        "disable-oh-spatial" = false,
        "disable-ow-spatial" = false,
        "dwc-split-stamps" = false,
        "elt-split-stamps" = true,
        "fm-superiters" = false,
        "icw-superiters" = false,
        "ocw-superiters" = true,
        "ow-superiters" = false,
        "pool-split-stamps" = false,
        "reduce-split-stamps" = false
      },
      logical_mode = "2x_4x4_1x4_vertBroadcastLeft_horizBroadcastRight",
      memory_configuration = {
        L1 = {layout = "strictlegacy"},
        L2 = {ifm_buffering = "single", layout = "flexible", limited_wts_space = false, ofm_buffering = "single", weights_buffering = "double"}
      }} {
      %169 = xten_nn.subgraph (%arg5 = %arg1: tensor<1x128x4x4xbf16>, %arg6 = %arg2: tensor<512x128x1x1xbf16>, %arg7 = %arg3: tensor<512xbf16>)  attributes {
        Dilations = array<i64: 1, 1>,
        HWPadding = [[0, 0], [0, 0]],
        LayerName = "/layer2/layer2.1/conv3/Conv",
        Operands = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer2/layer2.1/relu_1/Relu_output_0",
            Port = "data_io.ifm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 128, 4, 4]> : vector<4xindex>
          },
          {
            Name = "onnx::Conv_552",
            Port = "data_io.wts",
            SubPort = "wts_data",
            UnknownDataFormat = true,
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[512, 128, 1, 1]> : vector<4xindex>
          },
          {
            Name = "onnx::Conv_553",
            Port = "data_io.wts",
            SubPort = "bias",
            UnknownDataFormat = true
          }
        ],
        OutputName = "/layer2/layer2.1/conv3/Conv",
        Reason = "MllibKernel",
        Results = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer2/layer2.1/conv3/Conv_output_0",
            Port = "data_io.ofm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 512, 4, 4]> : vector<4xindex>
          }
        ],
        Specializes = "Conv2DBf16",
        Traits = {
          AllowDMAOptimization = true
        },
        With = {
          config.AIE_API_EMULATE_BFLOAT16_MMUL_WITH_BFP16 = 1 : ui8,
          config.act = 0 : ui8,
          config.act_type = "RELU",
          config.aie_arch = "aie2p",
          config.batch_size = 1 : ui8,
          config.compiler = "peano",
          config.conv_type = [0 : ui8, 12 : ui8, 64 : ui8],
          config.dtype_ifm = "bfloat16",
          config.dtype_ofm = "bfloat16",
          config.dtype_wts = "bfloat16",
          config.enable_bfp16_wts = 0 : ui8,
          config.ksize.height = 1 : ui8,
          config.ksize.width = 1 : ui8,
          config.lrelu_alpha = 1.000000e+00 : f32,
          config.stride_h = 1 : ui8,
          config.stride_w = 1 : ui8
        }} {
        %171 = "tosa.const"() <{value = dense<[0, 3, 1, 2]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc248)
        %172 = "tosa.const"() <{value = dense<[0, 2, 3, 1]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc248)
        %173 = tosa.reshape %arg6 {new_shape = array<i64: 512, 1, 1, 128>} : (tensor<512x128x1x1xbf16>) -> tensor<512x1x1x128xbf16> loc(#loc357)
        %174 = tosa.transpose %arg5, %172 : (tensor<1x128x4x4xbf16>, tensor<4xi32>) -> tensor<1x4x4x128xbf16> loc(#loc357)
        %175 = tosa.conv2d %174, %173, %arg7 {
          PartOfLayerName = "/layer2/layer2.1/conv3/Conv",
          PartOfOutputName = "/layer2/layer2.1/conv3/Conv",
          acc_type = f32,
          dilation = array<i64: 1, 1>,
          pad = array<i64: 0, 0, 0, 0>,
          stride = array<i64: 1, 1>} : (tensor<1x4x4x128xbf16>, tensor<512x1x1x128xbf16>, tensor<512xbf16>) -> tensor<1x4x4x512xbf16> loc(#loc357)
        %176 = tosa.transpose %175, %171 : (tensor<1x4x4x512xbf16>, tensor<4xi32>) -> tensor<1x512x4x4xbf16> loc(#loc357)
        xten_nn.output %176 : tensor<1x512x4x4xbf16> loc(#loc357)
      } -> tensor<1x512x4x4xbf16> loc(#loc357)
      %170 = xten_nn.subgraph (%arg5 = %169: tensor<1x512x4x4xbf16>, %arg6 = %arg4: tensor<1x512x4x4xbf16>)  attributes {
        LayerName = "/layer2/layer2.1/relu_2/Relu",
        Operands = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer2/layer2.1/Add_output_0",
            Port = "data_io.ifm1",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 512, 4, 4]> : vector<4xindex>
          },
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer2/layer2.1/Add_output_0",
            Port = "data_io.ifm2",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 512, 4, 4]> : vector<4xindex>
          }
        ],
        OutputName = "/layer2/layer2.1/Add",
        Reason = "MllibKernel",
        Results = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer2/layer2.1/Add_output_0",
            Port = "data_io.ofm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 512, 4, 4]> : vector<4xindex>
          }
        ],
        Specializes = "AddBf16",
        Traits = {
          Binary = true,
          Elementwise = true,
          NonNegativeOut = true
        },
        With = {
          config.act = 1 : ui8,
          config.act_type = "RELU",
          config.aie_arch = "aie2p",
          config.compiler = "peano",
          config.dtype = "bfloat16"
        }} {
        %171 = tosa.add %arg5, %arg6 {LayerName = "/layer2/layer2.1/Add", OutputName = "/layer2/layer2.1/Add"} : (tensor<1x512x4x4xbf16>, tensor<1x512x4x4xbf16>) -> tensor<1x512x4x4xbf16> loc(#loc359)
        %172 = tosa.clamp %171 {
          LayerName = "/layer2/layer2.1/relu_2/Relu",
          OutputName = "/layer2/layer2.1/relu_2/Relu",
          max_fp = 3.40282347E+38 : f32,
          max_int = 2147483647 : i64,
          min_fp = 0.000000e+00 : f32,
          min_int = 0 : i64} : (tensor<1x512x4x4xbf16>) -> tensor<1x512x4x4xbf16> loc(#loc360)
        xten_nn.output %172 : tensor<1x512x4x4xbf16> loc(#loc360)
      } -> tensor<1x512x4x4xbf16> loc(#loc358)
      xten_nn.output %170 : tensor<1x512x4x4xbf16> loc(#loc358)
    } -> tensor<1x512x4x4xbf16> loc(#loc356)
    %129 = xten_nn.subgraph (%arg1 = %128: tensor<1x512x4x4xbf16>, %arg2 = %37: tensor<128x512x1x1xbf16>, %arg3 = %68: tensor<128xbf16>)  attributes {
      IfmOperands = [0 : index],
      LayerName = "/layer2/layer2.2/relu/Relu",
      Operands = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 512, 4, 4]> : vector<4xindex>
        },
        {
          UnknownDataFormat = true,
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[128, 512, 1, 1]> : vector<4xindex>
        },
        {
          UnknownDataFormat = true
        }
      ],
      OutputName = "/layer2/layer2.2/conv1/Conv",
      Reason = "InCoreChain",
      Results = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          Name = "/layer2/layer2.2/conv1/Conv_output_0",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 128, 4, 4]> : vector<4xindex>
        }
      ],
      TilingRecipe = {
        "conv-spatial-2d" = false,
        "conv-split-stamps" = true,
        "conv-split-stamps-OC-only" = false,
        "conv-split-stamps-OH-only" = false,
        "convtype-set-by-overlay-heuristic" = false,
        "disable-oh-spatial" = false,
        "disable-ow-spatial" = false,
        "dwc-split-stamps" = false,
        "elt-split-stamps" = true,
        "fm-superiters" = false,
        "icw-superiters" = false,
        "ocw-superiters" = true,
        "ow-superiters" = false,
        "pool-split-stamps" = false,
        "reduce-split-stamps" = false
      },
      logical_mode = "2x_4x4_1x4_vertBroadcastLeft_horizBroadcastRight",
      memory_configuration = {
        L1 = {layout = "strictlegacy"},
        L2 = {ifm_buffering = "single", layout = "flexible", limited_wts_space = false, ofm_buffering = "single", weights_buffering = "double"}
      }} {
      %169 = xten_nn.subgraph (%arg4 = %arg1: tensor<1x512x4x4xbf16>, %arg5 = %arg2: tensor<128x512x1x1xbf16>, %arg6 = %arg3: tensor<128xbf16>)  attributes {
        Dilations = array<i64: 1, 1>,
        HWPadding = [[0, 0], [0, 0]],
        LayerName = "/layer2/layer2.2/relu/Relu",
        Operands = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Port = "data_io.ifm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 512, 4, 4]> : vector<4xindex>
          },
          {
            Port = "data_io.wts",
            SubPort = "wts_data",
            UnknownDataFormat = true,
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[128, 512, 1, 1]> : vector<4xindex>
          },
          {
            Port = "data_io.wts",
            SubPort = "bias",
            UnknownDataFormat = true
          }
        ],
        OutputName = "/layer2/layer2.2/conv1/Conv",
        Reason = "MllibKernel",
        Results = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer2/layer2.2/conv1/Conv_output_0",
            Port = "data_io.ofm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 128, 4, 4]> : vector<4xindex>
          }
        ],
        Specializes = "Conv2DBf16",
        Traits = {
          AllowDMAOptimization = true,
          NonNegativeOut = true
        },
        With = {
          config.AIE_API_EMULATE_BFLOAT16_MMUL_WITH_BFP16 = 1 : ui8,
          config.act = 1 : ui8,
          config.act_type = "RELU",
          config.aie_arch = "aie2p",
          config.batch_size = 1 : ui8,
          config.compiler = "peano",
          config.conv_type = [0 : ui8, 12 : ui8, 64 : ui8],
          config.dtype_ifm = "bfloat16",
          config.dtype_ofm = "bfloat16",
          config.dtype_wts = "bfloat16",
          config.enable_bfp16_wts = 0 : ui8,
          config.ksize.height = 1 : ui8,
          config.ksize.width = 1 : ui8,
          config.lrelu_alpha = 0.000000e+00 : f32,
          config.stride_h = 1 : ui8,
          config.stride_w = 1 : ui8
        }} {
        %170 = "tosa.const"() <{value = dense<[0, 3, 1, 2]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc248)
        %171 = "tosa.const"() <{value = dense<[0, 2, 3, 1]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc248)
        %172 = tosa.reshape %arg5 {new_shape = array<i64: 128, 1, 1, 512>} : (tensor<128x512x1x1xbf16>) -> tensor<128x1x1x512xbf16> loc(#loc361)
        %173 = tosa.transpose %arg4, %171 : (tensor<1x512x4x4xbf16>, tensor<4xi32>) -> tensor<1x4x4x512xbf16> loc(#loc361)
        %174 = tosa.conv2d %173, %172, %arg6 {
          PartOfLayerName = "/layer2/layer2.2/conv1/Conv",
          PartOfOutputName = "/layer2/layer2.2/conv1/Conv",
          acc_type = f32,
          dilation = array<i64: 1, 1>,
          pad = array<i64: 0, 0, 0, 0>,
          stride = array<i64: 1, 1>} : (tensor<1x4x4x512xbf16>, tensor<128x1x1x512xbf16>, tensor<128xbf16>) -> tensor<1x4x4x128xbf16> loc(#loc362)
        %175 = tosa.clamp %174 {
          LayerName = "/layer2/layer2.2/relu/Relu",
          OutputName = "/layer2/layer2.2/relu/Relu",
          max_fp = 3.40282347E+38 : f32,
          max_int = 2147483647 : i64,
          min_fp = 0.000000e+00 : f32,
          min_int = 0 : i64} : (tensor<1x4x4x128xbf16>) -> tensor<1x4x4x128xbf16> loc(#loc363)
        %176 = tosa.transpose %175, %170 : (tensor<1x4x4x128xbf16>, tensor<4xi32>) -> tensor<1x128x4x4xbf16> loc(#loc361)
        xten_nn.output %176 : tensor<1x128x4x4xbf16> loc(#loc363)
      } -> tensor<1x128x4x4xbf16> loc(#loc361)
      xten_nn.output %169 : tensor<1x128x4x4xbf16> loc(#loc361)
    } -> tensor<1x128x4x4xbf16> loc(#loc361)
    %130 = xten_nn.subgraph (%arg1 = %129: tensor<1x128x4x4xbf16>, %arg2 = %36: tensor<128x128x3x3xbf16>, %arg3 = %72: tensor<128xbf16>)  attributes {
      IfmOperands = [0 : index],
      LayerName = "/layer2/layer2.2/relu_1/Relu",
      Operands = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 128, 4, 4]> : vector<4xindex>
        },
        {
          UnknownDataFormat = true,
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[128, 128, 3, 3]> : vector<4xindex>
        },
        {
          UnknownDataFormat = true
        }
      ],
      OutputName = "/layer2/layer2.2/conv2/Conv",
      Reason = "InCoreChain",
      Results = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          Name = "/layer2/layer2.2/conv2/Conv_output_0",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 128, 4, 4]> : vector<4xindex>
        }
      ],
      TilingRecipe = {
        "conv-spatial-2d" = false,
        "conv-split-stamps" = true,
        "conv-split-stamps-OC-only" = false,
        "conv-split-stamps-OH-only" = false,
        "convtype-set-by-overlay-heuristic" = false,
        "disable-oh-spatial" = false,
        "disable-ow-spatial" = false,
        "dwc-split-stamps" = false,
        "elt-split-stamps" = true,
        "fm-superiters" = false,
        "icw-superiters" = false,
        "ocw-superiters" = true,
        "ow-superiters" = false,
        "pool-split-stamps" = false,
        "reduce-split-stamps" = false
      },
      logical_mode = "2x_4x4_1x4_vertBroadcastLeft_horizBroadcastRight",
      memory_configuration = {
        L1 = {layout = "strictlegacy"},
        L2 = {ifm_buffering = "single", layout = "flexible", limited_wts_space = false, ofm_buffering = "single", weights_buffering = "double"}
      }} {
      %169 = xten_nn.subgraph (%arg4 = %arg1: tensor<1x128x4x4xbf16>, %arg5 = %arg2: tensor<128x128x3x3xbf16>, %arg6 = %arg3: tensor<128xbf16>)  attributes {
        Dilations = array<i64: 1, 1>,
        HWPadding = [[1, 1], [1, 1]],
        LayerName = "/layer2/layer2.2/relu_1/Relu",
        Operands = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Port = "data_io.ifm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 128, 4, 4]> : vector<4xindex>
          },
          {
            Port = "data_io.wts",
            SubPort = "wts_data",
            UnknownDataFormat = true,
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[128, 128, 3, 3]> : vector<4xindex>
          },
          {
            Port = "data_io.wts",
            SubPort = "bias",
            UnknownDataFormat = true
          }
        ],
        OutputName = "/layer2/layer2.2/conv2/Conv",
        Reason = "MllibKernel",
        Results = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer2/layer2.2/conv2/Conv_output_0",
            Port = "data_io.ofm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 128, 4, 4]> : vector<4xindex>
          }
        ],
        Specializes = "Conv2DBf16",
        Traits = {
          AllowDMAOptimization = true,
          NonNegativeOut = true
        },
        With = {
          config.AIE_API_EMULATE_BFLOAT16_MMUL_WITH_BFP16 = 1 : ui8,
          config.act = 1 : ui8,
          config.act_type = "RELU",
          config.aie_arch = "aie2p",
          config.batch_size = 1 : ui8,
          config.compiler = "peano",
          config.conv_type = [0 : ui8, 12 : ui8, 64 : ui8],
          config.dtype_ifm = "bfloat16",
          config.dtype_ofm = "bfloat16",
          config.dtype_wts = "bfloat16",
          config.enable_bfp16_wts = 0 : ui8,
          config.ksize.height = 3 : ui8,
          config.ksize.width = 3 : ui8,
          config.lrelu_alpha = 0.000000e+00 : f32,
          config.stride_h = 1 : ui8,
          config.stride_w = 1 : ui8
        }} {
        %170 = "tosa.const"() <{value = dense<[0, 3, 1, 2]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc248)
        %171 = "tosa.const"() <{value = dense<[0, 2, 3, 1]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc248)
        %172 = tosa.transpose %arg5, %171 : (tensor<128x128x3x3xbf16>, tensor<4xi32>) -> tensor<128x3x3x128xbf16> loc(#loc364)
        %173 = tosa.transpose %arg4, %171 : (tensor<1x128x4x4xbf16>, tensor<4xi32>) -> tensor<1x4x4x128xbf16> loc(#loc364)
        %174 = tosa.conv2d %173, %172, %arg6 {
          PartOfLayerName = "/layer2/layer2.2/conv2/Conv",
          PartOfOutputName = "/layer2/layer2.2/conv2/Conv",
          acc_type = f32,
          dilation = array<i64: 1, 1>,
          pad = array<i64: 1, 1, 1, 1>,
          stride = array<i64: 1, 1>} : (tensor<1x4x4x128xbf16>, tensor<128x3x3x128xbf16>, tensor<128xbf16>) -> tensor<1x4x4x128xbf16> loc(#loc365)
        %175 = tosa.clamp %174 {
          LayerName = "/layer2/layer2.2/relu_1/Relu",
          OutputName = "/layer2/layer2.2/relu_1/Relu",
          max_fp = 3.40282347E+38 : f32,
          max_int = 2147483647 : i64,
          min_fp = 0.000000e+00 : f32,
          min_int = 0 : i64} : (tensor<1x4x4x128xbf16>) -> tensor<1x4x4x128xbf16> loc(#loc366)
        %176 = tosa.transpose %175, %170 : (tensor<1x4x4x128xbf16>, tensor<4xi32>) -> tensor<1x128x4x4xbf16> loc(#loc364)
        xten_nn.output %176 : tensor<1x128x4x4xbf16> loc(#loc366)
      } -> tensor<1x128x4x4xbf16> loc(#loc364)
      xten_nn.output %169 : tensor<1x128x4x4xbf16> loc(#loc364)
    } -> tensor<1x128x4x4xbf16> loc(#loc364)
    %131 = xten_nn.subgraph (%arg1 = %130: tensor<1x128x4x4xbf16>, %arg2 = %35: tensor<512x128x1x1xbf16>, %arg3 = %70: tensor<512xbf16>, %arg4 = %128: tensor<1x512x4x4xbf16>)  attributes {
      IfmOperands = [0 : index, 3 : index],
      LayerName = "/layer2/layer2.2/conv3/Conv",
      OfmShare = 3 : index,
      Operands = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          Name = "/layer2/layer2.2/relu_1/Relu_output_0",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 128, 4, 4]> : vector<4xindex>
        },
        {
          Name = "onnx::Conv_561",
          UnknownDataFormat = true,
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[512, 128, 1, 1]> : vector<4xindex>
        },
        {
          Name = "onnx::Conv_562",
          UnknownDataFormat = true
        },
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          Name = "/layer2/layer2.2/Add_output_0",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 512, 4, 4]> : vector<4xindex>
        }
      ],
      OutputName = "/layer2/layer2.2/Add",
      Reason = "InCoreChain",
      Results = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          Name = "/layer2/layer2.2/Add_output_0",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 512, 4, 4]> : vector<4xindex>
        }
      ],
      TilingRecipe = {
        "conv-spatial-2d" = false,
        "conv-split-stamps" = true,
        "conv-split-stamps-OC-only" = false,
        "conv-split-stamps-OH-only" = false,
        "convtype-set-by-overlay-heuristic" = false,
        "disable-oh-spatial" = false,
        "disable-ow-spatial" = false,
        "dwc-split-stamps" = false,
        "elt-split-stamps" = true,
        "fm-superiters" = false,
        "icw-superiters" = false,
        "ocw-superiters" = true,
        "ow-superiters" = false,
        "pool-split-stamps" = false,
        "reduce-split-stamps" = false
      },
      logical_mode = "2x_4x4_1x4_vertBroadcastLeft_horizBroadcastRight",
      memory_configuration = {
        L1 = {layout = "strictlegacy"},
        L2 = {ifm_buffering = "single", layout = "flexible", limited_wts_space = false, ofm_buffering = "single", weights_buffering = "double"}
      }} {
      %169 = xten_nn.subgraph (%arg5 = %arg1: tensor<1x128x4x4xbf16>, %arg6 = %arg2: tensor<512x128x1x1xbf16>, %arg7 = %arg3: tensor<512xbf16>)  attributes {
        Dilations = array<i64: 1, 1>,
        HWPadding = [[0, 0], [0, 0]],
        LayerName = "/layer2/layer2.2/conv3/Conv",
        Operands = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer2/layer2.2/relu_1/Relu_output_0",
            Port = "data_io.ifm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 128, 4, 4]> : vector<4xindex>
          },
          {
            Name = "onnx::Conv_561",
            Port = "data_io.wts",
            SubPort = "wts_data",
            UnknownDataFormat = true,
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[512, 128, 1, 1]> : vector<4xindex>
          },
          {
            Name = "onnx::Conv_562",
            Port = "data_io.wts",
            SubPort = "bias",
            UnknownDataFormat = true
          }
        ],
        OutputName = "/layer2/layer2.2/conv3/Conv",
        Reason = "MllibKernel",
        Results = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer2/layer2.2/conv3/Conv_output_0",
            Port = "data_io.ofm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 512, 4, 4]> : vector<4xindex>
          }
        ],
        Specializes = "Conv2DBf16",
        Traits = {
          AllowDMAOptimization = true
        },
        With = {
          config.AIE_API_EMULATE_BFLOAT16_MMUL_WITH_BFP16 = 1 : ui8,
          config.act = 0 : ui8,
          config.act_type = "RELU",
          config.aie_arch = "aie2p",
          config.batch_size = 1 : ui8,
          config.compiler = "peano",
          config.conv_type = [0 : ui8, 12 : ui8, 64 : ui8],
          config.dtype_ifm = "bfloat16",
          config.dtype_ofm = "bfloat16",
          config.dtype_wts = "bfloat16",
          config.enable_bfp16_wts = 0 : ui8,
          config.ksize.height = 1 : ui8,
          config.ksize.width = 1 : ui8,
          config.lrelu_alpha = 1.000000e+00 : f32,
          config.stride_h = 1 : ui8,
          config.stride_w = 1 : ui8
        }} {
        %171 = "tosa.const"() <{value = dense<[0, 3, 1, 2]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc248)
        %172 = "tosa.const"() <{value = dense<[0, 2, 3, 1]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc248)
        %173 = tosa.reshape %arg6 {new_shape = array<i64: 512, 1, 1, 128>} : (tensor<512x128x1x1xbf16>) -> tensor<512x1x1x128xbf16> loc(#loc368)
        %174 = tosa.transpose %arg5, %172 : (tensor<1x128x4x4xbf16>, tensor<4xi32>) -> tensor<1x4x4x128xbf16> loc(#loc368)
        %175 = tosa.conv2d %174, %173, %arg7 {
          PartOfLayerName = "/layer2/layer2.2/conv3/Conv",
          PartOfOutputName = "/layer2/layer2.2/conv3/Conv",
          acc_type = f32,
          dilation = array<i64: 1, 1>,
          pad = array<i64: 0, 0, 0, 0>,
          stride = array<i64: 1, 1>} : (tensor<1x4x4x128xbf16>, tensor<512x1x1x128xbf16>, tensor<512xbf16>) -> tensor<1x4x4x512xbf16> loc(#loc368)
        %176 = tosa.transpose %175, %171 : (tensor<1x4x4x512xbf16>, tensor<4xi32>) -> tensor<1x512x4x4xbf16> loc(#loc368)
        xten_nn.output %176 : tensor<1x512x4x4xbf16> loc(#loc368)
      } -> tensor<1x512x4x4xbf16> loc(#loc368)
      %170 = xten_nn.subgraph (%arg5 = %169: tensor<1x512x4x4xbf16>, %arg6 = %arg4: tensor<1x512x4x4xbf16>)  attributes {
        LayerName = "/layer2/layer2.2/relu_2/Relu",
        Operands = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer2/layer2.2/Add_output_0",
            Port = "data_io.ifm1",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 512, 4, 4]> : vector<4xindex>
          },
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer2/layer2.2/Add_output_0",
            Port = "data_io.ifm2",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 512, 4, 4]> : vector<4xindex>
          }
        ],
        OutputName = "/layer2/layer2.2/Add",
        Reason = "MllibKernel",
        Results = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer2/layer2.2/Add_output_0",
            Port = "data_io.ofm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 512, 4, 4]> : vector<4xindex>
          }
        ],
        Specializes = "AddBf16",
        Traits = {
          Binary = true,
          Elementwise = true,
          NonNegativeOut = true
        },
        With = {
          config.act = 1 : ui8,
          config.act_type = "RELU",
          config.aie_arch = "aie2p",
          config.compiler = "peano",
          config.dtype = "bfloat16"
        }} {
        %171 = tosa.add %arg5, %arg6 {LayerName = "/layer2/layer2.2/Add", OutputName = "/layer2/layer2.2/Add"} : (tensor<1x512x4x4xbf16>, tensor<1x512x4x4xbf16>) -> tensor<1x512x4x4xbf16> loc(#loc370)
        %172 = tosa.clamp %171 {
          LayerName = "/layer2/layer2.2/relu_2/Relu",
          OutputName = "/layer2/layer2.2/relu_2/Relu",
          max_fp = 3.40282347E+38 : f32,
          max_int = 2147483647 : i64,
          min_fp = 0.000000e+00 : f32,
          min_int = 0 : i64} : (tensor<1x512x4x4xbf16>) -> tensor<1x512x4x4xbf16> loc(#loc371)
        xten_nn.output %172 : tensor<1x512x4x4xbf16> loc(#loc371)
      } -> tensor<1x512x4x4xbf16> loc(#loc369)
      xten_nn.output %170 : tensor<1x512x4x4xbf16> loc(#loc369)
    } -> tensor<1x512x4x4xbf16> loc(#loc367)
    %132 = xten_nn.subgraph (%arg1 = %131: tensor<1x512x4x4xbf16>, %arg2 = %34: tensor<128x512x1x1xbf16>, %arg3 = %65: tensor<128xbf16>)  attributes {
      IfmOperands = [0 : index],
      LayerName = "/layer2/layer2.3/relu/Relu",
      Operands = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 512, 4, 4]> : vector<4xindex>
        },
        {
          UnknownDataFormat = true,
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[128, 512, 1, 1]> : vector<4xindex>
        },
        {
          UnknownDataFormat = true
        }
      ],
      OutputName = "/layer2/layer2.3/conv1/Conv",
      Reason = "InCoreChain",
      Results = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          Name = "/layer2/layer2.3/conv1/Conv_output_0",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 128, 4, 4]> : vector<4xindex>
        }
      ],
      TilingRecipe = {
        "conv-spatial-2d" = false,
        "conv-split-stamps" = true,
        "conv-split-stamps-OC-only" = false,
        "conv-split-stamps-OH-only" = false,
        "convtype-set-by-overlay-heuristic" = false,
        "disable-oh-spatial" = false,
        "disable-ow-spatial" = false,
        "dwc-split-stamps" = false,
        "elt-split-stamps" = true,
        "fm-superiters" = false,
        "icw-superiters" = false,
        "ocw-superiters" = true,
        "ow-superiters" = false,
        "pool-split-stamps" = false,
        "reduce-split-stamps" = false
      },
      logical_mode = "2x_4x4_1x4_vertBroadcastLeft_horizBroadcastRight",
      memory_configuration = {
        L1 = {layout = "strictlegacy"},
        L2 = {ifm_buffering = "single", layout = "flexible", limited_wts_space = false, ofm_buffering = "single", weights_buffering = "double"}
      }} {
      %169 = xten_nn.subgraph (%arg4 = %arg1: tensor<1x512x4x4xbf16>, %arg5 = %arg2: tensor<128x512x1x1xbf16>, %arg6 = %arg3: tensor<128xbf16>)  attributes {
        Dilations = array<i64: 1, 1>,
        HWPadding = [[0, 0], [0, 0]],
        LayerName = "/layer2/layer2.3/relu/Relu",
        Operands = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Port = "data_io.ifm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 512, 4, 4]> : vector<4xindex>
          },
          {
            Port = "data_io.wts",
            SubPort = "wts_data",
            UnknownDataFormat = true,
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[128, 512, 1, 1]> : vector<4xindex>
          },
          {
            Port = "data_io.wts",
            SubPort = "bias",
            UnknownDataFormat = true
          }
        ],
        OutputName = "/layer2/layer2.3/conv1/Conv",
        Reason = "MllibKernel",
        Results = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer2/layer2.3/conv1/Conv_output_0",
            Port = "data_io.ofm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 128, 4, 4]> : vector<4xindex>
          }
        ],
        Specializes = "Conv2DBf16",
        Traits = {
          AllowDMAOptimization = true,
          NonNegativeOut = true
        },
        With = {
          config.AIE_API_EMULATE_BFLOAT16_MMUL_WITH_BFP16 = 1 : ui8,
          config.act = 1 : ui8,
          config.act_type = "RELU",
          config.aie_arch = "aie2p",
          config.batch_size = 1 : ui8,
          config.compiler = "peano",
          config.conv_type = [0 : ui8, 12 : ui8, 64 : ui8],
          config.dtype_ifm = "bfloat16",
          config.dtype_ofm = "bfloat16",
          config.dtype_wts = "bfloat16",
          config.enable_bfp16_wts = 0 : ui8,
          config.ksize.height = 1 : ui8,
          config.ksize.width = 1 : ui8,
          config.lrelu_alpha = 0.000000e+00 : f32,
          config.stride_h = 1 : ui8,
          config.stride_w = 1 : ui8
        }} {
        %170 = "tosa.const"() <{value = dense<[0, 3, 1, 2]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc248)
        %171 = "tosa.const"() <{value = dense<[0, 2, 3, 1]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc248)
        %172 = tosa.reshape %arg5 {new_shape = array<i64: 128, 1, 1, 512>} : (tensor<128x512x1x1xbf16>) -> tensor<128x1x1x512xbf16> loc(#loc372)
        %173 = tosa.transpose %arg4, %171 : (tensor<1x512x4x4xbf16>, tensor<4xi32>) -> tensor<1x4x4x512xbf16> loc(#loc372)
        %174 = tosa.conv2d %173, %172, %arg6 {
          PartOfLayerName = "/layer2/layer2.3/conv1/Conv",
          PartOfOutputName = "/layer2/layer2.3/conv1/Conv",
          acc_type = f32,
          dilation = array<i64: 1, 1>,
          pad = array<i64: 0, 0, 0, 0>,
          stride = array<i64: 1, 1>} : (tensor<1x4x4x512xbf16>, tensor<128x1x1x512xbf16>, tensor<128xbf16>) -> tensor<1x4x4x128xbf16> loc(#loc373)
        %175 = tosa.clamp %174 {
          LayerName = "/layer2/layer2.3/relu/Relu",
          OutputName = "/layer2/layer2.3/relu/Relu",
          max_fp = 3.40282347E+38 : f32,
          max_int = 2147483647 : i64,
          min_fp = 0.000000e+00 : f32,
          min_int = 0 : i64} : (tensor<1x4x4x128xbf16>) -> tensor<1x4x4x128xbf16> loc(#loc374)
        %176 = tosa.transpose %175, %170 : (tensor<1x4x4x128xbf16>, tensor<4xi32>) -> tensor<1x128x4x4xbf16> loc(#loc372)
        xten_nn.output %176 : tensor<1x128x4x4xbf16> loc(#loc374)
      } -> tensor<1x128x4x4xbf16> loc(#loc372)
      xten_nn.output %169 : tensor<1x128x4x4xbf16> loc(#loc372)
    } -> tensor<1x128x4x4xbf16> loc(#loc372)
    %133 = xten_nn.subgraph (%arg1 = %132: tensor<1x128x4x4xbf16>, %arg2 = %33: tensor<128x128x3x3xbf16>, %arg3 = %63: tensor<128xbf16>)  attributes {
      IfmOperands = [0 : index],
      LayerName = "/layer2/layer2.3/relu_1/Relu",
      Operands = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 128, 4, 4]> : vector<4xindex>
        },
        {
          UnknownDataFormat = true,
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[128, 128, 3, 3]> : vector<4xindex>
        },
        {
          UnknownDataFormat = true
        }
      ],
      OutputName = "/layer2/layer2.3/conv2/Conv",
      Reason = "InCoreChain",
      Results = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          Name = "/layer2/layer2.3/conv2/Conv_output_0",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 128, 4, 4]> : vector<4xindex>
        }
      ],
      TilingRecipe = {
        "conv-spatial-2d" = false,
        "conv-split-stamps" = true,
        "conv-split-stamps-OC-only" = false,
        "conv-split-stamps-OH-only" = false,
        "convtype-set-by-overlay-heuristic" = false,
        "disable-oh-spatial" = false,
        "disable-ow-spatial" = false,
        "dwc-split-stamps" = false,
        "elt-split-stamps" = true,
        "fm-superiters" = false,
        "icw-superiters" = false,
        "ocw-superiters" = true,
        "ow-superiters" = false,
        "pool-split-stamps" = false,
        "reduce-split-stamps" = false
      },
      logical_mode = "2x_4x4_1x4_vertBroadcastLeft_horizBroadcastRight",
      memory_configuration = {
        L1 = {layout = "strictlegacy"},
        L2 = {ifm_buffering = "single", layout = "flexible", limited_wts_space = false, ofm_buffering = "single", weights_buffering = "double"}
      }} {
      %169 = xten_nn.subgraph (%arg4 = %arg1: tensor<1x128x4x4xbf16>, %arg5 = %arg2: tensor<128x128x3x3xbf16>, %arg6 = %arg3: tensor<128xbf16>)  attributes {
        Dilations = array<i64: 1, 1>,
        HWPadding = [[1, 1], [1, 1]],
        LayerName = "/layer2/layer2.3/relu_1/Relu",
        Operands = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Port = "data_io.ifm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 128, 4, 4]> : vector<4xindex>
          },
          {
            Port = "data_io.wts",
            SubPort = "wts_data",
            UnknownDataFormat = true,
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[128, 128, 3, 3]> : vector<4xindex>
          },
          {
            Port = "data_io.wts",
            SubPort = "bias",
            UnknownDataFormat = true
          }
        ],
        OutputName = "/layer2/layer2.3/conv2/Conv",
        Reason = "MllibKernel",
        Results = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer2/layer2.3/conv2/Conv_output_0",
            Port = "data_io.ofm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 128, 4, 4]> : vector<4xindex>
          }
        ],
        Specializes = "Conv2DBf16",
        Traits = {
          AllowDMAOptimization = true,
          NonNegativeOut = true
        },
        With = {
          config.AIE_API_EMULATE_BFLOAT16_MMUL_WITH_BFP16 = 1 : ui8,
          config.act = 1 : ui8,
          config.act_type = "RELU",
          config.aie_arch = "aie2p",
          config.batch_size = 1 : ui8,
          config.compiler = "peano",
          config.conv_type = [0 : ui8, 12 : ui8, 64 : ui8],
          config.dtype_ifm = "bfloat16",
          config.dtype_ofm = "bfloat16",
          config.dtype_wts = "bfloat16",
          config.enable_bfp16_wts = 0 : ui8,
          config.ksize.height = 3 : ui8,
          config.ksize.width = 3 : ui8,
          config.lrelu_alpha = 0.000000e+00 : f32,
          config.stride_h = 1 : ui8,
          config.stride_w = 1 : ui8
        }} {
        %170 = "tosa.const"() <{value = dense<[0, 3, 1, 2]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc248)
        %171 = "tosa.const"() <{value = dense<[0, 2, 3, 1]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc248)
        %172 = tosa.transpose %arg5, %171 : (tensor<128x128x3x3xbf16>, tensor<4xi32>) -> tensor<128x3x3x128xbf16> loc(#loc375)
        %173 = tosa.transpose %arg4, %171 : (tensor<1x128x4x4xbf16>, tensor<4xi32>) -> tensor<1x4x4x128xbf16> loc(#loc375)
        %174 = tosa.conv2d %173, %172, %arg6 {
          PartOfLayerName = "/layer2/layer2.3/conv2/Conv",
          PartOfOutputName = "/layer2/layer2.3/conv2/Conv",
          acc_type = f32,
          dilation = array<i64: 1, 1>,
          pad = array<i64: 1, 1, 1, 1>,
          stride = array<i64: 1, 1>} : (tensor<1x4x4x128xbf16>, tensor<128x3x3x128xbf16>, tensor<128xbf16>) -> tensor<1x4x4x128xbf16> loc(#loc376)
        %175 = tosa.clamp %174 {
          LayerName = "/layer2/layer2.3/relu_1/Relu",
          OutputName = "/layer2/layer2.3/relu_1/Relu",
          max_fp = 3.40282347E+38 : f32,
          max_int = 2147483647 : i64,
          min_fp = 0.000000e+00 : f32,
          min_int = 0 : i64} : (tensor<1x4x4x128xbf16>) -> tensor<1x4x4x128xbf16> loc(#loc377)
        %176 = tosa.transpose %175, %170 : (tensor<1x4x4x128xbf16>, tensor<4xi32>) -> tensor<1x128x4x4xbf16> loc(#loc375)
        xten_nn.output %176 : tensor<1x128x4x4xbf16> loc(#loc377)
      } -> tensor<1x128x4x4xbf16> loc(#loc375)
      xten_nn.output %169 : tensor<1x128x4x4xbf16> loc(#loc375)
    } -> tensor<1x128x4x4xbf16> loc(#loc375)
    %134 = xten_nn.subgraph (%arg1 = %133: tensor<1x128x4x4xbf16>, %arg2 = %32: tensor<512x128x1x1xbf16>, %arg3 = %105: tensor<512xbf16>, %arg4 = %131: tensor<1x512x4x4xbf16>)  attributes {
      IfmOperands = [0 : index, 3 : index],
      LayerName = "/layer2/layer2.3/conv3/Conv",
      OfmShare = 3 : index,
      Operands = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          Name = "/layer2/layer2.3/relu_1/Relu_output_0",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 128, 4, 4]> : vector<4xindex>
        },
        {
          Name = "onnx::Conv_570",
          UnknownDataFormat = true,
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[512, 128, 1, 1]> : vector<4xindex>
        },
        {
          Name = "onnx::Conv_571",
          UnknownDataFormat = true
        },
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          Name = "/layer2/layer2.3/Add_output_0",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 512, 4, 4]> : vector<4xindex>
        }
      ],
      OutputName = "/layer2/layer2.3/Add",
      Reason = "InCoreChain",
      Results = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          Name = "/layer2/layer2.3/Add_output_0",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 512, 4, 4]> : vector<4xindex>
        }
      ],
      TilingRecipe = {
        "conv-spatial-2d" = false,
        "conv-split-stamps" = true,
        "conv-split-stamps-OC-only" = false,
        "conv-split-stamps-OH-only" = false,
        "convtype-set-by-overlay-heuristic" = false,
        "disable-oh-spatial" = false,
        "disable-ow-spatial" = false,
        "dwc-split-stamps" = false,
        "elt-split-stamps" = true,
        "fm-superiters" = false,
        "icw-superiters" = false,
        "ocw-superiters" = true,
        "ow-superiters" = false,
        "pool-split-stamps" = false,
        "reduce-split-stamps" = false
      },
      logical_mode = "2x_4x4_1x4_vertBroadcastLeft_horizBroadcastRight",
      memory_configuration = {
        L1 = {layout = "strictlegacy"},
        L2 = {ifm_buffering = "single", layout = "flexible", limited_wts_space = false, ofm_buffering = "single", weights_buffering = "double"}
      }} {
      %169 = xten_nn.subgraph (%arg5 = %arg1: tensor<1x128x4x4xbf16>, %arg6 = %arg2: tensor<512x128x1x1xbf16>, %arg7 = %arg3: tensor<512xbf16>)  attributes {
        Dilations = array<i64: 1, 1>,
        HWPadding = [[0, 0], [0, 0]],
        LayerName = "/layer2/layer2.3/conv3/Conv",
        Operands = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer2/layer2.3/relu_1/Relu_output_0",
            Port = "data_io.ifm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 128, 4, 4]> : vector<4xindex>
          },
          {
            Name = "onnx::Conv_570",
            Port = "data_io.wts",
            SubPort = "wts_data",
            UnknownDataFormat = true,
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[512, 128, 1, 1]> : vector<4xindex>
          },
          {
            Name = "onnx::Conv_571",
            Port = "data_io.wts",
            SubPort = "bias",
            UnknownDataFormat = true
          }
        ],
        OutputName = "/layer2/layer2.3/conv3/Conv",
        Reason = "MllibKernel",
        Results = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer2/layer2.3/conv3/Conv_output_0",
            Port = "data_io.ofm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 512, 4, 4]> : vector<4xindex>
          }
        ],
        Specializes = "Conv2DBf16",
        Traits = {
          AllowDMAOptimization = true
        },
        With = {
          config.AIE_API_EMULATE_BFLOAT16_MMUL_WITH_BFP16 = 1 : ui8,
          config.act = 0 : ui8,
          config.act_type = "RELU",
          config.aie_arch = "aie2p",
          config.batch_size = 1 : ui8,
          config.compiler = "peano",
          config.conv_type = [0 : ui8, 12 : ui8, 64 : ui8],
          config.dtype_ifm = "bfloat16",
          config.dtype_ofm = "bfloat16",
          config.dtype_wts = "bfloat16",
          config.enable_bfp16_wts = 0 : ui8,
          config.ksize.height = 1 : ui8,
          config.ksize.width = 1 : ui8,
          config.lrelu_alpha = 1.000000e+00 : f32,
          config.stride_h = 1 : ui8,
          config.stride_w = 1 : ui8
        }} {
        %171 = "tosa.const"() <{value = dense<[0, 3, 1, 2]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc248)
        %172 = "tosa.const"() <{value = dense<[0, 2, 3, 1]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc248)
        %173 = tosa.reshape %arg6 {new_shape = array<i64: 512, 1, 1, 128>} : (tensor<512x128x1x1xbf16>) -> tensor<512x1x1x128xbf16> loc(#loc379)
        %174 = tosa.transpose %arg5, %172 : (tensor<1x128x4x4xbf16>, tensor<4xi32>) -> tensor<1x4x4x128xbf16> loc(#loc379)
        %175 = tosa.conv2d %174, %173, %arg7 {
          PartOfLayerName = "/layer2/layer2.3/conv3/Conv",
          PartOfOutputName = "/layer2/layer2.3/conv3/Conv",
          acc_type = f32,
          dilation = array<i64: 1, 1>,
          pad = array<i64: 0, 0, 0, 0>,
          stride = array<i64: 1, 1>} : (tensor<1x4x4x128xbf16>, tensor<512x1x1x128xbf16>, tensor<512xbf16>) -> tensor<1x4x4x512xbf16> loc(#loc379)
        %176 = tosa.transpose %175, %171 : (tensor<1x4x4x512xbf16>, tensor<4xi32>) -> tensor<1x512x4x4xbf16> loc(#loc379)
        xten_nn.output %176 : tensor<1x512x4x4xbf16> loc(#loc379)
      } -> tensor<1x512x4x4xbf16> loc(#loc379)
      %170 = xten_nn.subgraph (%arg5 = %169: tensor<1x512x4x4xbf16>, %arg6 = %arg4: tensor<1x512x4x4xbf16>)  attributes {
        LayerName = "/layer2/layer2.3/relu_2/Relu",
        Operands = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer2/layer2.3/Add_output_0",
            Port = "data_io.ifm1",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 512, 4, 4]> : vector<4xindex>
          },
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer2/layer2.3/Add_output_0",
            Port = "data_io.ifm2",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 512, 4, 4]> : vector<4xindex>
          }
        ],
        OutputName = "/layer2/layer2.3/Add",
        Reason = "MllibKernel",
        Results = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer2/layer2.3/Add_output_0",
            Port = "data_io.ofm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 512, 4, 4]> : vector<4xindex>
          }
        ],
        Specializes = "AddBf16",
        Traits = {
          Binary = true,
          Elementwise = true,
          NonNegativeOut = true
        },
        With = {
          config.act = 1 : ui8,
          config.act_type = "RELU",
          config.aie_arch = "aie2p",
          config.compiler = "peano",
          config.dtype = "bfloat16"
        }} {
        %171 = tosa.add %arg5, %arg6 {LayerName = "/layer2/layer2.3/Add", OutputName = "/layer2/layer2.3/Add"} : (tensor<1x512x4x4xbf16>, tensor<1x512x4x4xbf16>) -> tensor<1x512x4x4xbf16> loc(#loc381)
        %172 = tosa.clamp %171 {
          LayerName = "/layer2/layer2.3/relu_2/Relu",
          OutputName = "/layer2/layer2.3/relu_2/Relu",
          max_fp = 3.40282347E+38 : f32,
          max_int = 2147483647 : i64,
          min_fp = 0.000000e+00 : f32,
          min_int = 0 : i64} : (tensor<1x512x4x4xbf16>) -> tensor<1x512x4x4xbf16> loc(#loc382)
        xten_nn.output %172 : tensor<1x512x4x4xbf16> loc(#loc382)
      } -> tensor<1x512x4x4xbf16> loc(#loc380)
      xten_nn.output %170 : tensor<1x512x4x4xbf16> loc(#loc380)
    } -> tensor<1x512x4x4xbf16> loc(#loc378)
    %135 = xten_nn.subgraph (%arg1 = %134: tensor<1x512x4x4xbf16>, %arg2 = %31: tensor<256x512x1x1xbf16>, %arg3 = %76: tensor<256xbf16>)  attributes {
      IfmOperands = [0 : index],
      LayerName = "/layer3/layer3.0/relu/Relu",
      Operands = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 512, 4, 4]> : vector<4xindex>
        },
        {
          UnknownDataFormat = true,
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[256, 512, 1, 1]> : vector<4xindex>
        },
        {
          UnknownDataFormat = true
        }
      ],
      OutputName = "/layer3/layer3.0/conv1/Conv",
      Reason = "InCoreChain",
      Results = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          Name = "/layer3/layer3.0/conv1/Conv_output_0",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 256, 4, 4]> : vector<4xindex>
        }
      ],
      TilingRecipe = {
        "conv-spatial-2d" = false,
        "conv-split-stamps" = true,
        "conv-split-stamps-OC-only" = false,
        "conv-split-stamps-OH-only" = false,
        "convtype-set-by-overlay-heuristic" = false,
        "disable-oh-spatial" = false,
        "disable-ow-spatial" = false,
        "dwc-split-stamps" = false,
        "elt-split-stamps" = true,
        "fm-superiters" = false,
        "icw-superiters" = false,
        "ocw-superiters" = true,
        "ow-superiters" = false,
        "pool-split-stamps" = false,
        "reduce-split-stamps" = false
      },
      logical_mode = "2x_4x4_1x4_vertBroadcastLeft_horizBroadcastRight",
      memory_configuration = {
        L1 = {layout = "strictlegacy"},
        L2 = {ifm_buffering = "single", layout = "flexible", limited_wts_space = false, ofm_buffering = "single", weights_buffering = "double"}
      }} {
      %169 = xten_nn.subgraph (%arg4 = %arg1: tensor<1x512x4x4xbf16>, %arg5 = %arg2: tensor<256x512x1x1xbf16>, %arg6 = %arg3: tensor<256xbf16>)  attributes {
        Dilations = array<i64: 1, 1>,
        HWPadding = [[0, 0], [0, 0]],
        LayerName = "/layer3/layer3.0/relu/Relu",
        Operands = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Port = "data_io.ifm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 512, 4, 4]> : vector<4xindex>
          },
          {
            Port = "data_io.wts",
            SubPort = "wts_data",
            UnknownDataFormat = true,
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[256, 512, 1, 1]> : vector<4xindex>
          },
          {
            Port = "data_io.wts",
            SubPort = "bias",
            UnknownDataFormat = true
          }
        ],
        OutputName = "/layer3/layer3.0/conv1/Conv",
        Reason = "MllibKernel",
        Results = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer3/layer3.0/conv1/Conv_output_0",
            Port = "data_io.ofm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 256, 4, 4]> : vector<4xindex>
          }
        ],
        Specializes = "Conv2DBf16",
        Traits = {
          AllowDMAOptimization = true,
          NonNegativeOut = true
        },
        With = {
          config.AIE_API_EMULATE_BFLOAT16_MMUL_WITH_BFP16 = 1 : ui8,
          config.act = 1 : ui8,
          config.act_type = "RELU",
          config.aie_arch = "aie2p",
          config.batch_size = 1 : ui8,
          config.compiler = "peano",
          config.conv_type = [0 : ui8, 12 : ui8, 64 : ui8],
          config.dtype_ifm = "bfloat16",
          config.dtype_ofm = "bfloat16",
          config.dtype_wts = "bfloat16",
          config.enable_bfp16_wts = 0 : ui8,
          config.ksize.height = 1 : ui8,
          config.ksize.width = 1 : ui8,
          config.lrelu_alpha = 0.000000e+00 : f32,
          config.stride_h = 1 : ui8,
          config.stride_w = 1 : ui8
        }} {
        %170 = "tosa.const"() <{value = dense<[0, 3, 1, 2]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc248)
        %171 = "tosa.const"() <{value = dense<[0, 2, 3, 1]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc248)
        %172 = tosa.reshape %arg5 {new_shape = array<i64: 256, 1, 1, 512>} : (tensor<256x512x1x1xbf16>) -> tensor<256x1x1x512xbf16> loc(#loc383)
        %173 = tosa.transpose %arg4, %171 : (tensor<1x512x4x4xbf16>, tensor<4xi32>) -> tensor<1x4x4x512xbf16> loc(#loc383)
        %174 = tosa.conv2d %173, %172, %arg6 {
          PartOfLayerName = "/layer3/layer3.0/conv1/Conv",
          PartOfOutputName = "/layer3/layer3.0/conv1/Conv",
          acc_type = f32,
          dilation = array<i64: 1, 1>,
          pad = array<i64: 0, 0, 0, 0>,
          stride = array<i64: 1, 1>} : (tensor<1x4x4x512xbf16>, tensor<256x1x1x512xbf16>, tensor<256xbf16>) -> tensor<1x4x4x256xbf16> loc(#loc384)
        %175 = tosa.clamp %174 {
          LayerName = "/layer3/layer3.0/relu/Relu",
          OutputName = "/layer3/layer3.0/relu/Relu",
          max_fp = 3.40282347E+38 : f32,
          max_int = 2147483647 : i64,
          min_fp = 0.000000e+00 : f32,
          min_int = 0 : i64} : (tensor<1x4x4x256xbf16>) -> tensor<1x4x4x256xbf16> loc(#loc385)
        %176 = tosa.transpose %175, %170 : (tensor<1x4x4x256xbf16>, tensor<4xi32>) -> tensor<1x256x4x4xbf16> loc(#loc383)
        xten_nn.output %176 : tensor<1x256x4x4xbf16> loc(#loc385)
      } -> tensor<1x256x4x4xbf16> loc(#loc383)
      xten_nn.output %169 : tensor<1x256x4x4xbf16> loc(#loc383)
    } -> tensor<1x256x4x4xbf16> loc(#loc383)
    %136 = xten_nn.subgraph (%arg1 = %135: tensor<1x256x4x4xbf16>, %arg2 = %30: tensor<256x256x3x3xbf16>, %arg3 = %59: tensor<256xbf16>)  attributes {
      IfmOperands = [0 : index],
      LayerName = "/layer3/layer3.0/relu_1/Relu",
      Operands = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 256, 4, 4]> : vector<4xindex>
        },
        {
          UnknownDataFormat = true,
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[256, 256, 3, 3]> : vector<4xindex>
        },
        {
          UnknownDataFormat = true
        }
      ],
      OutputName = "/layer3/layer3.0/conv2/Conv",
      Reason = "InCoreChain",
      Results = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          Name = "/layer3/layer3.0/conv2/Conv_output_0",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 256, 2, 2]> : vector<4xindex>
        }
      ],
      TilingRecipe = {
        "conv-spatial-2d" = false,
        "conv-split-stamps" = true,
        "conv-split-stamps-OC-only" = false,
        "conv-split-stamps-OH-only" = false,
        "convtype-set-by-overlay-heuristic" = false,
        "disable-oh-spatial" = false,
        "disable-ow-spatial" = false,
        "dwc-split-stamps" = false,
        "elt-split-stamps" = true,
        "fm-superiters" = false,
        "icw-superiters" = false,
        "ocw-superiters" = true,
        "ow-superiters" = false,
        "pool-split-stamps" = false,
        "reduce-split-stamps" = false
      },
      logical_mode = "2x_4x4_1x4_vertBroadcastLeft_horizBroadcastRight",
      memory_configuration = {
        L1 = {layout = "strictlegacy"},
        L2 = {ifm_buffering = "single", layout = "flexible", limited_wts_space = false, ofm_buffering = "single", weights_buffering = "double"}
      }} {
      %169 = xten_nn.subgraph (%arg4 = %arg1: tensor<1x256x4x4xbf16>, %arg5 = %arg2: tensor<256x256x3x3xbf16>, %arg6 = %arg3: tensor<256xbf16>)  attributes {
        Dilations = array<i64: 1, 1>,
        HWPadding = [[1, 0], [1, 0]],
        LayerName = "/layer3/layer3.0/relu_1/Relu",
        Operands = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Port = "data_io.ifm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 256, 4, 4]> : vector<4xindex>
          },
          {
            Port = "data_io.wts",
            SubPort = "wts_data",
            UnknownDataFormat = true,
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[256, 256, 3, 3]> : vector<4xindex>
          },
          {
            Port = "data_io.wts",
            SubPort = "bias",
            UnknownDataFormat = true
          }
        ],
        OutputName = "/layer3/layer3.0/conv2/Conv",
        Reason = "MllibKernel",
        Results = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer3/layer3.0/conv2/Conv_output_0",
            Port = "data_io.ofm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 256, 2, 2]> : vector<4xindex>
          }
        ],
        Specializes = "Conv2DBf16",
        Traits = {
          AllowDMAOptimization = true,
          NonNegativeOut = true
        },
        With = {
          config.AIE_API_EMULATE_BFLOAT16_MMUL_WITH_BFP16 = 1 : ui8,
          config.act = 1 : ui8,
          config.act_type = "RELU",
          config.aie_arch = "aie2p",
          config.batch_size = 1 : ui8,
          config.compiler = "peano",
          config.conv_type = [0 : ui8, 12 : ui8, 64 : ui8],
          config.dtype_ifm = "bfloat16",
          config.dtype_ofm = "bfloat16",
          config.dtype_wts = "bfloat16",
          config.enable_bfp16_wts = 0 : ui8,
          config.ksize.height = 3 : ui8,
          config.ksize.width = 3 : ui8,
          config.lrelu_alpha = 0.000000e+00 : f32,
          config.stride_h = 2 : ui8,
          config.stride_w = 2 : ui8
        }} {
        %170 = "tosa.const"() <{value = dense<[0, 3, 1, 2]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc248)
        %171 = "tosa.const"() <{value = dense<[0, 2, 3, 1]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc248)
        %172 = tosa.transpose %arg5, %171 : (tensor<256x256x3x3xbf16>, tensor<4xi32>) -> tensor<256x3x3x256xbf16> loc(#loc386)
        %173 = tosa.transpose %arg4, %171 : (tensor<1x256x4x4xbf16>, tensor<4xi32>) -> tensor<1x4x4x256xbf16> loc(#loc386)
        %174 = tosa.conv2d %173, %172, %arg6 {
          PartOfLayerName = "/layer3/layer3.0/conv2/Conv",
          PartOfOutputName = "/layer3/layer3.0/conv2/Conv",
          acc_type = f32,
          dilation = array<i64: 1, 1>,
          pad = array<i64: 1, 0, 1, 0>,
          stride = array<i64: 2, 2>} : (tensor<1x4x4x256xbf16>, tensor<256x3x3x256xbf16>, tensor<256xbf16>) -> tensor<1x2x2x256xbf16> loc(#loc387)
        %175 = tosa.clamp %174 {
          LayerName = "/layer3/layer3.0/relu_1/Relu",
          OutputName = "/layer3/layer3.0/relu_1/Relu",
          max_fp = 3.40282347E+38 : f32,
          max_int = 2147483647 : i64,
          min_fp = 0.000000e+00 : f32,
          min_int = 0 : i64} : (tensor<1x2x2x256xbf16>) -> tensor<1x2x2x256xbf16> loc(#loc388)
        %176 = tosa.transpose %175, %170 : (tensor<1x2x2x256xbf16>, tensor<4xi32>) -> tensor<1x256x2x2xbf16> loc(#loc386)
        xten_nn.output %176 : tensor<1x256x2x2xbf16> loc(#loc388)
      } -> tensor<1x256x2x2xbf16> loc(#loc386)
      xten_nn.output %169 : tensor<1x256x2x2xbf16> loc(#loc386)
    } -> tensor<1x256x2x2xbf16> loc(#loc386)
    %137 = xten_nn.subgraph (%arg1 = %134: tensor<1x512x4x4xbf16>, %arg2 = %28: tensor<1024x512x1x1xbf16>, %arg3 = %79: tensor<1024xbf16>)  attributes {
      IfmOperands = [0 : index],
      LayerName = "/layer3/layer3.0/downsample/downsample.0/Conv",
      Operands = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          Name = "/layer2/layer2.3/relu_2/Relu_output_0",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 512, 4, 4]> : vector<4xindex>
        },
        {
          Name = "onnx::Conv_582",
          UnknownDataFormat = true,
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1024, 512, 1, 1]> : vector<4xindex>
        },
        {
          Name = "onnx::Conv_583",
          UnknownDataFormat = true
        }
      ],
      OutputName = "/layer3/layer3.0/downsample/downsample.0/Conv",
      Reason = "InCoreChain",
      Results = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          Name = "/layer3/layer3.0/downsample/downsample.0/Conv_output_0",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 1024, 2, 2]> : vector<4xindex>
        }
      ],
      TilingRecipe = {
        "conv-spatial-2d" = false,
        "conv-split-stamps" = true,
        "conv-split-stamps-OC-only" = false,
        "conv-split-stamps-OH-only" = false,
        "convtype-set-by-overlay-heuristic" = false,
        "disable-oh-spatial" = false,
        "disable-ow-spatial" = false,
        "dwc-split-stamps" = false,
        "elt-split-stamps" = true,
        "fm-superiters" = false,
        "icw-superiters" = false,
        "ocw-superiters" = true,
        "ow-superiters" = false,
        "pool-split-stamps" = false,
        "reduce-split-stamps" = false
      },
      logical_mode = "2x_4x4_1x4_vertBroadcastLeft_horizBroadcastRight",
      memory_configuration = {
        L1 = {layout = "strictlegacy"},
        L2 = {ifm_buffering = "single", layout = "flexible", limited_wts_space = false, ofm_buffering = "single", weights_buffering = "double"}
      }} {
      %169 = xten_nn.subgraph (%arg4 = %arg1: tensor<1x512x4x4xbf16>, %arg5 = %arg2: tensor<1024x512x1x1xbf16>, %arg6 = %arg3: tensor<1024xbf16>)  attributes {
        Dilations = array<i64: 1, 1>,
        HWPadding = [[0, 0], [0, 0]],
        LayerName = "/layer3/layer3.0/downsample/downsample.0/Conv",
        Operands = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer2/layer2.3/relu_2/Relu_output_0",
            Port = "data_io.ifm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 512, 4, 4]> : vector<4xindex>
          },
          {
            Name = "onnx::Conv_582",
            Port = "data_io.wts",
            SubPort = "wts_data",
            UnknownDataFormat = true,
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1024, 512, 1, 1]> : vector<4xindex>
          },
          {
            Name = "onnx::Conv_583",
            Port = "data_io.wts",
            SubPort = "bias",
            UnknownDataFormat = true
          }
        ],
        OutputName = "/layer3/layer3.0/downsample/downsample.0/Conv",
        Reason = "MllibKernel",
        Results = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer3/layer3.0/downsample/downsample.0/Conv_output_0",
            Port = "data_io.ofm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 1024, 2, 2]> : vector<4xindex>
          }
        ],
        Specializes = "Conv2DBf16",
        Traits = {
          AllowDMAOptimization = true
        },
        With = {
          config.AIE_API_EMULATE_BFLOAT16_MMUL_WITH_BFP16 = 1 : ui8,
          config.act = 0 : ui8,
          config.act_type = "RELU",
          config.aie_arch = "aie2p",
          config.batch_size = 1 : ui8,
          config.compiler = "peano",
          config.conv_type = [0 : ui8, 12 : ui8, 64 : ui8],
          config.dtype_ifm = "bfloat16",
          config.dtype_ofm = "bfloat16",
          config.dtype_wts = "bfloat16",
          config.enable_bfp16_wts = 0 : ui8,
          config.ksize.height = 1 : ui8,
          config.ksize.width = 1 : ui8,
          config.lrelu_alpha = 1.000000e+00 : f32,
          config.stride_h = 2 : ui8,
          config.stride_w = 2 : ui8
        }} {
        %170 = "tosa.const"() <{value = dense<[0, 2, 3, 1]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc248)
        %171 = "tosa.const"() <{value = dense<[0, 3, 1, 2]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc248)
        %172 = tosa.reshape %arg5 {new_shape = array<i64: 1024, 1, 1, 512>} : (tensor<1024x512x1x1xbf16>) -> tensor<1024x1x1x512xbf16> loc(#loc389)
        %173 = tosa.transpose %arg4, %170 : (tensor<1x512x4x4xbf16>, tensor<4xi32>) -> tensor<1x4x4x512xbf16> loc(#loc389)
        %174 = tosa.slice %173 {
          PartOfLayerName = "/layer3/layer3.0/downsample/downsample.0/Conv",
          size = array<i64: 1, 3, 3, 512>,
          start = array<i64: 0, 0, 0, 0>} : (tensor<1x4x4x512xbf16>) -> tensor<1x3x3x512xbf16> loc(#loc389)
        %175 = tosa.conv2d %174, %172, %arg6 {
          PartOfLayerName = "/layer3/layer3.0/downsample/downsample.0/Conv",
          PartOfOutputName = "/layer3/layer3.0/downsample/downsample.0/Conv",
          acc_type = f32,
          dilation = array<i64: 1, 1>,
          pad = array<i64: 0, 0, 0, 0>,
          stride = array<i64: 2, 2>} : (tensor<1x3x3x512xbf16>, tensor<1024x1x1x512xbf16>, tensor<1024xbf16>) -> tensor<1x2x2x1024xbf16> loc(#loc389)
        %176 = tosa.transpose %175, %171 : (tensor<1x2x2x1024xbf16>, tensor<4xi32>) -> tensor<1x1024x2x2xbf16> loc(#loc389)
        xten_nn.output %176 : tensor<1x1024x2x2xbf16> loc(#loc389)
      } -> tensor<1x1024x2x2xbf16> loc(#loc389)
      xten_nn.output %169 : tensor<1x1024x2x2xbf16> loc(#loc389)
    } -> tensor<1x1024x2x2xbf16> loc(#loc389)
    %138 = xten_nn.subgraph (%arg1 = %136: tensor<1x256x2x2xbf16>, %arg2 = %29: tensor<1024x256x1x1xbf16>, %arg3 = %66: tensor<1024xbf16>, %arg4 = %137: tensor<1x1024x2x2xbf16>)  attributes {
      IfmOperands = [0 : index, 3 : index],
      LayerName = "/layer3/layer3.0/conv3/Conv",
      OfmShare = 3 : index,
      Operands = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          Name = "/layer3/layer3.0/relu_1/Relu_output_0",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 256, 2, 2]> : vector<4xindex>
        },
        {
          Name = "onnx::Conv_579",
          UnknownDataFormat = true,
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1024, 256, 1, 1]> : vector<4xindex>
        },
        {
          Name = "onnx::Conv_580",
          UnknownDataFormat = true
        },
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          Name = "/layer3/layer3.0/Add_output_0",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 1024, 2, 2]> : vector<4xindex>
        }
      ],
      OutputName = "/layer3/layer3.0/Add",
      Reason = "InCoreChain",
      Results = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          Name = "/layer3/layer3.0/Add_output_0",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 1024, 2, 2]> : vector<4xindex>
        }
      ],
      TilingRecipe = {
        "conv-spatial-2d" = false,
        "conv-split-stamps" = true,
        "conv-split-stamps-OC-only" = false,
        "conv-split-stamps-OH-only" = false,
        "convtype-set-by-overlay-heuristic" = false,
        "disable-oh-spatial" = false,
        "disable-ow-spatial" = false,
        "dwc-split-stamps" = false,
        "elt-split-stamps" = true,
        "fm-superiters" = false,
        "icw-superiters" = false,
        "ocw-superiters" = true,
        "ow-superiters" = false,
        "pool-split-stamps" = false,
        "reduce-split-stamps" = false
      },
      logical_mode = "2x_4x4_1x4_vertBroadcastLeft_horizBroadcastRight",
      memory_configuration = {
        L1 = {layout = "strictlegacy"},
        L2 = {ifm_buffering = "single", layout = "flexible", limited_wts_space = false, ofm_buffering = "single", weights_buffering = "double"}
      }} {
      %169 = xten_nn.subgraph (%arg5 = %arg1: tensor<1x256x2x2xbf16>, %arg6 = %arg2: tensor<1024x256x1x1xbf16>, %arg7 = %arg3: tensor<1024xbf16>)  attributes {
        Dilations = array<i64: 1, 1>,
        HWPadding = [[0, 0], [0, 0]],
        LayerName = "/layer3/layer3.0/conv3/Conv",
        Operands = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer3/layer3.0/relu_1/Relu_output_0",
            Port = "data_io.ifm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 256, 2, 2]> : vector<4xindex>
          },
          {
            Name = "onnx::Conv_579",
            Port = "data_io.wts",
            SubPort = "wts_data",
            UnknownDataFormat = true,
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1024, 256, 1, 1]> : vector<4xindex>
          },
          {
            Name = "onnx::Conv_580",
            Port = "data_io.wts",
            SubPort = "bias",
            UnknownDataFormat = true
          }
        ],
        OutputName = "/layer3/layer3.0/conv3/Conv",
        Reason = "MllibKernel",
        Results = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer3/layer3.0/conv3/Conv_output_0",
            Port = "data_io.ofm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 1024, 2, 2]> : vector<4xindex>
          }
        ],
        Specializes = "Conv2DBf16",
        Traits = {
          AllowDMAOptimization = true
        },
        With = {
          config.AIE_API_EMULATE_BFLOAT16_MMUL_WITH_BFP16 = 1 : ui8,
          config.act = 0 : ui8,
          config.act_type = "RELU",
          config.aie_arch = "aie2p",
          config.batch_size = 1 : ui8,
          config.compiler = "peano",
          config.conv_type = [0 : ui8, 12 : ui8, 64 : ui8],
          config.dtype_ifm = "bfloat16",
          config.dtype_ofm = "bfloat16",
          config.dtype_wts = "bfloat16",
          config.enable_bfp16_wts = 0 : ui8,
          config.ksize.height = 1 : ui8,
          config.ksize.width = 1 : ui8,
          config.lrelu_alpha = 1.000000e+00 : f32,
          config.stride_h = 1 : ui8,
          config.stride_w = 1 : ui8
        }} {
        %171 = "tosa.const"() <{value = dense<[0, 3, 1, 2]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc248)
        %172 = "tosa.const"() <{value = dense<[0, 2, 3, 1]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc248)
        %173 = tosa.reshape %arg6 {new_shape = array<i64: 1024, 1, 1, 256>} : (tensor<1024x256x1x1xbf16>) -> tensor<1024x1x1x256xbf16> loc(#loc391)
        %174 = tosa.transpose %arg5, %172 : (tensor<1x256x2x2xbf16>, tensor<4xi32>) -> tensor<1x2x2x256xbf16> loc(#loc391)
        %175 = tosa.conv2d %174, %173, %arg7 {
          PartOfLayerName = "/layer3/layer3.0/conv3/Conv",
          PartOfOutputName = "/layer3/layer3.0/conv3/Conv",
          acc_type = f32,
          dilation = array<i64: 1, 1>,
          pad = array<i64: 0, 0, 0, 0>,
          stride = array<i64: 1, 1>} : (tensor<1x2x2x256xbf16>, tensor<1024x1x1x256xbf16>, tensor<1024xbf16>) -> tensor<1x2x2x1024xbf16> loc(#loc391)
        %176 = tosa.transpose %175, %171 : (tensor<1x2x2x1024xbf16>, tensor<4xi32>) -> tensor<1x1024x2x2xbf16> loc(#loc391)
        xten_nn.output %176 : tensor<1x1024x2x2xbf16> loc(#loc391)
      } -> tensor<1x1024x2x2xbf16> loc(#loc391)
      %170 = xten_nn.subgraph (%arg5 = %169: tensor<1x1024x2x2xbf16>, %arg6 = %arg4: tensor<1x1024x2x2xbf16>)  attributes {
        LayerName = "/layer3/layer3.0/relu_2/Relu",
        Operands = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer3/layer3.0/Add_output_0",
            Port = "data_io.ifm1",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 1024, 2, 2]> : vector<4xindex>
          },
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer3/layer3.0/Add_output_0",
            Port = "data_io.ifm2",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 1024, 2, 2]> : vector<4xindex>
          }
        ],
        OutputName = "/layer3/layer3.0/Add",
        Reason = "MllibKernel",
        Results = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer3/layer3.0/Add_output_0",
            Port = "data_io.ofm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 1024, 2, 2]> : vector<4xindex>
          }
        ],
        Specializes = "AddBf16",
        Traits = {
          Binary = true,
          Elementwise = true,
          NonNegativeOut = true
        },
        With = {
          config.act = 1 : ui8,
          config.act_type = "RELU",
          config.aie_arch = "aie2p",
          config.compiler = "peano",
          config.dtype = "bfloat16"
        }} {
        %171 = tosa.add %arg5, %arg6 {LayerName = "/layer3/layer3.0/Add", OutputName = "/layer3/layer3.0/Add"} : (tensor<1x1024x2x2xbf16>, tensor<1x1024x2x2xbf16>) -> tensor<1x1024x2x2xbf16> loc(#loc393)
        %172 = tosa.clamp %171 {
          LayerName = "/layer3/layer3.0/relu_2/Relu",
          OutputName = "/layer3/layer3.0/relu_2/Relu",
          max_fp = 3.40282347E+38 : f32,
          max_int = 2147483647 : i64,
          min_fp = 0.000000e+00 : f32,
          min_int = 0 : i64} : (tensor<1x1024x2x2xbf16>) -> tensor<1x1024x2x2xbf16> loc(#loc394)
        xten_nn.output %172 : tensor<1x1024x2x2xbf16> loc(#loc394)
      } -> tensor<1x1024x2x2xbf16> loc(#loc392)
      xten_nn.output %170 : tensor<1x1024x2x2xbf16> loc(#loc392)
    } -> tensor<1x1024x2x2xbf16> loc(#loc390)
    %139 = xten_nn.subgraph (%arg1 = %138: tensor<1x1024x2x2xbf16>, %arg2 = %27: tensor<256x1024x1x1xbf16>, %arg3 = %86: tensor<256xbf16>)  attributes {
      IfmOperands = [0 : index],
      LayerName = "/layer3/layer3.1/relu/Relu",
      Operands = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 1024, 2, 2]> : vector<4xindex>
        },
        {
          UnknownDataFormat = true,
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[256, 1024, 1, 1]> : vector<4xindex>
        },
        {
          UnknownDataFormat = true
        }
      ],
      OutputName = "/layer3/layer3.1/conv1/Conv",
      Reason = "InCoreChain",
      Results = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          Name = "/layer3/layer3.1/conv1/Conv_output_0",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 256, 2, 2]> : vector<4xindex>
        }
      ],
      TilingRecipe = {
        "conv-spatial-2d" = false,
        "conv-split-stamps" = true,
        "conv-split-stamps-OC-only" = false,
        "conv-split-stamps-OH-only" = false,
        "convtype-set-by-overlay-heuristic" = false,
        "disable-oh-spatial" = false,
        "disable-ow-spatial" = false,
        "dwc-split-stamps" = false,
        "elt-split-stamps" = true,
        "fm-superiters" = false,
        "icw-superiters" = false,
        "ocw-superiters" = true,
        "ow-superiters" = false,
        "pool-split-stamps" = false,
        "reduce-split-stamps" = false
      },
      logical_mode = "2x_4x4_1x4_vertBroadcastLeft_horizBroadcastRight",
      memory_configuration = {
        L1 = {layout = "strictlegacy"},
        L2 = {ifm_buffering = "single", layout = "flexible", limited_wts_space = false, ofm_buffering = "single", weights_buffering = "double"}
      }} {
      %169 = xten_nn.subgraph (%arg4 = %arg1: tensor<1x1024x2x2xbf16>, %arg5 = %arg2: tensor<256x1024x1x1xbf16>, %arg6 = %arg3: tensor<256xbf16>)  attributes {
        Dilations = array<i64: 1, 1>,
        HWPadding = [[0, 0], [0, 0]],
        LayerName = "/layer3/layer3.1/relu/Relu",
        Operands = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Port = "data_io.ifm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 1024, 2, 2]> : vector<4xindex>
          },
          {
            Port = "data_io.wts",
            SubPort = "wts_data",
            UnknownDataFormat = true,
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[256, 1024, 1, 1]> : vector<4xindex>
          },
          {
            Port = "data_io.wts",
            SubPort = "bias",
            UnknownDataFormat = true
          }
        ],
        OutputName = "/layer3/layer3.1/conv1/Conv",
        Reason = "MllibKernel",
        Results = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer3/layer3.1/conv1/Conv_output_0",
            Port = "data_io.ofm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 256, 2, 2]> : vector<4xindex>
          }
        ],
        Specializes = "Conv2DBf16",
        Traits = {
          AllowDMAOptimization = true,
          NonNegativeOut = true
        },
        With = {
          config.AIE_API_EMULATE_BFLOAT16_MMUL_WITH_BFP16 = 1 : ui8,
          config.act = 1 : ui8,
          config.act_type = "RELU",
          config.aie_arch = "aie2p",
          config.batch_size = 1 : ui8,
          config.compiler = "peano",
          config.conv_type = [0 : ui8, 12 : ui8, 64 : ui8],
          config.dtype_ifm = "bfloat16",
          config.dtype_ofm = "bfloat16",
          config.dtype_wts = "bfloat16",
          config.enable_bfp16_wts = 0 : ui8,
          config.ksize.height = 1 : ui8,
          config.ksize.width = 1 : ui8,
          config.lrelu_alpha = 0.000000e+00 : f32,
          config.stride_h = 1 : ui8,
          config.stride_w = 1 : ui8
        }} {
        %170 = "tosa.const"() <{value = dense<[0, 3, 1, 2]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc248)
        %171 = "tosa.const"() <{value = dense<[0, 2, 3, 1]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc248)
        %172 = tosa.reshape %arg5 {new_shape = array<i64: 256, 1, 1, 1024>} : (tensor<256x1024x1x1xbf16>) -> tensor<256x1x1x1024xbf16> loc(#loc395)
        %173 = tosa.transpose %arg4, %171 : (tensor<1x1024x2x2xbf16>, tensor<4xi32>) -> tensor<1x2x2x1024xbf16> loc(#loc395)
        %174 = tosa.conv2d %173, %172, %arg6 {
          PartOfLayerName = "/layer3/layer3.1/conv1/Conv",
          PartOfOutputName = "/layer3/layer3.1/conv1/Conv",
          acc_type = f32,
          dilation = array<i64: 1, 1>,
          pad = array<i64: 0, 0, 0, 0>,
          stride = array<i64: 1, 1>} : (tensor<1x2x2x1024xbf16>, tensor<256x1x1x1024xbf16>, tensor<256xbf16>) -> tensor<1x2x2x256xbf16> loc(#loc396)
        %175 = tosa.clamp %174 {
          LayerName = "/layer3/layer3.1/relu/Relu",
          OutputName = "/layer3/layer3.1/relu/Relu",
          max_fp = 3.40282347E+38 : f32,
          max_int = 2147483647 : i64,
          min_fp = 0.000000e+00 : f32,
          min_int = 0 : i64} : (tensor<1x2x2x256xbf16>) -> tensor<1x2x2x256xbf16> loc(#loc397)
        %176 = tosa.transpose %175, %170 : (tensor<1x2x2x256xbf16>, tensor<4xi32>) -> tensor<1x256x2x2xbf16> loc(#loc395)
        xten_nn.output %176 : tensor<1x256x2x2xbf16> loc(#loc397)
      } -> tensor<1x256x2x2xbf16> loc(#loc395)
      xten_nn.output %169 : tensor<1x256x2x2xbf16> loc(#loc395)
    } -> tensor<1x256x2x2xbf16> loc(#loc395)
    %140 = xten_nn.subgraph (%arg1 = %139: tensor<1x256x2x2xbf16>, %arg2 = %26: tensor<256x256x3x3xbf16>, %arg3 = %71: tensor<256xbf16>)  attributes {
      IfmOperands = [0 : index],
      LayerName = "/layer3/layer3.1/relu_1/Relu",
      Operands = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 256, 2, 2]> : vector<4xindex>
        },
        {
          UnknownDataFormat = true,
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[256, 256, 3, 3]> : vector<4xindex>
        },
        {
          UnknownDataFormat = true
        }
      ],
      OutputName = "/layer3/layer3.1/conv2/Conv",
      Reason = "InCoreChain",
      Results = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          Name = "/layer3/layer3.1/conv2/Conv_output_0",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 256, 2, 2]> : vector<4xindex>
        }
      ],
      TilingRecipe = {
        "conv-spatial-2d" = false,
        "conv-split-stamps" = true,
        "conv-split-stamps-OC-only" = false,
        "conv-split-stamps-OH-only" = false,
        "convtype-set-by-overlay-heuristic" = false,
        "disable-oh-spatial" = false,
        "disable-ow-spatial" = false,
        "dwc-split-stamps" = false,
        "elt-split-stamps" = true,
        "fm-superiters" = false,
        "icw-superiters" = false,
        "ocw-superiters" = true,
        "ow-superiters" = false,
        "pool-split-stamps" = false,
        "reduce-split-stamps" = false
      },
      logical_mode = "2x_4x4_1x4_vertBroadcastLeft_horizBroadcastRight",
      memory_configuration = {
        L1 = {layout = "strictlegacy"},
        L2 = {ifm_buffering = "single", layout = "flexible", limited_wts_space = false, ofm_buffering = "single", weights_buffering = "double"}
      }} {
      %169 = xten_nn.subgraph (%arg4 = %arg1: tensor<1x256x2x2xbf16>, %arg5 = %arg2: tensor<256x256x3x3xbf16>, %arg6 = %arg3: tensor<256xbf16>)  attributes {
        Dilations = array<i64: 1, 1>,
        HWPadding = [[1, 1], [1, 1]],
        LayerName = "/layer3/layer3.1/relu_1/Relu",
        Operands = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Port = "data_io.ifm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 256, 2, 2]> : vector<4xindex>
          },
          {
            Port = "data_io.wts",
            SubPort = "wts_data",
            UnknownDataFormat = true,
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[256, 256, 3, 3]> : vector<4xindex>
          },
          {
            Port = "data_io.wts",
            SubPort = "bias",
            UnknownDataFormat = true
          }
        ],
        OutputName = "/layer3/layer3.1/conv2/Conv",
        Reason = "MllibKernel",
        Results = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer3/layer3.1/conv2/Conv_output_0",
            Port = "data_io.ofm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 256, 2, 2]> : vector<4xindex>
          }
        ],
        Specializes = "Conv2DBf16",
        Traits = {
          AllowDMAOptimization = true,
          NonNegativeOut = true
        },
        With = {
          config.AIE_API_EMULATE_BFLOAT16_MMUL_WITH_BFP16 = 1 : ui8,
          config.act = 1 : ui8,
          config.act_type = "RELU",
          config.aie_arch = "aie2p",
          config.batch_size = 1 : ui8,
          config.compiler = "peano",
          config.conv_type = [0 : ui8, 12 : ui8, 64 : ui8],
          config.dtype_ifm = "bfloat16",
          config.dtype_ofm = "bfloat16",
          config.dtype_wts = "bfloat16",
          config.enable_bfp16_wts = 0 : ui8,
          config.ksize.height = 3 : ui8,
          config.ksize.width = 3 : ui8,
          config.lrelu_alpha = 0.000000e+00 : f32,
          config.stride_h = 1 : ui8,
          config.stride_w = 1 : ui8
        }} {
        %170 = "tosa.const"() <{value = dense<[0, 3, 1, 2]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc248)
        %171 = "tosa.const"() <{value = dense<[0, 2, 3, 1]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc248)
        %172 = tosa.transpose %arg5, %171 : (tensor<256x256x3x3xbf16>, tensor<4xi32>) -> tensor<256x3x3x256xbf16> loc(#loc398)
        %173 = tosa.transpose %arg4, %171 : (tensor<1x256x2x2xbf16>, tensor<4xi32>) -> tensor<1x2x2x256xbf16> loc(#loc398)
        %174 = tosa.conv2d %173, %172, %arg6 {
          PartOfLayerName = "/layer3/layer3.1/conv2/Conv",
          PartOfOutputName = "/layer3/layer3.1/conv2/Conv",
          acc_type = f32,
          dilation = array<i64: 1, 1>,
          pad = array<i64: 1, 1, 1, 1>,
          stride = array<i64: 1, 1>} : (tensor<1x2x2x256xbf16>, tensor<256x3x3x256xbf16>, tensor<256xbf16>) -> tensor<1x2x2x256xbf16> loc(#loc399)
        %175 = tosa.clamp %174 {
          LayerName = "/layer3/layer3.1/relu_1/Relu",
          OutputName = "/layer3/layer3.1/relu_1/Relu",
          max_fp = 3.40282347E+38 : f32,
          max_int = 2147483647 : i64,
          min_fp = 0.000000e+00 : f32,
          min_int = 0 : i64} : (tensor<1x2x2x256xbf16>) -> tensor<1x2x2x256xbf16> loc(#loc400)
        %176 = tosa.transpose %175, %170 : (tensor<1x2x2x256xbf16>, tensor<4xi32>) -> tensor<1x256x2x2xbf16> loc(#loc398)
        xten_nn.output %176 : tensor<1x256x2x2xbf16> loc(#loc400)
      } -> tensor<1x256x2x2xbf16> loc(#loc398)
      xten_nn.output %169 : tensor<1x256x2x2xbf16> loc(#loc398)
    } -> tensor<1x256x2x2xbf16> loc(#loc398)
    %141 = xten_nn.subgraph (%arg1 = %140: tensor<1x256x2x2xbf16>, %arg2 = %25: tensor<1024x256x1x1xbf16>, %arg3 = %61: tensor<1024xbf16>, %arg4 = %138: tensor<1x1024x2x2xbf16>)  attributes {
      IfmOperands = [0 : index, 3 : index],
      LayerName = "/layer3/layer3.1/conv3/Conv",
      OfmShare = 3 : index,
      Operands = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          Name = "/layer3/layer3.1/relu_1/Relu_output_0",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 256, 2, 2]> : vector<4xindex>
        },
        {
          Name = "onnx::Conv_591",
          UnknownDataFormat = true,
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1024, 256, 1, 1]> : vector<4xindex>
        },
        {
          Name = "onnx::Conv_592",
          UnknownDataFormat = true
        },
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          Name = "/layer3/layer3.1/Add_output_0",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 1024, 2, 2]> : vector<4xindex>
        }
      ],
      OutputName = "/layer3/layer3.1/Add",
      Reason = "InCoreChain",
      Results = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          Name = "/layer3/layer3.1/Add_output_0",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 1024, 2, 2]> : vector<4xindex>
        }
      ],
      TilingRecipe = {
        "conv-spatial-2d" = false,
        "conv-split-stamps" = true,
        "conv-split-stamps-OC-only" = false,
        "conv-split-stamps-OH-only" = false,
        "convtype-set-by-overlay-heuristic" = false,
        "disable-oh-spatial" = false,
        "disable-ow-spatial" = false,
        "dwc-split-stamps" = false,
        "elt-split-stamps" = true,
        "fm-superiters" = false,
        "icw-superiters" = false,
        "ocw-superiters" = true,
        "ow-superiters" = false,
        "pool-split-stamps" = false,
        "reduce-split-stamps" = false
      },
      logical_mode = "2x_4x4_1x4_vertBroadcastLeft_horizBroadcastRight",
      memory_configuration = {
        L1 = {layout = "strictlegacy"},
        L2 = {ifm_buffering = "single", layout = "flexible", limited_wts_space = false, ofm_buffering = "single", weights_buffering = "double"}
      }} {
      %169 = xten_nn.subgraph (%arg5 = %arg1: tensor<1x256x2x2xbf16>, %arg6 = %arg2: tensor<1024x256x1x1xbf16>, %arg7 = %arg3: tensor<1024xbf16>)  attributes {
        Dilations = array<i64: 1, 1>,
        HWPadding = [[0, 0], [0, 0]],
        LayerName = "/layer3/layer3.1/conv3/Conv",
        Operands = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer3/layer3.1/relu_1/Relu_output_0",
            Port = "data_io.ifm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 256, 2, 2]> : vector<4xindex>
          },
          {
            Name = "onnx::Conv_591",
            Port = "data_io.wts",
            SubPort = "wts_data",
            UnknownDataFormat = true,
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1024, 256, 1, 1]> : vector<4xindex>
          },
          {
            Name = "onnx::Conv_592",
            Port = "data_io.wts",
            SubPort = "bias",
            UnknownDataFormat = true
          }
        ],
        OutputName = "/layer3/layer3.1/conv3/Conv",
        Reason = "MllibKernel",
        Results = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer3/layer3.1/conv3/Conv_output_0",
            Port = "data_io.ofm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 1024, 2, 2]> : vector<4xindex>
          }
        ],
        Specializes = "Conv2DBf16",
        Traits = {
          AllowDMAOptimization = true
        },
        With = {
          config.AIE_API_EMULATE_BFLOAT16_MMUL_WITH_BFP16 = 1 : ui8,
          config.act = 0 : ui8,
          config.act_type = "RELU",
          config.aie_arch = "aie2p",
          config.batch_size = 1 : ui8,
          config.compiler = "peano",
          config.conv_type = [0 : ui8, 12 : ui8, 64 : ui8],
          config.dtype_ifm = "bfloat16",
          config.dtype_ofm = "bfloat16",
          config.dtype_wts = "bfloat16",
          config.enable_bfp16_wts = 0 : ui8,
          config.ksize.height = 1 : ui8,
          config.ksize.width = 1 : ui8,
          config.lrelu_alpha = 1.000000e+00 : f32,
          config.stride_h = 1 : ui8,
          config.stride_w = 1 : ui8
        }} {
        %171 = "tosa.const"() <{value = dense<[0, 3, 1, 2]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc248)
        %172 = "tosa.const"() <{value = dense<[0, 2, 3, 1]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc248)
        %173 = tosa.reshape %arg6 {new_shape = array<i64: 1024, 1, 1, 256>} : (tensor<1024x256x1x1xbf16>) -> tensor<1024x1x1x256xbf16> loc(#loc402)
        %174 = tosa.transpose %arg5, %172 : (tensor<1x256x2x2xbf16>, tensor<4xi32>) -> tensor<1x2x2x256xbf16> loc(#loc402)
        %175 = tosa.conv2d %174, %173, %arg7 {
          PartOfLayerName = "/layer3/layer3.1/conv3/Conv",
          PartOfOutputName = "/layer3/layer3.1/conv3/Conv",
          acc_type = f32,
          dilation = array<i64: 1, 1>,
          pad = array<i64: 0, 0, 0, 0>,
          stride = array<i64: 1, 1>} : (tensor<1x2x2x256xbf16>, tensor<1024x1x1x256xbf16>, tensor<1024xbf16>) -> tensor<1x2x2x1024xbf16> loc(#loc402)
        %176 = tosa.transpose %175, %171 : (tensor<1x2x2x1024xbf16>, tensor<4xi32>) -> tensor<1x1024x2x2xbf16> loc(#loc402)
        xten_nn.output %176 : tensor<1x1024x2x2xbf16> loc(#loc402)
      } -> tensor<1x1024x2x2xbf16> loc(#loc402)
      %170 = xten_nn.subgraph (%arg5 = %169: tensor<1x1024x2x2xbf16>, %arg6 = %arg4: tensor<1x1024x2x2xbf16>)  attributes {
        LayerName = "/layer3/layer3.1/relu_2/Relu",
        Operands = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer3/layer3.1/Add_output_0",
            Port = "data_io.ifm1",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 1024, 2, 2]> : vector<4xindex>
          },
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer3/layer3.1/Add_output_0",
            Port = "data_io.ifm2",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 1024, 2, 2]> : vector<4xindex>
          }
        ],
        OutputName = "/layer3/layer3.1/Add",
        Reason = "MllibKernel",
        Results = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer3/layer3.1/Add_output_0",
            Port = "data_io.ofm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 1024, 2, 2]> : vector<4xindex>
          }
        ],
        Specializes = "AddBf16",
        Traits = {
          Binary = true,
          Elementwise = true,
          NonNegativeOut = true
        },
        With = {
          config.act = 1 : ui8,
          config.act_type = "RELU",
          config.aie_arch = "aie2p",
          config.compiler = "peano",
          config.dtype = "bfloat16"
        }} {
        %171 = tosa.add %arg5, %arg6 {LayerName = "/layer3/layer3.1/Add", OutputName = "/layer3/layer3.1/Add"} : (tensor<1x1024x2x2xbf16>, tensor<1x1024x2x2xbf16>) -> tensor<1x1024x2x2xbf16> loc(#loc404)
        %172 = tosa.clamp %171 {
          LayerName = "/layer3/layer3.1/relu_2/Relu",
          OutputName = "/layer3/layer3.1/relu_2/Relu",
          max_fp = 3.40282347E+38 : f32,
          max_int = 2147483647 : i64,
          min_fp = 0.000000e+00 : f32,
          min_int = 0 : i64} : (tensor<1x1024x2x2xbf16>) -> tensor<1x1024x2x2xbf16> loc(#loc405)
        xten_nn.output %172 : tensor<1x1024x2x2xbf16> loc(#loc405)
      } -> tensor<1x1024x2x2xbf16> loc(#loc403)
      xten_nn.output %170 : tensor<1x1024x2x2xbf16> loc(#loc403)
    } -> tensor<1x1024x2x2xbf16> loc(#loc401)
    %142 = xten_nn.subgraph (%arg1 = %141: tensor<1x1024x2x2xbf16>, %arg2 = %24: tensor<256x1024x1x1xbf16>, %arg3 = %82: tensor<256xbf16>)  attributes {
      IfmOperands = [0 : index],
      LayerName = "/layer3/layer3.2/relu/Relu",
      Operands = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 1024, 2, 2]> : vector<4xindex>
        },
        {
          UnknownDataFormat = true,
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[256, 1024, 1, 1]> : vector<4xindex>
        },
        {
          UnknownDataFormat = true
        }
      ],
      OutputName = "/layer3/layer3.2/conv1/Conv",
      Reason = "InCoreChain",
      Results = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          Name = "/layer3/layer3.2/conv1/Conv_output_0",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 256, 2, 2]> : vector<4xindex>
        }
      ],
      TilingRecipe = {
        "conv-spatial-2d" = false,
        "conv-split-stamps" = true,
        "conv-split-stamps-OC-only" = false,
        "conv-split-stamps-OH-only" = false,
        "convtype-set-by-overlay-heuristic" = false,
        "disable-oh-spatial" = false,
        "disable-ow-spatial" = false,
        "dwc-split-stamps" = false,
        "elt-split-stamps" = true,
        "fm-superiters" = false,
        "icw-superiters" = false,
        "ocw-superiters" = true,
        "ow-superiters" = false,
        "pool-split-stamps" = false,
        "reduce-split-stamps" = false
      },
      logical_mode = "2x_4x4_1x4_vertBroadcastLeft_horizBroadcastRight",
      memory_configuration = {
        L1 = {layout = "strictlegacy"},
        L2 = {ifm_buffering = "single", layout = "flexible", limited_wts_space = false, ofm_buffering = "single", weights_buffering = "double"}
      }} {
      %169 = xten_nn.subgraph (%arg4 = %arg1: tensor<1x1024x2x2xbf16>, %arg5 = %arg2: tensor<256x1024x1x1xbf16>, %arg6 = %arg3: tensor<256xbf16>)  attributes {
        Dilations = array<i64: 1, 1>,
        HWPadding = [[0, 0], [0, 0]],
        LayerName = "/layer3/layer3.2/relu/Relu",
        Operands = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Port = "data_io.ifm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 1024, 2, 2]> : vector<4xindex>
          },
          {
            Port = "data_io.wts",
            SubPort = "wts_data",
            UnknownDataFormat = true,
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[256, 1024, 1, 1]> : vector<4xindex>
          },
          {
            Port = "data_io.wts",
            SubPort = "bias",
            UnknownDataFormat = true
          }
        ],
        OutputName = "/layer3/layer3.2/conv1/Conv",
        Reason = "MllibKernel",
        Results = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer3/layer3.2/conv1/Conv_output_0",
            Port = "data_io.ofm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 256, 2, 2]> : vector<4xindex>
          }
        ],
        Specializes = "Conv2DBf16",
        Traits = {
          AllowDMAOptimization = true,
          NonNegativeOut = true
        },
        With = {
          config.AIE_API_EMULATE_BFLOAT16_MMUL_WITH_BFP16 = 1 : ui8,
          config.act = 1 : ui8,
          config.act_type = "RELU",
          config.aie_arch = "aie2p",
          config.batch_size = 1 : ui8,
          config.compiler = "peano",
          config.conv_type = [0 : ui8, 12 : ui8, 64 : ui8],
          config.dtype_ifm = "bfloat16",
          config.dtype_ofm = "bfloat16",
          config.dtype_wts = "bfloat16",
          config.enable_bfp16_wts = 0 : ui8,
          config.ksize.height = 1 : ui8,
          config.ksize.width = 1 : ui8,
          config.lrelu_alpha = 0.000000e+00 : f32,
          config.stride_h = 1 : ui8,
          config.stride_w = 1 : ui8
        }} {
        %170 = "tosa.const"() <{value = dense<[0, 3, 1, 2]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc248)
        %171 = "tosa.const"() <{value = dense<[0, 2, 3, 1]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc248)
        %172 = tosa.reshape %arg5 {new_shape = array<i64: 256, 1, 1, 1024>} : (tensor<256x1024x1x1xbf16>) -> tensor<256x1x1x1024xbf16> loc(#loc406)
        %173 = tosa.transpose %arg4, %171 : (tensor<1x1024x2x2xbf16>, tensor<4xi32>) -> tensor<1x2x2x1024xbf16> loc(#loc406)
        %174 = tosa.conv2d %173, %172, %arg6 {
          PartOfLayerName = "/layer3/layer3.2/conv1/Conv",
          PartOfOutputName = "/layer3/layer3.2/conv1/Conv",
          acc_type = f32,
          dilation = array<i64: 1, 1>,
          pad = array<i64: 0, 0, 0, 0>,
          stride = array<i64: 1, 1>} : (tensor<1x2x2x1024xbf16>, tensor<256x1x1x1024xbf16>, tensor<256xbf16>) -> tensor<1x2x2x256xbf16> loc(#loc407)
        %175 = tosa.clamp %174 {
          LayerName = "/layer3/layer3.2/relu/Relu",
          OutputName = "/layer3/layer3.2/relu/Relu",
          max_fp = 3.40282347E+38 : f32,
          max_int = 2147483647 : i64,
          min_fp = 0.000000e+00 : f32,
          min_int = 0 : i64} : (tensor<1x2x2x256xbf16>) -> tensor<1x2x2x256xbf16> loc(#loc408)
        %176 = tosa.transpose %175, %170 : (tensor<1x2x2x256xbf16>, tensor<4xi32>) -> tensor<1x256x2x2xbf16> loc(#loc406)
        xten_nn.output %176 : tensor<1x256x2x2xbf16> loc(#loc408)
      } -> tensor<1x256x2x2xbf16> loc(#loc406)
      xten_nn.output %169 : tensor<1x256x2x2xbf16> loc(#loc406)
    } -> tensor<1x256x2x2xbf16> loc(#loc406)
    %143 = xten_nn.subgraph (%arg1 = %142: tensor<1x256x2x2xbf16>, %arg2 = %23: tensor<256x256x3x3xbf16>, %arg3 = %74: tensor<256xbf16>)  attributes {
      IfmOperands = [0 : index],
      LayerName = "/layer3/layer3.2/relu_1/Relu",
      Operands = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 256, 2, 2]> : vector<4xindex>
        },
        {
          UnknownDataFormat = true,
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[256, 256, 3, 3]> : vector<4xindex>
        },
        {
          UnknownDataFormat = true
        }
      ],
      OutputName = "/layer3/layer3.2/conv2/Conv",
      Reason = "InCoreChain",
      Results = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          Name = "/layer3/layer3.2/conv2/Conv_output_0",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 256, 2, 2]> : vector<4xindex>
        }
      ],
      TilingRecipe = {
        "conv-spatial-2d" = false,
        "conv-split-stamps" = true,
        "conv-split-stamps-OC-only" = false,
        "conv-split-stamps-OH-only" = false,
        "convtype-set-by-overlay-heuristic" = false,
        "disable-oh-spatial" = false,
        "disable-ow-spatial" = false,
        "dwc-split-stamps" = false,
        "elt-split-stamps" = true,
        "fm-superiters" = false,
        "icw-superiters" = false,
        "ocw-superiters" = true,
        "ow-superiters" = false,
        "pool-split-stamps" = false,
        "reduce-split-stamps" = false
      },
      logical_mode = "2x_4x4_1x4_vertBroadcastLeft_horizBroadcastRight",
      memory_configuration = {
        L1 = {layout = "strictlegacy"},
        L2 = {ifm_buffering = "single", layout = "flexible", limited_wts_space = false, ofm_buffering = "single", weights_buffering = "double"}
      }} {
      %169 = xten_nn.subgraph (%arg4 = %arg1: tensor<1x256x2x2xbf16>, %arg5 = %arg2: tensor<256x256x3x3xbf16>, %arg6 = %arg3: tensor<256xbf16>)  attributes {
        Dilations = array<i64: 1, 1>,
        HWPadding = [[1, 1], [1, 1]],
        LayerName = "/layer3/layer3.2/relu_1/Relu",
        Operands = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Port = "data_io.ifm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 256, 2, 2]> : vector<4xindex>
          },
          {
            Port = "data_io.wts",
            SubPort = "wts_data",
            UnknownDataFormat = true,
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[256, 256, 3, 3]> : vector<4xindex>
          },
          {
            Port = "data_io.wts",
            SubPort = "bias",
            UnknownDataFormat = true
          }
        ],
        OutputName = "/layer3/layer3.2/conv2/Conv",
        Reason = "MllibKernel",
        Results = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer3/layer3.2/conv2/Conv_output_0",
            Port = "data_io.ofm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 256, 2, 2]> : vector<4xindex>
          }
        ],
        Specializes = "Conv2DBf16",
        Traits = {
          AllowDMAOptimization = true,
          NonNegativeOut = true
        },
        With = {
          config.AIE_API_EMULATE_BFLOAT16_MMUL_WITH_BFP16 = 1 : ui8,
          config.act = 1 : ui8,
          config.act_type = "RELU",
          config.aie_arch = "aie2p",
          config.batch_size = 1 : ui8,
          config.compiler = "peano",
          config.conv_type = [0 : ui8, 12 : ui8, 64 : ui8],
          config.dtype_ifm = "bfloat16",
          config.dtype_ofm = "bfloat16",
          config.dtype_wts = "bfloat16",
          config.enable_bfp16_wts = 0 : ui8,
          config.ksize.height = 3 : ui8,
          config.ksize.width = 3 : ui8,
          config.lrelu_alpha = 0.000000e+00 : f32,
          config.stride_h = 1 : ui8,
          config.stride_w = 1 : ui8
        }} {
        %170 = "tosa.const"() <{value = dense<[0, 3, 1, 2]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc248)
        %171 = "tosa.const"() <{value = dense<[0, 2, 3, 1]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc248)
        %172 = tosa.transpose %arg5, %171 : (tensor<256x256x3x3xbf16>, tensor<4xi32>) -> tensor<256x3x3x256xbf16> loc(#loc409)
        %173 = tosa.transpose %arg4, %171 : (tensor<1x256x2x2xbf16>, tensor<4xi32>) -> tensor<1x2x2x256xbf16> loc(#loc409)
        %174 = tosa.conv2d %173, %172, %arg6 {
          PartOfLayerName = "/layer3/layer3.2/conv2/Conv",
          PartOfOutputName = "/layer3/layer3.2/conv2/Conv",
          acc_type = f32,
          dilation = array<i64: 1, 1>,
          pad = array<i64: 1, 1, 1, 1>,
          stride = array<i64: 1, 1>} : (tensor<1x2x2x256xbf16>, tensor<256x3x3x256xbf16>, tensor<256xbf16>) -> tensor<1x2x2x256xbf16> loc(#loc410)
        %175 = tosa.clamp %174 {
          LayerName = "/layer3/layer3.2/relu_1/Relu",
          OutputName = "/layer3/layer3.2/relu_1/Relu",
          max_fp = 3.40282347E+38 : f32,
          max_int = 2147483647 : i64,
          min_fp = 0.000000e+00 : f32,
          min_int = 0 : i64} : (tensor<1x2x2x256xbf16>) -> tensor<1x2x2x256xbf16> loc(#loc411)
        %176 = tosa.transpose %175, %170 : (tensor<1x2x2x256xbf16>, tensor<4xi32>) -> tensor<1x256x2x2xbf16> loc(#loc409)
        xten_nn.output %176 : tensor<1x256x2x2xbf16> loc(#loc411)
      } -> tensor<1x256x2x2xbf16> loc(#loc409)
      xten_nn.output %169 : tensor<1x256x2x2xbf16> loc(#loc409)
    } -> tensor<1x256x2x2xbf16> loc(#loc409)
    %144 = xten_nn.subgraph (%arg1 = %143: tensor<1x256x2x2xbf16>, %arg2 = %22: tensor<1024x256x1x1xbf16>, %arg3 = %94: tensor<1024xbf16>, %arg4 = %141: tensor<1x1024x2x2xbf16>)  attributes {
      IfmOperands = [0 : index, 3 : index],
      LayerName = "/layer3/layer3.2/conv3/Conv",
      OfmShare = 3 : index,
      Operands = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          Name = "/layer3/layer3.2/relu_1/Relu_output_0",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 256, 2, 2]> : vector<4xindex>
        },
        {
          Name = "onnx::Conv_600",
          UnknownDataFormat = true,
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1024, 256, 1, 1]> : vector<4xindex>
        },
        {
          Name = "onnx::Conv_601",
          UnknownDataFormat = true
        },
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          Name = "/layer3/layer3.2/Add_output_0",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 1024, 2, 2]> : vector<4xindex>
        }
      ],
      OutputName = "/layer3/layer3.2/Add",
      Reason = "InCoreChain",
      Results = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          Name = "/layer3/layer3.2/Add_output_0",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 1024, 2, 2]> : vector<4xindex>
        }
      ],
      TilingRecipe = {
        "conv-spatial-2d" = false,
        "conv-split-stamps" = true,
        "conv-split-stamps-OC-only" = false,
        "conv-split-stamps-OH-only" = false,
        "convtype-set-by-overlay-heuristic" = false,
        "disable-oh-spatial" = false,
        "disable-ow-spatial" = false,
        "dwc-split-stamps" = false,
        "elt-split-stamps" = true,
        "fm-superiters" = false,
        "icw-superiters" = false,
        "ocw-superiters" = true,
        "ow-superiters" = false,
        "pool-split-stamps" = false,
        "reduce-split-stamps" = false
      },
      logical_mode = "2x_4x4_1x4_vertBroadcastLeft_horizBroadcastRight",
      memory_configuration = {
        L1 = {layout = "strictlegacy"},
        L2 = {ifm_buffering = "single", layout = "flexible", limited_wts_space = false, ofm_buffering = "single", weights_buffering = "double"}
      }} {
      %169 = xten_nn.subgraph (%arg5 = %arg1: tensor<1x256x2x2xbf16>, %arg6 = %arg2: tensor<1024x256x1x1xbf16>, %arg7 = %arg3: tensor<1024xbf16>)  attributes {
        Dilations = array<i64: 1, 1>,
        HWPadding = [[0, 0], [0, 0]],
        LayerName = "/layer3/layer3.2/conv3/Conv",
        Operands = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer3/layer3.2/relu_1/Relu_output_0",
            Port = "data_io.ifm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 256, 2, 2]> : vector<4xindex>
          },
          {
            Name = "onnx::Conv_600",
            Port = "data_io.wts",
            SubPort = "wts_data",
            UnknownDataFormat = true,
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1024, 256, 1, 1]> : vector<4xindex>
          },
          {
            Name = "onnx::Conv_601",
            Port = "data_io.wts",
            SubPort = "bias",
            UnknownDataFormat = true
          }
        ],
        OutputName = "/layer3/layer3.2/conv3/Conv",
        Reason = "MllibKernel",
        Results = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer3/layer3.2/conv3/Conv_output_0",
            Port = "data_io.ofm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 1024, 2, 2]> : vector<4xindex>
          }
        ],
        Specializes = "Conv2DBf16",
        Traits = {
          AllowDMAOptimization = true
        },
        With = {
          config.AIE_API_EMULATE_BFLOAT16_MMUL_WITH_BFP16 = 1 : ui8,
          config.act = 0 : ui8,
          config.act_type = "RELU",
          config.aie_arch = "aie2p",
          config.batch_size = 1 : ui8,
          config.compiler = "peano",
          config.conv_type = [0 : ui8, 12 : ui8, 64 : ui8],
          config.dtype_ifm = "bfloat16",
          config.dtype_ofm = "bfloat16",
          config.dtype_wts = "bfloat16",
          config.enable_bfp16_wts = 0 : ui8,
          config.ksize.height = 1 : ui8,
          config.ksize.width = 1 : ui8,
          config.lrelu_alpha = 1.000000e+00 : f32,
          config.stride_h = 1 : ui8,
          config.stride_w = 1 : ui8
        }} {
        %171 = "tosa.const"() <{value = dense<[0, 3, 1, 2]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc248)
        %172 = "tosa.const"() <{value = dense<[0, 2, 3, 1]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc248)
        %173 = tosa.reshape %arg6 {new_shape = array<i64: 1024, 1, 1, 256>} : (tensor<1024x256x1x1xbf16>) -> tensor<1024x1x1x256xbf16> loc(#loc413)
        %174 = tosa.transpose %arg5, %172 : (tensor<1x256x2x2xbf16>, tensor<4xi32>) -> tensor<1x2x2x256xbf16> loc(#loc413)
        %175 = tosa.conv2d %174, %173, %arg7 {
          PartOfLayerName = "/layer3/layer3.2/conv3/Conv",
          PartOfOutputName = "/layer3/layer3.2/conv3/Conv",
          acc_type = f32,
          dilation = array<i64: 1, 1>,
          pad = array<i64: 0, 0, 0, 0>,
          stride = array<i64: 1, 1>} : (tensor<1x2x2x256xbf16>, tensor<1024x1x1x256xbf16>, tensor<1024xbf16>) -> tensor<1x2x2x1024xbf16> loc(#loc413)
        %176 = tosa.transpose %175, %171 : (tensor<1x2x2x1024xbf16>, tensor<4xi32>) -> tensor<1x1024x2x2xbf16> loc(#loc413)
        xten_nn.output %176 : tensor<1x1024x2x2xbf16> loc(#loc413)
      } -> tensor<1x1024x2x2xbf16> loc(#loc413)
      %170 = xten_nn.subgraph (%arg5 = %169: tensor<1x1024x2x2xbf16>, %arg6 = %arg4: tensor<1x1024x2x2xbf16>)  attributes {
        LayerName = "/layer3/layer3.2/relu_2/Relu",
        Operands = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer3/layer3.2/Add_output_0",
            Port = "data_io.ifm1",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 1024, 2, 2]> : vector<4xindex>
          },
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer3/layer3.2/Add_output_0",
            Port = "data_io.ifm2",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 1024, 2, 2]> : vector<4xindex>
          }
        ],
        OutputName = "/layer3/layer3.2/Add",
        Reason = "MllibKernel",
        Results = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer3/layer3.2/Add_output_0",
            Port = "data_io.ofm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 1024, 2, 2]> : vector<4xindex>
          }
        ],
        Specializes = "AddBf16",
        Traits = {
          Binary = true,
          Elementwise = true,
          NonNegativeOut = true
        },
        With = {
          config.act = 1 : ui8,
          config.act_type = "RELU",
          config.aie_arch = "aie2p",
          config.compiler = "peano",
          config.dtype = "bfloat16"
        }} {
        %171 = tosa.add %arg5, %arg6 {LayerName = "/layer3/layer3.2/Add", OutputName = "/layer3/layer3.2/Add"} : (tensor<1x1024x2x2xbf16>, tensor<1x1024x2x2xbf16>) -> tensor<1x1024x2x2xbf16> loc(#loc415)
        %172 = tosa.clamp %171 {
          LayerName = "/layer3/layer3.2/relu_2/Relu",
          OutputName = "/layer3/layer3.2/relu_2/Relu",
          max_fp = 3.40282347E+38 : f32,
          max_int = 2147483647 : i64,
          min_fp = 0.000000e+00 : f32,
          min_int = 0 : i64} : (tensor<1x1024x2x2xbf16>) -> tensor<1x1024x2x2xbf16> loc(#loc416)
        xten_nn.output %172 : tensor<1x1024x2x2xbf16> loc(#loc416)
      } -> tensor<1x1024x2x2xbf16> loc(#loc414)
      xten_nn.output %170 : tensor<1x1024x2x2xbf16> loc(#loc414)
    } -> tensor<1x1024x2x2xbf16> loc(#loc412)
    %145 = xten_nn.subgraph (%arg1 = %144: tensor<1x1024x2x2xbf16>, %arg2 = %21: tensor<256x1024x1x1xbf16>, %arg3 = %89: tensor<256xbf16>)  attributes {
      IfmOperands = [0 : index],
      LayerName = "/layer3/layer3.3/relu/Relu",
      Operands = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 1024, 2, 2]> : vector<4xindex>
        },
        {
          UnknownDataFormat = true,
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[256, 1024, 1, 1]> : vector<4xindex>
        },
        {
          UnknownDataFormat = true
        }
      ],
      OutputName = "/layer3/layer3.3/conv1/Conv",
      Reason = "InCoreChain",
      Results = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          Name = "/layer3/layer3.3/conv1/Conv_output_0",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 256, 2, 2]> : vector<4xindex>
        }
      ],
      TilingRecipe = {
        "conv-spatial-2d" = false,
        "conv-split-stamps" = true,
        "conv-split-stamps-OC-only" = false,
        "conv-split-stamps-OH-only" = false,
        "convtype-set-by-overlay-heuristic" = false,
        "disable-oh-spatial" = false,
        "disable-ow-spatial" = false,
        "dwc-split-stamps" = false,
        "elt-split-stamps" = true,
        "fm-superiters" = false,
        "icw-superiters" = false,
        "ocw-superiters" = true,
        "ow-superiters" = false,
        "pool-split-stamps" = false,
        "reduce-split-stamps" = false
      },
      logical_mode = "2x_4x4_1x4_vertBroadcastLeft_horizBroadcastRight",
      memory_configuration = {
        L1 = {layout = "strictlegacy"},
        L2 = {ifm_buffering = "single", layout = "flexible", limited_wts_space = false, ofm_buffering = "single", weights_buffering = "double"}
      }} {
      %169 = xten_nn.subgraph (%arg4 = %arg1: tensor<1x1024x2x2xbf16>, %arg5 = %arg2: tensor<256x1024x1x1xbf16>, %arg6 = %arg3: tensor<256xbf16>)  attributes {
        Dilations = array<i64: 1, 1>,
        HWPadding = [[0, 0], [0, 0]],
        LayerName = "/layer3/layer3.3/relu/Relu",
        Operands = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Port = "data_io.ifm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 1024, 2, 2]> : vector<4xindex>
          },
          {
            Port = "data_io.wts",
            SubPort = "wts_data",
            UnknownDataFormat = true,
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[256, 1024, 1, 1]> : vector<4xindex>
          },
          {
            Port = "data_io.wts",
            SubPort = "bias",
            UnknownDataFormat = true
          }
        ],
        OutputName = "/layer3/layer3.3/conv1/Conv",
        Reason = "MllibKernel",
        Results = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer3/layer3.3/conv1/Conv_output_0",
            Port = "data_io.ofm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 256, 2, 2]> : vector<4xindex>
          }
        ],
        Specializes = "Conv2DBf16",
        Traits = {
          AllowDMAOptimization = true,
          NonNegativeOut = true
        },
        With = {
          config.AIE_API_EMULATE_BFLOAT16_MMUL_WITH_BFP16 = 1 : ui8,
          config.act = 1 : ui8,
          config.act_type = "RELU",
          config.aie_arch = "aie2p",
          config.batch_size = 1 : ui8,
          config.compiler = "peano",
          config.conv_type = [0 : ui8, 12 : ui8, 64 : ui8],
          config.dtype_ifm = "bfloat16",
          config.dtype_ofm = "bfloat16",
          config.dtype_wts = "bfloat16",
          config.enable_bfp16_wts = 0 : ui8,
          config.ksize.height = 1 : ui8,
          config.ksize.width = 1 : ui8,
          config.lrelu_alpha = 0.000000e+00 : f32,
          config.stride_h = 1 : ui8,
          config.stride_w = 1 : ui8
        }} {
        %170 = "tosa.const"() <{value = dense<[0, 3, 1, 2]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc248)
        %171 = "tosa.const"() <{value = dense<[0, 2, 3, 1]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc248)
        %172 = tosa.reshape %arg5 {new_shape = array<i64: 256, 1, 1, 1024>} : (tensor<256x1024x1x1xbf16>) -> tensor<256x1x1x1024xbf16> loc(#loc417)
        %173 = tosa.transpose %arg4, %171 : (tensor<1x1024x2x2xbf16>, tensor<4xi32>) -> tensor<1x2x2x1024xbf16> loc(#loc417)
        %174 = tosa.conv2d %173, %172, %arg6 {
          PartOfLayerName = "/layer3/layer3.3/conv1/Conv",
          PartOfOutputName = "/layer3/layer3.3/conv1/Conv",
          acc_type = f32,
          dilation = array<i64: 1, 1>,
          pad = array<i64: 0, 0, 0, 0>,
          stride = array<i64: 1, 1>} : (tensor<1x2x2x1024xbf16>, tensor<256x1x1x1024xbf16>, tensor<256xbf16>) -> tensor<1x2x2x256xbf16> loc(#loc418)
        %175 = tosa.clamp %174 {
          LayerName = "/layer3/layer3.3/relu/Relu",
          OutputName = "/layer3/layer3.3/relu/Relu",
          max_fp = 3.40282347E+38 : f32,
          max_int = 2147483647 : i64,
          min_fp = 0.000000e+00 : f32,
          min_int = 0 : i64} : (tensor<1x2x2x256xbf16>) -> tensor<1x2x2x256xbf16> loc(#loc419)
        %176 = tosa.transpose %175, %170 : (tensor<1x2x2x256xbf16>, tensor<4xi32>) -> tensor<1x256x2x2xbf16> loc(#loc417)
        xten_nn.output %176 : tensor<1x256x2x2xbf16> loc(#loc419)
      } -> tensor<1x256x2x2xbf16> loc(#loc417)
      xten_nn.output %169 : tensor<1x256x2x2xbf16> loc(#loc417)
    } -> tensor<1x256x2x2xbf16> loc(#loc417)
    %146 = xten_nn.subgraph (%arg1 = %145: tensor<1x256x2x2xbf16>, %arg2 = %20: tensor<256x256x3x3xbf16>, %arg3 = %91: tensor<256xbf16>)  attributes {
      IfmOperands = [0 : index],
      LayerName = "/layer3/layer3.3/relu_1/Relu",
      Operands = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 256, 2, 2]> : vector<4xindex>
        },
        {
          UnknownDataFormat = true,
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[256, 256, 3, 3]> : vector<4xindex>
        },
        {
          UnknownDataFormat = true
        }
      ],
      OutputName = "/layer3/layer3.3/conv2/Conv",
      Reason = "InCoreChain",
      Results = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          Name = "/layer3/layer3.3/conv2/Conv_output_0",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 256, 2, 2]> : vector<4xindex>
        }
      ],
      TilingRecipe = {
        "conv-spatial-2d" = false,
        "conv-split-stamps" = true,
        "conv-split-stamps-OC-only" = false,
        "conv-split-stamps-OH-only" = false,
        "convtype-set-by-overlay-heuristic" = false,
        "disable-oh-spatial" = false,
        "disable-ow-spatial" = false,
        "dwc-split-stamps" = false,
        "elt-split-stamps" = true,
        "fm-superiters" = false,
        "icw-superiters" = false,
        "ocw-superiters" = true,
        "ow-superiters" = false,
        "pool-split-stamps" = false,
        "reduce-split-stamps" = false
      },
      logical_mode = "2x_4x4_1x4_vertBroadcastLeft_horizBroadcastRight",
      memory_configuration = {
        L1 = {layout = "strictlegacy"},
        L2 = {ifm_buffering = "single", layout = "flexible", limited_wts_space = false, ofm_buffering = "single", weights_buffering = "double"}
      }} {
      %169 = xten_nn.subgraph (%arg4 = %arg1: tensor<1x256x2x2xbf16>, %arg5 = %arg2: tensor<256x256x3x3xbf16>, %arg6 = %arg3: tensor<256xbf16>)  attributes {
        Dilations = array<i64: 1, 1>,
        HWPadding = [[1, 1], [1, 1]],
        LayerName = "/layer3/layer3.3/relu_1/Relu",
        Operands = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Port = "data_io.ifm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 256, 2, 2]> : vector<4xindex>
          },
          {
            Port = "data_io.wts",
            SubPort = "wts_data",
            UnknownDataFormat = true,
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[256, 256, 3, 3]> : vector<4xindex>
          },
          {
            Port = "data_io.wts",
            SubPort = "bias",
            UnknownDataFormat = true
          }
        ],
        OutputName = "/layer3/layer3.3/conv2/Conv",
        Reason = "MllibKernel",
        Results = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer3/layer3.3/conv2/Conv_output_0",
            Port = "data_io.ofm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 256, 2, 2]> : vector<4xindex>
          }
        ],
        Specializes = "Conv2DBf16",
        Traits = {
          AllowDMAOptimization = true,
          NonNegativeOut = true
        },
        With = {
          config.AIE_API_EMULATE_BFLOAT16_MMUL_WITH_BFP16 = 1 : ui8,
          config.act = 1 : ui8,
          config.act_type = "RELU",
          config.aie_arch = "aie2p",
          config.batch_size = 1 : ui8,
          config.compiler = "peano",
          config.conv_type = [0 : ui8, 12 : ui8, 64 : ui8],
          config.dtype_ifm = "bfloat16",
          config.dtype_ofm = "bfloat16",
          config.dtype_wts = "bfloat16",
          config.enable_bfp16_wts = 0 : ui8,
          config.ksize.height = 3 : ui8,
          config.ksize.width = 3 : ui8,
          config.lrelu_alpha = 0.000000e+00 : f32,
          config.stride_h = 1 : ui8,
          config.stride_w = 1 : ui8
        }} {
        %170 = "tosa.const"() <{value = dense<[0, 3, 1, 2]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc248)
        %171 = "tosa.const"() <{value = dense<[0, 2, 3, 1]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc248)
        %172 = tosa.transpose %arg5, %171 : (tensor<256x256x3x3xbf16>, tensor<4xi32>) -> tensor<256x3x3x256xbf16> loc(#loc420)
        %173 = tosa.transpose %arg4, %171 : (tensor<1x256x2x2xbf16>, tensor<4xi32>) -> tensor<1x2x2x256xbf16> loc(#loc420)
        %174 = tosa.conv2d %173, %172, %arg6 {
          PartOfLayerName = "/layer3/layer3.3/conv2/Conv",
          PartOfOutputName = "/layer3/layer3.3/conv2/Conv",
          acc_type = f32,
          dilation = array<i64: 1, 1>,
          pad = array<i64: 1, 1, 1, 1>,
          stride = array<i64: 1, 1>} : (tensor<1x2x2x256xbf16>, tensor<256x3x3x256xbf16>, tensor<256xbf16>) -> tensor<1x2x2x256xbf16> loc(#loc421)
        %175 = tosa.clamp %174 {
          LayerName = "/layer3/layer3.3/relu_1/Relu",
          OutputName = "/layer3/layer3.3/relu_1/Relu",
          max_fp = 3.40282347E+38 : f32,
          max_int = 2147483647 : i64,
          min_fp = 0.000000e+00 : f32,
          min_int = 0 : i64} : (tensor<1x2x2x256xbf16>) -> tensor<1x2x2x256xbf16> loc(#loc422)
        %176 = tosa.transpose %175, %170 : (tensor<1x2x2x256xbf16>, tensor<4xi32>) -> tensor<1x256x2x2xbf16> loc(#loc420)
        xten_nn.output %176 : tensor<1x256x2x2xbf16> loc(#loc422)
      } -> tensor<1x256x2x2xbf16> loc(#loc420)
      xten_nn.output %169 : tensor<1x256x2x2xbf16> loc(#loc420)
    } -> tensor<1x256x2x2xbf16> loc(#loc420)
    %147 = xten_nn.subgraph (%arg1 = %146: tensor<1x256x2x2xbf16>, %arg2 = %19: tensor<1024x256x1x1xbf16>, %arg3 = %92: tensor<1024xbf16>, %arg4 = %144: tensor<1x1024x2x2xbf16>)  attributes {
      IfmOperands = [0 : index, 3 : index],
      LayerName = "/layer3/layer3.3/conv3/Conv",
      OfmShare = 3 : index,
      Operands = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          Name = "/layer3/layer3.3/relu_1/Relu_output_0",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 256, 2, 2]> : vector<4xindex>
        },
        {
          Name = "onnx::Conv_609",
          UnknownDataFormat = true,
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1024, 256, 1, 1]> : vector<4xindex>
        },
        {
          Name = "onnx::Conv_610",
          UnknownDataFormat = true
        },
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          Name = "/layer3/layer3.3/Add_output_0",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 1024, 2, 2]> : vector<4xindex>
        }
      ],
      OutputName = "/layer3/layer3.3/Add",
      Reason = "InCoreChain",
      Results = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          Name = "/layer3/layer3.3/Add_output_0",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 1024, 2, 2]> : vector<4xindex>
        }
      ],
      TilingRecipe = {
        "conv-spatial-2d" = false,
        "conv-split-stamps" = true,
        "conv-split-stamps-OC-only" = false,
        "conv-split-stamps-OH-only" = false,
        "convtype-set-by-overlay-heuristic" = false,
        "disable-oh-spatial" = false,
        "disable-ow-spatial" = false,
        "dwc-split-stamps" = false,
        "elt-split-stamps" = true,
        "fm-superiters" = false,
        "icw-superiters" = false,
        "ocw-superiters" = true,
        "ow-superiters" = false,
        "pool-split-stamps" = false,
        "reduce-split-stamps" = false
      },
      logical_mode = "2x_4x4_1x4_vertBroadcastLeft_horizBroadcastRight",
      memory_configuration = {
        L1 = {layout = "strictlegacy"},
        L2 = {ifm_buffering = "single", layout = "flexible", limited_wts_space = false, ofm_buffering = "single", weights_buffering = "double"}
      }} {
      %169 = xten_nn.subgraph (%arg5 = %arg1: tensor<1x256x2x2xbf16>, %arg6 = %arg2: tensor<1024x256x1x1xbf16>, %arg7 = %arg3: tensor<1024xbf16>)  attributes {
        Dilations = array<i64: 1, 1>,
        HWPadding = [[0, 0], [0, 0]],
        LayerName = "/layer3/layer3.3/conv3/Conv",
        Operands = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer3/layer3.3/relu_1/Relu_output_0",
            Port = "data_io.ifm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 256, 2, 2]> : vector<4xindex>
          },
          {
            Name = "onnx::Conv_609",
            Port = "data_io.wts",
            SubPort = "wts_data",
            UnknownDataFormat = true,
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1024, 256, 1, 1]> : vector<4xindex>
          },
          {
            Name = "onnx::Conv_610",
            Port = "data_io.wts",
            SubPort = "bias",
            UnknownDataFormat = true
          }
        ],
        OutputName = "/layer3/layer3.3/conv3/Conv",
        Reason = "MllibKernel",
        Results = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer3/layer3.3/conv3/Conv_output_0",
            Port = "data_io.ofm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 1024, 2, 2]> : vector<4xindex>
          }
        ],
        Specializes = "Conv2DBf16",
        Traits = {
          AllowDMAOptimization = true
        },
        With = {
          config.AIE_API_EMULATE_BFLOAT16_MMUL_WITH_BFP16 = 1 : ui8,
          config.act = 0 : ui8,
          config.act_type = "RELU",
          config.aie_arch = "aie2p",
          config.batch_size = 1 : ui8,
          config.compiler = "peano",
          config.conv_type = [0 : ui8, 12 : ui8, 64 : ui8],
          config.dtype_ifm = "bfloat16",
          config.dtype_ofm = "bfloat16",
          config.dtype_wts = "bfloat16",
          config.enable_bfp16_wts = 0 : ui8,
          config.ksize.height = 1 : ui8,
          config.ksize.width = 1 : ui8,
          config.lrelu_alpha = 1.000000e+00 : f32,
          config.stride_h = 1 : ui8,
          config.stride_w = 1 : ui8
        }} {
        %171 = "tosa.const"() <{value = dense<[0, 3, 1, 2]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc248)
        %172 = "tosa.const"() <{value = dense<[0, 2, 3, 1]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc248)
        %173 = tosa.reshape %arg6 {new_shape = array<i64: 1024, 1, 1, 256>} : (tensor<1024x256x1x1xbf16>) -> tensor<1024x1x1x256xbf16> loc(#loc424)
        %174 = tosa.transpose %arg5, %172 : (tensor<1x256x2x2xbf16>, tensor<4xi32>) -> tensor<1x2x2x256xbf16> loc(#loc424)
        %175 = tosa.conv2d %174, %173, %arg7 {
          PartOfLayerName = "/layer3/layer3.3/conv3/Conv",
          PartOfOutputName = "/layer3/layer3.3/conv3/Conv",
          acc_type = f32,
          dilation = array<i64: 1, 1>,
          pad = array<i64: 0, 0, 0, 0>,
          stride = array<i64: 1, 1>} : (tensor<1x2x2x256xbf16>, tensor<1024x1x1x256xbf16>, tensor<1024xbf16>) -> tensor<1x2x2x1024xbf16> loc(#loc424)
        %176 = tosa.transpose %175, %171 : (tensor<1x2x2x1024xbf16>, tensor<4xi32>) -> tensor<1x1024x2x2xbf16> loc(#loc424)
        xten_nn.output %176 : tensor<1x1024x2x2xbf16> loc(#loc424)
      } -> tensor<1x1024x2x2xbf16> loc(#loc424)
      %170 = xten_nn.subgraph (%arg5 = %169: tensor<1x1024x2x2xbf16>, %arg6 = %arg4: tensor<1x1024x2x2xbf16>)  attributes {
        LayerName = "/layer3/layer3.3/relu_2/Relu",
        Operands = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer3/layer3.3/Add_output_0",
            Port = "data_io.ifm1",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 1024, 2, 2]> : vector<4xindex>
          },
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer3/layer3.3/Add_output_0",
            Port = "data_io.ifm2",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 1024, 2, 2]> : vector<4xindex>
          }
        ],
        OutputName = "/layer3/layer3.3/Add",
        Reason = "MllibKernel",
        Results = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer3/layer3.3/Add_output_0",
            Port = "data_io.ofm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 1024, 2, 2]> : vector<4xindex>
          }
        ],
        Specializes = "AddBf16",
        Traits = {
          Binary = true,
          Elementwise = true,
          NonNegativeOut = true
        },
        With = {
          config.act = 1 : ui8,
          config.act_type = "RELU",
          config.aie_arch = "aie2p",
          config.compiler = "peano",
          config.dtype = "bfloat16"
        }} {
        %171 = tosa.add %arg5, %arg6 {LayerName = "/layer3/layer3.3/Add", OutputName = "/layer3/layer3.3/Add"} : (tensor<1x1024x2x2xbf16>, tensor<1x1024x2x2xbf16>) -> tensor<1x1024x2x2xbf16> loc(#loc426)
        %172 = tosa.clamp %171 {
          LayerName = "/layer3/layer3.3/relu_2/Relu",
          OutputName = "/layer3/layer3.3/relu_2/Relu",
          max_fp = 3.40282347E+38 : f32,
          max_int = 2147483647 : i64,
          min_fp = 0.000000e+00 : f32,
          min_int = 0 : i64} : (tensor<1x1024x2x2xbf16>) -> tensor<1x1024x2x2xbf16> loc(#loc427)
        xten_nn.output %172 : tensor<1x1024x2x2xbf16> loc(#loc427)
      } -> tensor<1x1024x2x2xbf16> loc(#loc425)
      xten_nn.output %170 : tensor<1x1024x2x2xbf16> loc(#loc425)
    } -> tensor<1x1024x2x2xbf16> loc(#loc423)
    %148 = xten_nn.subgraph (%arg1 = %147: tensor<1x1024x2x2xbf16>, %arg2 = %18: tensor<256x1024x1x1xbf16>, %arg3 = %95: tensor<256xbf16>)  attributes {
      IfmOperands = [0 : index],
      LayerName = "/layer3/layer3.4/relu/Relu",
      Operands = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 1024, 2, 2]> : vector<4xindex>
        },
        {
          UnknownDataFormat = true,
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[256, 1024, 1, 1]> : vector<4xindex>
        },
        {
          UnknownDataFormat = true
        }
      ],
      OutputName = "/layer3/layer3.4/conv1/Conv",
      Reason = "InCoreChain",
      Results = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          Name = "/layer3/layer3.4/conv1/Conv_output_0",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 256, 2, 2]> : vector<4xindex>
        }
      ],
      TilingRecipe = {
        "conv-spatial-2d" = false,
        "conv-split-stamps" = true,
        "conv-split-stamps-OC-only" = false,
        "conv-split-stamps-OH-only" = false,
        "convtype-set-by-overlay-heuristic" = false,
        "disable-oh-spatial" = false,
        "disable-ow-spatial" = false,
        "dwc-split-stamps" = false,
        "elt-split-stamps" = true,
        "fm-superiters" = false,
        "icw-superiters" = false,
        "ocw-superiters" = true,
        "ow-superiters" = false,
        "pool-split-stamps" = false,
        "reduce-split-stamps" = false
      },
      logical_mode = "2x_4x4_1x4_vertBroadcastLeft_horizBroadcastRight",
      memory_configuration = {
        L1 = {layout = "strictlegacy"},
        L2 = {ifm_buffering = "single", layout = "flexible", limited_wts_space = false, ofm_buffering = "single", weights_buffering = "double"}
      }} {
      %169 = xten_nn.subgraph (%arg4 = %arg1: tensor<1x1024x2x2xbf16>, %arg5 = %arg2: tensor<256x1024x1x1xbf16>, %arg6 = %arg3: tensor<256xbf16>)  attributes {
        Dilations = array<i64: 1, 1>,
        HWPadding = [[0, 0], [0, 0]],
        LayerName = "/layer3/layer3.4/relu/Relu",
        Operands = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Port = "data_io.ifm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 1024, 2, 2]> : vector<4xindex>
          },
          {
            Port = "data_io.wts",
            SubPort = "wts_data",
            UnknownDataFormat = true,
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[256, 1024, 1, 1]> : vector<4xindex>
          },
          {
            Port = "data_io.wts",
            SubPort = "bias",
            UnknownDataFormat = true
          }
        ],
        OutputName = "/layer3/layer3.4/conv1/Conv",
        Reason = "MllibKernel",
        Results = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer3/layer3.4/conv1/Conv_output_0",
            Port = "data_io.ofm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 256, 2, 2]> : vector<4xindex>
          }
        ],
        Specializes = "Conv2DBf16",
        Traits = {
          AllowDMAOptimization = true,
          NonNegativeOut = true
        },
        With = {
          config.AIE_API_EMULATE_BFLOAT16_MMUL_WITH_BFP16 = 1 : ui8,
          config.act = 1 : ui8,
          config.act_type = "RELU",
          config.aie_arch = "aie2p",
          config.batch_size = 1 : ui8,
          config.compiler = "peano",
          config.conv_type = [0 : ui8, 12 : ui8, 64 : ui8],
          config.dtype_ifm = "bfloat16",
          config.dtype_ofm = "bfloat16",
          config.dtype_wts = "bfloat16",
          config.enable_bfp16_wts = 0 : ui8,
          config.ksize.height = 1 : ui8,
          config.ksize.width = 1 : ui8,
          config.lrelu_alpha = 0.000000e+00 : f32,
          config.stride_h = 1 : ui8,
          config.stride_w = 1 : ui8
        }} {
        %170 = "tosa.const"() <{value = dense<[0, 3, 1, 2]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc248)
        %171 = "tosa.const"() <{value = dense<[0, 2, 3, 1]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc248)
        %172 = tosa.reshape %arg5 {new_shape = array<i64: 256, 1, 1, 1024>} : (tensor<256x1024x1x1xbf16>) -> tensor<256x1x1x1024xbf16> loc(#loc428)
        %173 = tosa.transpose %arg4, %171 : (tensor<1x1024x2x2xbf16>, tensor<4xi32>) -> tensor<1x2x2x1024xbf16> loc(#loc428)
        %174 = tosa.conv2d %173, %172, %arg6 {
          PartOfLayerName = "/layer3/layer3.4/conv1/Conv",
          PartOfOutputName = "/layer3/layer3.4/conv1/Conv",
          acc_type = f32,
          dilation = array<i64: 1, 1>,
          pad = array<i64: 0, 0, 0, 0>,
          stride = array<i64: 1, 1>} : (tensor<1x2x2x1024xbf16>, tensor<256x1x1x1024xbf16>, tensor<256xbf16>) -> tensor<1x2x2x256xbf16> loc(#loc429)
        %175 = tosa.clamp %174 {
          LayerName = "/layer3/layer3.4/relu/Relu",
          OutputName = "/layer3/layer3.4/relu/Relu",
          max_fp = 3.40282347E+38 : f32,
          max_int = 2147483647 : i64,
          min_fp = 0.000000e+00 : f32,
          min_int = 0 : i64} : (tensor<1x2x2x256xbf16>) -> tensor<1x2x2x256xbf16> loc(#loc430)
        %176 = tosa.transpose %175, %170 : (tensor<1x2x2x256xbf16>, tensor<4xi32>) -> tensor<1x256x2x2xbf16> loc(#loc428)
        xten_nn.output %176 : tensor<1x256x2x2xbf16> loc(#loc430)
      } -> tensor<1x256x2x2xbf16> loc(#loc428)
      xten_nn.output %169 : tensor<1x256x2x2xbf16> loc(#loc428)
    } -> tensor<1x256x2x2xbf16> loc(#loc428)
    %149 = xten_nn.subgraph (%arg1 = %148: tensor<1x256x2x2xbf16>, %arg2 = %17: tensor<256x256x3x3xbf16>, %arg3 = %69: tensor<256xbf16>)  attributes {
      IfmOperands = [0 : index],
      LayerName = "/layer3/layer3.4/relu_1/Relu",
      Operands = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 256, 2, 2]> : vector<4xindex>
        },
        {
          UnknownDataFormat = true,
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[256, 256, 3, 3]> : vector<4xindex>
        },
        {
          UnknownDataFormat = true
        }
      ],
      OutputName = "/layer3/layer3.4/conv2/Conv",
      Reason = "InCoreChain",
      Results = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          Name = "/layer3/layer3.4/conv2/Conv_output_0",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 256, 2, 2]> : vector<4xindex>
        }
      ],
      TilingRecipe = {
        "conv-spatial-2d" = false,
        "conv-split-stamps" = true,
        "conv-split-stamps-OC-only" = false,
        "conv-split-stamps-OH-only" = false,
        "convtype-set-by-overlay-heuristic" = false,
        "disable-oh-spatial" = false,
        "disable-ow-spatial" = false,
        "dwc-split-stamps" = false,
        "elt-split-stamps" = true,
        "fm-superiters" = false,
        "icw-superiters" = false,
        "ocw-superiters" = true,
        "ow-superiters" = false,
        "pool-split-stamps" = false,
        "reduce-split-stamps" = false
      },
      logical_mode = "2x_4x4_1x4_vertBroadcastLeft_horizBroadcastRight",
      memory_configuration = {
        L1 = {layout = "strictlegacy"},
        L2 = {ifm_buffering = "single", layout = "flexible", limited_wts_space = false, ofm_buffering = "single", weights_buffering = "double"}
      }} {
      %169 = xten_nn.subgraph (%arg4 = %arg1: tensor<1x256x2x2xbf16>, %arg5 = %arg2: tensor<256x256x3x3xbf16>, %arg6 = %arg3: tensor<256xbf16>)  attributes {
        Dilations = array<i64: 1, 1>,
        HWPadding = [[1, 1], [1, 1]],
        LayerName = "/layer3/layer3.4/relu_1/Relu",
        Operands = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Port = "data_io.ifm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 256, 2, 2]> : vector<4xindex>
          },
          {
            Port = "data_io.wts",
            SubPort = "wts_data",
            UnknownDataFormat = true,
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[256, 256, 3, 3]> : vector<4xindex>
          },
          {
            Port = "data_io.wts",
            SubPort = "bias",
            UnknownDataFormat = true
          }
        ],
        OutputName = "/layer3/layer3.4/conv2/Conv",
        Reason = "MllibKernel",
        Results = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer3/layer3.4/conv2/Conv_output_0",
            Port = "data_io.ofm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 256, 2, 2]> : vector<4xindex>
          }
        ],
        Specializes = "Conv2DBf16",
        Traits = {
          AllowDMAOptimization = true,
          NonNegativeOut = true
        },
        With = {
          config.AIE_API_EMULATE_BFLOAT16_MMUL_WITH_BFP16 = 1 : ui8,
          config.act = 1 : ui8,
          config.act_type = "RELU",
          config.aie_arch = "aie2p",
          config.batch_size = 1 : ui8,
          config.compiler = "peano",
          config.conv_type = [0 : ui8, 12 : ui8, 64 : ui8],
          config.dtype_ifm = "bfloat16",
          config.dtype_ofm = "bfloat16",
          config.dtype_wts = "bfloat16",
          config.enable_bfp16_wts = 0 : ui8,
          config.ksize.height = 3 : ui8,
          config.ksize.width = 3 : ui8,
          config.lrelu_alpha = 0.000000e+00 : f32,
          config.stride_h = 1 : ui8,
          config.stride_w = 1 : ui8
        }} {
        %170 = "tosa.const"() <{value = dense<[0, 3, 1, 2]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc248)
        %171 = "tosa.const"() <{value = dense<[0, 2, 3, 1]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc248)
        %172 = tosa.transpose %arg5, %171 : (tensor<256x256x3x3xbf16>, tensor<4xi32>) -> tensor<256x3x3x256xbf16> loc(#loc431)
        %173 = tosa.transpose %arg4, %171 : (tensor<1x256x2x2xbf16>, tensor<4xi32>) -> tensor<1x2x2x256xbf16> loc(#loc431)
        %174 = tosa.conv2d %173, %172, %arg6 {
          PartOfLayerName = "/layer3/layer3.4/conv2/Conv",
          PartOfOutputName = "/layer3/layer3.4/conv2/Conv",
          acc_type = f32,
          dilation = array<i64: 1, 1>,
          pad = array<i64: 1, 1, 1, 1>,
          stride = array<i64: 1, 1>} : (tensor<1x2x2x256xbf16>, tensor<256x3x3x256xbf16>, tensor<256xbf16>) -> tensor<1x2x2x256xbf16> loc(#loc432)
        %175 = tosa.clamp %174 {
          LayerName = "/layer3/layer3.4/relu_1/Relu",
          OutputName = "/layer3/layer3.4/relu_1/Relu",
          max_fp = 3.40282347E+38 : f32,
          max_int = 2147483647 : i64,
          min_fp = 0.000000e+00 : f32,
          min_int = 0 : i64} : (tensor<1x2x2x256xbf16>) -> tensor<1x2x2x256xbf16> loc(#loc433)
        %176 = tosa.transpose %175, %170 : (tensor<1x2x2x256xbf16>, tensor<4xi32>) -> tensor<1x256x2x2xbf16> loc(#loc431)
        xten_nn.output %176 : tensor<1x256x2x2xbf16> loc(#loc433)
      } -> tensor<1x256x2x2xbf16> loc(#loc431)
      xten_nn.output %169 : tensor<1x256x2x2xbf16> loc(#loc431)
    } -> tensor<1x256x2x2xbf16> loc(#loc431)
    %150 = xten_nn.subgraph (%arg1 = %149: tensor<1x256x2x2xbf16>, %arg2 = %16: tensor<1024x256x1x1xbf16>, %arg3 = %106: tensor<1024xbf16>, %arg4 = %147: tensor<1x1024x2x2xbf16>)  attributes {
      IfmOperands = [0 : index, 3 : index],
      LayerName = "/layer3/layer3.4/conv3/Conv",
      OfmShare = 3 : index,
      Operands = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          Name = "/layer3/layer3.4/relu_1/Relu_output_0",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 256, 2, 2]> : vector<4xindex>
        },
        {
          Name = "onnx::Conv_618",
          UnknownDataFormat = true,
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1024, 256, 1, 1]> : vector<4xindex>
        },
        {
          Name = "onnx::Conv_619",
          UnknownDataFormat = true
        },
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          Name = "/layer3/layer3.4/Add_output_0",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 1024, 2, 2]> : vector<4xindex>
        }
      ],
      OutputName = "/layer3/layer3.4/Add",
      Reason = "InCoreChain",
      Results = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          Name = "/layer3/layer3.4/Add_output_0",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 1024, 2, 2]> : vector<4xindex>
        }
      ],
      TilingRecipe = {
        "conv-spatial-2d" = false,
        "conv-split-stamps" = true,
        "conv-split-stamps-OC-only" = false,
        "conv-split-stamps-OH-only" = false,
        "convtype-set-by-overlay-heuristic" = false,
        "disable-oh-spatial" = false,
        "disable-ow-spatial" = false,
        "dwc-split-stamps" = false,
        "elt-split-stamps" = true,
        "fm-superiters" = false,
        "icw-superiters" = false,
        "ocw-superiters" = true,
        "ow-superiters" = false,
        "pool-split-stamps" = false,
        "reduce-split-stamps" = false
      },
      logical_mode = "2x_4x4_1x4_vertBroadcastLeft_horizBroadcastRight",
      memory_configuration = {
        L1 = {layout = "strictlegacy"},
        L2 = {ifm_buffering = "single", layout = "flexible", limited_wts_space = false, ofm_buffering = "single", weights_buffering = "double"}
      }} {
      %169 = xten_nn.subgraph (%arg5 = %arg1: tensor<1x256x2x2xbf16>, %arg6 = %arg2: tensor<1024x256x1x1xbf16>, %arg7 = %arg3: tensor<1024xbf16>)  attributes {
        Dilations = array<i64: 1, 1>,
        HWPadding = [[0, 0], [0, 0]],
        LayerName = "/layer3/layer3.4/conv3/Conv",
        Operands = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer3/layer3.4/relu_1/Relu_output_0",
            Port = "data_io.ifm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 256, 2, 2]> : vector<4xindex>
          },
          {
            Name = "onnx::Conv_618",
            Port = "data_io.wts",
            SubPort = "wts_data",
            UnknownDataFormat = true,
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1024, 256, 1, 1]> : vector<4xindex>
          },
          {
            Name = "onnx::Conv_619",
            Port = "data_io.wts",
            SubPort = "bias",
            UnknownDataFormat = true
          }
        ],
        OutputName = "/layer3/layer3.4/conv3/Conv",
        Reason = "MllibKernel",
        Results = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer3/layer3.4/conv3/Conv_output_0",
            Port = "data_io.ofm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 1024, 2, 2]> : vector<4xindex>
          }
        ],
        Specializes = "Conv2DBf16",
        Traits = {
          AllowDMAOptimization = true
        },
        With = {
          config.AIE_API_EMULATE_BFLOAT16_MMUL_WITH_BFP16 = 1 : ui8,
          config.act = 0 : ui8,
          config.act_type = "RELU",
          config.aie_arch = "aie2p",
          config.batch_size = 1 : ui8,
          config.compiler = "peano",
          config.conv_type = [0 : ui8, 12 : ui8, 64 : ui8],
          config.dtype_ifm = "bfloat16",
          config.dtype_ofm = "bfloat16",
          config.dtype_wts = "bfloat16",
          config.enable_bfp16_wts = 0 : ui8,
          config.ksize.height = 1 : ui8,
          config.ksize.width = 1 : ui8,
          config.lrelu_alpha = 1.000000e+00 : f32,
          config.stride_h = 1 : ui8,
          config.stride_w = 1 : ui8
        }} {
        %171 = "tosa.const"() <{value = dense<[0, 3, 1, 2]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc248)
        %172 = "tosa.const"() <{value = dense<[0, 2, 3, 1]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc248)
        %173 = tosa.reshape %arg6 {new_shape = array<i64: 1024, 1, 1, 256>} : (tensor<1024x256x1x1xbf16>) -> tensor<1024x1x1x256xbf16> loc(#loc435)
        %174 = tosa.transpose %arg5, %172 : (tensor<1x256x2x2xbf16>, tensor<4xi32>) -> tensor<1x2x2x256xbf16> loc(#loc435)
        %175 = tosa.conv2d %174, %173, %arg7 {
          PartOfLayerName = "/layer3/layer3.4/conv3/Conv",
          PartOfOutputName = "/layer3/layer3.4/conv3/Conv",
          acc_type = f32,
          dilation = array<i64: 1, 1>,
          pad = array<i64: 0, 0, 0, 0>,
          stride = array<i64: 1, 1>} : (tensor<1x2x2x256xbf16>, tensor<1024x1x1x256xbf16>, tensor<1024xbf16>) -> tensor<1x2x2x1024xbf16> loc(#loc435)
        %176 = tosa.transpose %175, %171 : (tensor<1x2x2x1024xbf16>, tensor<4xi32>) -> tensor<1x1024x2x2xbf16> loc(#loc435)
        xten_nn.output %176 : tensor<1x1024x2x2xbf16> loc(#loc435)
      } -> tensor<1x1024x2x2xbf16> loc(#loc435)
      %170 = xten_nn.subgraph (%arg5 = %169: tensor<1x1024x2x2xbf16>, %arg6 = %arg4: tensor<1x1024x2x2xbf16>)  attributes {
        LayerName = "/layer3/layer3.4/relu_2/Relu",
        Operands = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer3/layer3.4/Add_output_0",
            Port = "data_io.ifm1",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 1024, 2, 2]> : vector<4xindex>
          },
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer3/layer3.4/Add_output_0",
            Port = "data_io.ifm2",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 1024, 2, 2]> : vector<4xindex>
          }
        ],
        OutputName = "/layer3/layer3.4/Add",
        Reason = "MllibKernel",
        Results = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer3/layer3.4/Add_output_0",
            Port = "data_io.ofm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 1024, 2, 2]> : vector<4xindex>
          }
        ],
        Specializes = "AddBf16",
        Traits = {
          Binary = true,
          Elementwise = true,
          NonNegativeOut = true
        },
        With = {
          config.act = 1 : ui8,
          config.act_type = "RELU",
          config.aie_arch = "aie2p",
          config.compiler = "peano",
          config.dtype = "bfloat16"
        }} {
        %171 = tosa.add %arg5, %arg6 {LayerName = "/layer3/layer3.4/Add", OutputName = "/layer3/layer3.4/Add"} : (tensor<1x1024x2x2xbf16>, tensor<1x1024x2x2xbf16>) -> tensor<1x1024x2x2xbf16> loc(#loc437)
        %172 = tosa.clamp %171 {
          LayerName = "/layer3/layer3.4/relu_2/Relu",
          OutputName = "/layer3/layer3.4/relu_2/Relu",
          max_fp = 3.40282347E+38 : f32,
          max_int = 2147483647 : i64,
          min_fp = 0.000000e+00 : f32,
          min_int = 0 : i64} : (tensor<1x1024x2x2xbf16>) -> tensor<1x1024x2x2xbf16> loc(#loc438)
        xten_nn.output %172 : tensor<1x1024x2x2xbf16> loc(#loc438)
      } -> tensor<1x1024x2x2xbf16> loc(#loc436)
      xten_nn.output %170 : tensor<1x1024x2x2xbf16> loc(#loc436)
    } -> tensor<1x1024x2x2xbf16> loc(#loc434)
    %151 = xten_nn.subgraph (%arg1 = %150: tensor<1x1024x2x2xbf16>, %arg2 = %15: tensor<256x1024x1x1xbf16>, %arg3 = %98: tensor<256xbf16>)  attributes {
      IfmOperands = [0 : index],
      LayerName = "/layer3/layer3.5/relu/Relu",
      Operands = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 1024, 2, 2]> : vector<4xindex>
        },
        {
          UnknownDataFormat = true,
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[256, 1024, 1, 1]> : vector<4xindex>
        },
        {
          UnknownDataFormat = true
        }
      ],
      OutputName = "/layer3/layer3.5/conv1/Conv",
      Reason = "InCoreChain",
      Results = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          Name = "/layer3/layer3.5/conv1/Conv_output_0",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 256, 2, 2]> : vector<4xindex>
        }
      ],
      TilingRecipe = {
        "conv-spatial-2d" = false,
        "conv-split-stamps" = true,
        "conv-split-stamps-OC-only" = false,
        "conv-split-stamps-OH-only" = false,
        "convtype-set-by-overlay-heuristic" = false,
        "disable-oh-spatial" = false,
        "disable-ow-spatial" = false,
        "dwc-split-stamps" = false,
        "elt-split-stamps" = true,
        "fm-superiters" = false,
        "icw-superiters" = false,
        "ocw-superiters" = true,
        "ow-superiters" = false,
        "pool-split-stamps" = false,
        "reduce-split-stamps" = false
      },
      logical_mode = "2x_4x4_1x4_vertBroadcastLeft_horizBroadcastRight",
      memory_configuration = {
        L1 = {layout = "strictlegacy"},
        L2 = {ifm_buffering = "single", layout = "flexible", limited_wts_space = false, ofm_buffering = "single", weights_buffering = "double"}
      }} {
      %169 = xten_nn.subgraph (%arg4 = %arg1: tensor<1x1024x2x2xbf16>, %arg5 = %arg2: tensor<256x1024x1x1xbf16>, %arg6 = %arg3: tensor<256xbf16>)  attributes {
        Dilations = array<i64: 1, 1>,
        HWPadding = [[0, 0], [0, 0]],
        LayerName = "/layer3/layer3.5/relu/Relu",
        Operands = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Port = "data_io.ifm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 1024, 2, 2]> : vector<4xindex>
          },
          {
            Port = "data_io.wts",
            SubPort = "wts_data",
            UnknownDataFormat = true,
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[256, 1024, 1, 1]> : vector<4xindex>
          },
          {
            Port = "data_io.wts",
            SubPort = "bias",
            UnknownDataFormat = true
          }
        ],
        OutputName = "/layer3/layer3.5/conv1/Conv",
        Reason = "MllibKernel",
        Results = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer3/layer3.5/conv1/Conv_output_0",
            Port = "data_io.ofm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 256, 2, 2]> : vector<4xindex>
          }
        ],
        Specializes = "Conv2DBf16",
        Traits = {
          AllowDMAOptimization = true,
          NonNegativeOut = true
        },
        With = {
          config.AIE_API_EMULATE_BFLOAT16_MMUL_WITH_BFP16 = 1 : ui8,
          config.act = 1 : ui8,
          config.act_type = "RELU",
          config.aie_arch = "aie2p",
          config.batch_size = 1 : ui8,
          config.compiler = "peano",
          config.conv_type = [0 : ui8, 12 : ui8, 64 : ui8],
          config.dtype_ifm = "bfloat16",
          config.dtype_ofm = "bfloat16",
          config.dtype_wts = "bfloat16",
          config.enable_bfp16_wts = 0 : ui8,
          config.ksize.height = 1 : ui8,
          config.ksize.width = 1 : ui8,
          config.lrelu_alpha = 0.000000e+00 : f32,
          config.stride_h = 1 : ui8,
          config.stride_w = 1 : ui8
        }} {
        %170 = "tosa.const"() <{value = dense<[0, 3, 1, 2]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc248)
        %171 = "tosa.const"() <{value = dense<[0, 2, 3, 1]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc248)
        %172 = tosa.reshape %arg5 {new_shape = array<i64: 256, 1, 1, 1024>} : (tensor<256x1024x1x1xbf16>) -> tensor<256x1x1x1024xbf16> loc(#loc439)
        %173 = tosa.transpose %arg4, %171 : (tensor<1x1024x2x2xbf16>, tensor<4xi32>) -> tensor<1x2x2x1024xbf16> loc(#loc439)
        %174 = tosa.conv2d %173, %172, %arg6 {
          PartOfLayerName = "/layer3/layer3.5/conv1/Conv",
          PartOfOutputName = "/layer3/layer3.5/conv1/Conv",
          acc_type = f32,
          dilation = array<i64: 1, 1>,
          pad = array<i64: 0, 0, 0, 0>,
          stride = array<i64: 1, 1>} : (tensor<1x2x2x1024xbf16>, tensor<256x1x1x1024xbf16>, tensor<256xbf16>) -> tensor<1x2x2x256xbf16> loc(#loc440)
        %175 = tosa.clamp %174 {
          LayerName = "/layer3/layer3.5/relu/Relu",
          OutputName = "/layer3/layer3.5/relu/Relu",
          max_fp = 3.40282347E+38 : f32,
          max_int = 2147483647 : i64,
          min_fp = 0.000000e+00 : f32,
          min_int = 0 : i64} : (tensor<1x2x2x256xbf16>) -> tensor<1x2x2x256xbf16> loc(#loc441)
        %176 = tosa.transpose %175, %170 : (tensor<1x2x2x256xbf16>, tensor<4xi32>) -> tensor<1x256x2x2xbf16> loc(#loc439)
        xten_nn.output %176 : tensor<1x256x2x2xbf16> loc(#loc441)
      } -> tensor<1x256x2x2xbf16> loc(#loc439)
      xten_nn.output %169 : tensor<1x256x2x2xbf16> loc(#loc439)
    } -> tensor<1x256x2x2xbf16> loc(#loc439)
    %152 = xten_nn.subgraph (%arg1 = %151: tensor<1x256x2x2xbf16>, %arg2 = %14: tensor<256x256x3x3xbf16>, %arg3 = %102: tensor<256xbf16>)  attributes {
      IfmOperands = [0 : index],
      LayerName = "/layer3/layer3.5/relu_1/Relu",
      Operands = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 256, 2, 2]> : vector<4xindex>
        },
        {
          UnknownDataFormat = true,
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[256, 256, 3, 3]> : vector<4xindex>
        },
        {
          UnknownDataFormat = true
        }
      ],
      OutputName = "/layer3/layer3.5/conv2/Conv",
      Reason = "InCoreChain",
      Results = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          Name = "/layer3/layer3.5/conv2/Conv_output_0",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 256, 2, 2]> : vector<4xindex>
        }
      ],
      TilingRecipe = {
        "conv-spatial-2d" = false,
        "conv-split-stamps" = true,
        "conv-split-stamps-OC-only" = false,
        "conv-split-stamps-OH-only" = false,
        "convtype-set-by-overlay-heuristic" = false,
        "disable-oh-spatial" = false,
        "disable-ow-spatial" = false,
        "dwc-split-stamps" = false,
        "elt-split-stamps" = true,
        "fm-superiters" = false,
        "icw-superiters" = false,
        "ocw-superiters" = true,
        "ow-superiters" = false,
        "pool-split-stamps" = false,
        "reduce-split-stamps" = false
      },
      logical_mode = "2x_4x4_1x4_vertBroadcastLeft_horizBroadcastRight",
      memory_configuration = {
        L1 = {layout = "strictlegacy"},
        L2 = {ifm_buffering = "single", layout = "flexible", limited_wts_space = false, ofm_buffering = "single", weights_buffering = "double"}
      }} {
      %169 = xten_nn.subgraph (%arg4 = %arg1: tensor<1x256x2x2xbf16>, %arg5 = %arg2: tensor<256x256x3x3xbf16>, %arg6 = %arg3: tensor<256xbf16>)  attributes {
        Dilations = array<i64: 1, 1>,
        HWPadding = [[1, 1], [1, 1]],
        LayerName = "/layer3/layer3.5/relu_1/Relu",
        Operands = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Port = "data_io.ifm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 256, 2, 2]> : vector<4xindex>
          },
          {
            Port = "data_io.wts",
            SubPort = "wts_data",
            UnknownDataFormat = true,
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[256, 256, 3, 3]> : vector<4xindex>
          },
          {
            Port = "data_io.wts",
            SubPort = "bias",
            UnknownDataFormat = true
          }
        ],
        OutputName = "/layer3/layer3.5/conv2/Conv",
        Reason = "MllibKernel",
        Results = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer3/layer3.5/conv2/Conv_output_0",
            Port = "data_io.ofm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 256, 2, 2]> : vector<4xindex>
          }
        ],
        Specializes = "Conv2DBf16",
        Traits = {
          AllowDMAOptimization = true,
          NonNegativeOut = true
        },
        With = {
          config.AIE_API_EMULATE_BFLOAT16_MMUL_WITH_BFP16 = 1 : ui8,
          config.act = 1 : ui8,
          config.act_type = "RELU",
          config.aie_arch = "aie2p",
          config.batch_size = 1 : ui8,
          config.compiler = "peano",
          config.conv_type = [0 : ui8, 12 : ui8, 64 : ui8],
          config.dtype_ifm = "bfloat16",
          config.dtype_ofm = "bfloat16",
          config.dtype_wts = "bfloat16",
          config.enable_bfp16_wts = 0 : ui8,
          config.ksize.height = 3 : ui8,
          config.ksize.width = 3 : ui8,
          config.lrelu_alpha = 0.000000e+00 : f32,
          config.stride_h = 1 : ui8,
          config.stride_w = 1 : ui8
        }} {
        %170 = "tosa.const"() <{value = dense<[0, 3, 1, 2]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc248)
        %171 = "tosa.const"() <{value = dense<[0, 2, 3, 1]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc248)
        %172 = tosa.transpose %arg5, %171 : (tensor<256x256x3x3xbf16>, tensor<4xi32>) -> tensor<256x3x3x256xbf16> loc(#loc442)
        %173 = tosa.transpose %arg4, %171 : (tensor<1x256x2x2xbf16>, tensor<4xi32>) -> tensor<1x2x2x256xbf16> loc(#loc442)
        %174 = tosa.conv2d %173, %172, %arg6 {
          PartOfLayerName = "/layer3/layer3.5/conv2/Conv",
          PartOfOutputName = "/layer3/layer3.5/conv2/Conv",
          acc_type = f32,
          dilation = array<i64: 1, 1>,
          pad = array<i64: 1, 1, 1, 1>,
          stride = array<i64: 1, 1>} : (tensor<1x2x2x256xbf16>, tensor<256x3x3x256xbf16>, tensor<256xbf16>) -> tensor<1x2x2x256xbf16> loc(#loc443)
        %175 = tosa.clamp %174 {
          LayerName = "/layer3/layer3.5/relu_1/Relu",
          OutputName = "/layer3/layer3.5/relu_1/Relu",
          max_fp = 3.40282347E+38 : f32,
          max_int = 2147483647 : i64,
          min_fp = 0.000000e+00 : f32,
          min_int = 0 : i64} : (tensor<1x2x2x256xbf16>) -> tensor<1x2x2x256xbf16> loc(#loc444)
        %176 = tosa.transpose %175, %170 : (tensor<1x2x2x256xbf16>, tensor<4xi32>) -> tensor<1x256x2x2xbf16> loc(#loc442)
        xten_nn.output %176 : tensor<1x256x2x2xbf16> loc(#loc444)
      } -> tensor<1x256x2x2xbf16> loc(#loc442)
      xten_nn.output %169 : tensor<1x256x2x2xbf16> loc(#loc442)
    } -> tensor<1x256x2x2xbf16> loc(#loc442)
    %153 = xten_nn.subgraph (%arg1 = %152: tensor<1x256x2x2xbf16>, %arg2 = %13: tensor<1024x256x1x1xbf16>, %arg3 = %104: tensor<1024xbf16>, %arg4 = %150: tensor<1x1024x2x2xbf16>)  attributes {
      IfmOperands = [0 : index, 3 : index],
      LayerName = "/layer3/layer3.5/conv3/Conv",
      OfmShare = 3 : index,
      Operands = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          Name = "/layer3/layer3.5/relu_1/Relu_output_0",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 256, 2, 2]> : vector<4xindex>
        },
        {
          Name = "onnx::Conv_627",
          UnknownDataFormat = true,
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1024, 256, 1, 1]> : vector<4xindex>
        },
        {
          Name = "onnx::Conv_628",
          UnknownDataFormat = true
        },
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          Name = "/layer3/layer3.5/Add_output_0",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 1024, 2, 2]> : vector<4xindex>
        }
      ],
      OutputName = "/layer3/layer3.5/Add",
      Reason = "InCoreChain",
      Results = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          Name = "/layer3/layer3.5/Add_output_0",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 1024, 2, 2]> : vector<4xindex>
        }
      ],
      TilingRecipe = {
        "conv-spatial-2d" = false,
        "conv-split-stamps" = true,
        "conv-split-stamps-OC-only" = false,
        "conv-split-stamps-OH-only" = false,
        "convtype-set-by-overlay-heuristic" = false,
        "disable-oh-spatial" = false,
        "disable-ow-spatial" = false,
        "dwc-split-stamps" = false,
        "elt-split-stamps" = true,
        "fm-superiters" = false,
        "icw-superiters" = false,
        "ocw-superiters" = true,
        "ow-superiters" = false,
        "pool-split-stamps" = false,
        "reduce-split-stamps" = false
      },
      logical_mode = "2x_4x4_1x4_vertBroadcastLeft_horizBroadcastRight",
      memory_configuration = {
        L1 = {layout = "strictlegacy"},
        L2 = {ifm_buffering = "single", layout = "flexible", limited_wts_space = false, ofm_buffering = "single", weights_buffering = "double"}
      }} {
      %169 = xten_nn.subgraph (%arg5 = %arg1: tensor<1x256x2x2xbf16>, %arg6 = %arg2: tensor<1024x256x1x1xbf16>, %arg7 = %arg3: tensor<1024xbf16>)  attributes {
        Dilations = array<i64: 1, 1>,
        HWPadding = [[0, 0], [0, 0]],
        LayerName = "/layer3/layer3.5/conv3/Conv",
        Operands = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer3/layer3.5/relu_1/Relu_output_0",
            Port = "data_io.ifm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 256, 2, 2]> : vector<4xindex>
          },
          {
            Name = "onnx::Conv_627",
            Port = "data_io.wts",
            SubPort = "wts_data",
            UnknownDataFormat = true,
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1024, 256, 1, 1]> : vector<4xindex>
          },
          {
            Name = "onnx::Conv_628",
            Port = "data_io.wts",
            SubPort = "bias",
            UnknownDataFormat = true
          }
        ],
        OutputName = "/layer3/layer3.5/conv3/Conv",
        Reason = "MllibKernel",
        Results = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer3/layer3.5/conv3/Conv_output_0",
            Port = "data_io.ofm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 1024, 2, 2]> : vector<4xindex>
          }
        ],
        Specializes = "Conv2DBf16",
        Traits = {
          AllowDMAOptimization = true
        },
        With = {
          config.AIE_API_EMULATE_BFLOAT16_MMUL_WITH_BFP16 = 1 : ui8,
          config.act = 0 : ui8,
          config.act_type = "RELU",
          config.aie_arch = "aie2p",
          config.batch_size = 1 : ui8,
          config.compiler = "peano",
          config.conv_type = [0 : ui8, 12 : ui8, 64 : ui8],
          config.dtype_ifm = "bfloat16",
          config.dtype_ofm = "bfloat16",
          config.dtype_wts = "bfloat16",
          config.enable_bfp16_wts = 0 : ui8,
          config.ksize.height = 1 : ui8,
          config.ksize.width = 1 : ui8,
          config.lrelu_alpha = 1.000000e+00 : f32,
          config.stride_h = 1 : ui8,
          config.stride_w = 1 : ui8
        }} {
        %171 = "tosa.const"() <{value = dense<[0, 3, 1, 2]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc248)
        %172 = "tosa.const"() <{value = dense<[0, 2, 3, 1]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc248)
        %173 = tosa.reshape %arg6 {new_shape = array<i64: 1024, 1, 1, 256>} : (tensor<1024x256x1x1xbf16>) -> tensor<1024x1x1x256xbf16> loc(#loc446)
        %174 = tosa.transpose %arg5, %172 : (tensor<1x256x2x2xbf16>, tensor<4xi32>) -> tensor<1x2x2x256xbf16> loc(#loc446)
        %175 = tosa.conv2d %174, %173, %arg7 {
          PartOfLayerName = "/layer3/layer3.5/conv3/Conv",
          PartOfOutputName = "/layer3/layer3.5/conv3/Conv",
          acc_type = f32,
          dilation = array<i64: 1, 1>,
          pad = array<i64: 0, 0, 0, 0>,
          stride = array<i64: 1, 1>} : (tensor<1x2x2x256xbf16>, tensor<1024x1x1x256xbf16>, tensor<1024xbf16>) -> tensor<1x2x2x1024xbf16> loc(#loc446)
        %176 = tosa.transpose %175, %171 : (tensor<1x2x2x1024xbf16>, tensor<4xi32>) -> tensor<1x1024x2x2xbf16> loc(#loc446)
        xten_nn.output %176 : tensor<1x1024x2x2xbf16> loc(#loc446)
      } -> tensor<1x1024x2x2xbf16> loc(#loc446)
      %170 = xten_nn.subgraph (%arg5 = %169: tensor<1x1024x2x2xbf16>, %arg6 = %arg4: tensor<1x1024x2x2xbf16>)  attributes {
        LayerName = "/layer3/layer3.5/relu_2/Relu",
        Operands = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer3/layer3.5/Add_output_0",
            Port = "data_io.ifm1",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 1024, 2, 2]> : vector<4xindex>
          },
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer3/layer3.5/Add_output_0",
            Port = "data_io.ifm2",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 1024, 2, 2]> : vector<4xindex>
          }
        ],
        OutputName = "/layer3/layer3.5/Add",
        Reason = "MllibKernel",
        Results = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer3/layer3.5/Add_output_0",
            Port = "data_io.ofm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 1024, 2, 2]> : vector<4xindex>
          }
        ],
        Specializes = "AddBf16",
        Traits = {
          Binary = true,
          Elementwise = true,
          NonNegativeOut = true
        },
        With = {
          config.act = 1 : ui8,
          config.act_type = "RELU",
          config.aie_arch = "aie2p",
          config.compiler = "peano",
          config.dtype = "bfloat16"
        }} {
        %171 = tosa.add %arg5, %arg6 {LayerName = "/layer3/layer3.5/Add", OutputName = "/layer3/layer3.5/Add"} : (tensor<1x1024x2x2xbf16>, tensor<1x1024x2x2xbf16>) -> tensor<1x1024x2x2xbf16> loc(#loc448)
        %172 = tosa.clamp %171 {
          LayerName = "/layer3/layer3.5/relu_2/Relu",
          OutputName = "/layer3/layer3.5/relu_2/Relu",
          max_fp = 3.40282347E+38 : f32,
          max_int = 2147483647 : i64,
          min_fp = 0.000000e+00 : f32,
          min_int = 0 : i64} : (tensor<1x1024x2x2xbf16>) -> tensor<1x1024x2x2xbf16> loc(#loc449)
        xten_nn.output %172 : tensor<1x1024x2x2xbf16> loc(#loc449)
      } -> tensor<1x1024x2x2xbf16> loc(#loc447)
      xten_nn.output %170 : tensor<1x1024x2x2xbf16> loc(#loc447)
    } -> tensor<1x1024x2x2xbf16> loc(#loc445)
    %154 = xten_nn.subgraph (%arg1 = %153: tensor<1x1024x2x2xbf16>, %arg2 = %12: tensor<512x1024x1x1xbf16>, %arg3 = %99: tensor<512xbf16>)  attributes {
      IfmOperands = [0 : index],
      LayerName = "/layer4/layer4.0/relu/Relu",
      Operands = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 1024, 2, 2]> : vector<4xindex>
        },
        {
          UnknownDataFormat = true,
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[512, 1024, 1, 1]> : vector<4xindex>
        },
        {
          UnknownDataFormat = true
        }
      ],
      OutputName = "/layer4/layer4.0/conv1/Conv",
      Reason = "InCoreChain",
      Results = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          Name = "/layer4/layer4.0/conv1/Conv_output_0",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 512, 2, 2]> : vector<4xindex>
        }
      ],
      TilingRecipe = {
        "conv-spatial-2d" = false,
        "conv-split-stamps" = true,
        "conv-split-stamps-OC-only" = false,
        "conv-split-stamps-OH-only" = false,
        "convtype-set-by-overlay-heuristic" = false,
        "disable-oh-spatial" = false,
        "disable-ow-spatial" = false,
        "dwc-split-stamps" = false,
        "elt-split-stamps" = true,
        "fm-superiters" = false,
        "icw-superiters" = false,
        "ocw-superiters" = true,
        "ow-superiters" = false,
        "pool-split-stamps" = false,
        "reduce-split-stamps" = false
      },
      logical_mode = "2x_4x4_1x4_vertBroadcastLeft_horizBroadcastRight",
      memory_configuration = {
        L1 = {layout = "strictlegacy"},
        L2 = {ifm_buffering = "single", layout = "flexible", limited_wts_space = false, ofm_buffering = "single", weights_buffering = "double"}
      }} {
      %169 = xten_nn.subgraph (%arg4 = %arg1: tensor<1x1024x2x2xbf16>, %arg5 = %arg2: tensor<512x1024x1x1xbf16>, %arg6 = %arg3: tensor<512xbf16>)  attributes {
        Dilations = array<i64: 1, 1>,
        HWPadding = [[0, 0], [0, 0]],
        LayerName = "/layer4/layer4.0/relu/Relu",
        Operands = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Port = "data_io.ifm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 1024, 2, 2]> : vector<4xindex>
          },
          {
            Port = "data_io.wts",
            SubPort = "wts_data",
            UnknownDataFormat = true,
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[512, 1024, 1, 1]> : vector<4xindex>
          },
          {
            Port = "data_io.wts",
            SubPort = "bias",
            UnknownDataFormat = true
          }
        ],
        OutputName = "/layer4/layer4.0/conv1/Conv",
        Reason = "MllibKernel",
        Results = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer4/layer4.0/conv1/Conv_output_0",
            Port = "data_io.ofm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 512, 2, 2]> : vector<4xindex>
          }
        ],
        Specializes = "Conv2DBf16",
        Traits = {
          AllowDMAOptimization = true,
          NonNegativeOut = true
        },
        With = {
          config.AIE_API_EMULATE_BFLOAT16_MMUL_WITH_BFP16 = 1 : ui8,
          config.act = 1 : ui8,
          config.act_type = "RELU",
          config.aie_arch = "aie2p",
          config.batch_size = 1 : ui8,
          config.compiler = "peano",
          config.conv_type = [0 : ui8, 12 : ui8, 64 : ui8],
          config.dtype_ifm = "bfloat16",
          config.dtype_ofm = "bfloat16",
          config.dtype_wts = "bfloat16",
          config.enable_bfp16_wts = 0 : ui8,
          config.ksize.height = 1 : ui8,
          config.ksize.width = 1 : ui8,
          config.lrelu_alpha = 0.000000e+00 : f32,
          config.stride_h = 1 : ui8,
          config.stride_w = 1 : ui8
        }} {
        %170 = "tosa.const"() <{value = dense<[0, 3, 1, 2]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc248)
        %171 = "tosa.const"() <{value = dense<[0, 2, 3, 1]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc248)
        %172 = tosa.reshape %arg5 {new_shape = array<i64: 512, 1, 1, 1024>} : (tensor<512x1024x1x1xbf16>) -> tensor<512x1x1x1024xbf16> loc(#loc450)
        %173 = tosa.transpose %arg4, %171 : (tensor<1x1024x2x2xbf16>, tensor<4xi32>) -> tensor<1x2x2x1024xbf16> loc(#loc450)
        %174 = tosa.conv2d %173, %172, %arg6 {
          PartOfLayerName = "/layer4/layer4.0/conv1/Conv",
          PartOfOutputName = "/layer4/layer4.0/conv1/Conv",
          acc_type = f32,
          dilation = array<i64: 1, 1>,
          pad = array<i64: 0, 0, 0, 0>,
          stride = array<i64: 1, 1>} : (tensor<1x2x2x1024xbf16>, tensor<512x1x1x1024xbf16>, tensor<512xbf16>) -> tensor<1x2x2x512xbf16> loc(#loc451)
        %175 = tosa.clamp %174 {
          LayerName = "/layer4/layer4.0/relu/Relu",
          OutputName = "/layer4/layer4.0/relu/Relu",
          max_fp = 3.40282347E+38 : f32,
          max_int = 2147483647 : i64,
          min_fp = 0.000000e+00 : f32,
          min_int = 0 : i64} : (tensor<1x2x2x512xbf16>) -> tensor<1x2x2x512xbf16> loc(#loc452)
        %176 = tosa.transpose %175, %170 : (tensor<1x2x2x512xbf16>, tensor<4xi32>) -> tensor<1x512x2x2xbf16> loc(#loc450)
        xten_nn.output %176 : tensor<1x512x2x2xbf16> loc(#loc452)
      } -> tensor<1x512x2x2xbf16> loc(#loc450)
      xten_nn.output %169 : tensor<1x512x2x2xbf16> loc(#loc450)
    } -> tensor<1x512x2x2xbf16> loc(#loc450)
    %155 = xten_nn.subgraph (%arg1 = %154: tensor<1x512x2x2xbf16>, %arg2 = %11: tensor<512x512x3x3xbf16>, %arg3 = %60: tensor<512xbf16>)  attributes {
      IfmOperands = [0 : index],
      LayerName = "/layer4/layer4.0/relu_1/Relu",
      Operands = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 512, 2, 2]> : vector<4xindex>
        },
        {
          UnknownDataFormat = true,
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[512, 512, 3, 3]> : vector<4xindex>
        },
        {
          UnknownDataFormat = true
        }
      ],
      OutputName = "/layer4/layer4.0/conv2/Conv",
      Reason = "InCoreChain",
      Results = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          Name = "/layer4/layer4.0/conv2/Conv_output_0",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 512, 1, 1]> : vector<4xindex>
        }
      ],
      TilingRecipe = {
        "conv-spatial-2d" = false,
        "conv-split-stamps" = true,
        "conv-split-stamps-OC-only" = false,
        "conv-split-stamps-OH-only" = false,
        "convtype-set-by-overlay-heuristic" = false,
        "disable-oh-spatial" = false,
        "disable-ow-spatial" = false,
        "dwc-split-stamps" = false,
        "elt-split-stamps" = true,
        "fm-superiters" = false,
        "icw-superiters" = true,
        "ocw-superiters" = true,
        "ow-superiters" = false,
        "pool-split-stamps" = false,
        "reduce-split-stamps" = false
      },
      logical_mode = "2x_4x4_1x4_vertBroadcastLeft_horizBroadcastRight",
      memory_configuration = {
        L1 = {layout = "strictlegacy"},
        L2 = {ifm_buffering = "single", layout = "flexible", limited_wts_space = false, ofm_buffering = "single", weights_buffering = "double"}
      }} {
      %169 = xten_nn.subgraph (%arg4 = %arg1: tensor<1x512x2x2xbf16>, %arg5 = %arg2: tensor<512x512x3x3xbf16>, %arg6 = %arg3: tensor<512xbf16>)  attributes {
        Dilations = array<i64: 1, 1>,
        HWPadding = [[1, 0], [1, 0]],
        LayerName = "/layer4/layer4.0/relu_1/Relu",
        Operands = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Port = "data_io.ifm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 512, 2, 2]> : vector<4xindex>
          },
          {
            Port = "data_io.wts",
            SubPort = "wts_data",
            UnknownDataFormat = true,
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[512, 512, 3, 3]> : vector<4xindex>
          },
          {
            Port = "data_io.wts",
            SubPort = "bias",
            UnknownDataFormat = true
          }
        ],
        OutputName = "/layer4/layer4.0/conv2/Conv",
        Reason = "MllibKernel",
        Results = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer4/layer4.0/conv2/Conv_output_0",
            Port = "data_io.ofm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 512, 1, 1]> : vector<4xindex>
          }
        ],
        Specializes = "Conv2DBf16",
        Traits = {
          AllowDMAOptimization = true,
          NonNegativeOut = true
        },
        With = {
          config.AIE_API_EMULATE_BFLOAT16_MMUL_WITH_BFP16 = 1 : ui8,
          config.act = 1 : ui8,
          config.act_type = "RELU",
          config.aie_arch = "aie2p",
          config.batch_size = 1 : ui8,
          config.compiler = "peano",
          config.conv_type = [0 : ui8, 12 : ui8, 64 : ui8],
          config.dtype_ifm = "bfloat16",
          config.dtype_ofm = "bfloat16",
          config.dtype_wts = "bfloat16",
          config.enable_bfp16_wts = 0 : ui8,
          config.ksize.height = 3 : ui8,
          config.ksize.width = 3 : ui8,
          config.lrelu_alpha = 0.000000e+00 : f32,
          config.stride_h = 2 : ui8,
          config.stride_w = 2 : ui8
        }} {
        %170 = "tosa.const"() <{value = dense<[0, 2, 3, 1]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc248)
        %171 = tosa.transpose %arg5, %170 : (tensor<512x512x3x3xbf16>, tensor<4xi32>) -> tensor<512x3x3x512xbf16> loc(#loc453)
        %172 = tosa.transpose %arg4, %170 : (tensor<1x512x2x2xbf16>, tensor<4xi32>) -> tensor<1x2x2x512xbf16> loc(#loc453)
        %173 = tosa.conv2d %172, %171, %arg6 {
          OutputName = "/layer4/layer4.0/conv2/Conv",
          PartOfLayerName = "/layer4/layer4.0/conv2/Conv",
          acc_type = f32,
          dilation = array<i64: 1, 1>,
          pad = array<i64: 1, 0, 1, 0>,
          stride = array<i64: 2, 2>} : (tensor<1x2x2x512xbf16>, tensor<512x3x3x512xbf16>, tensor<512xbf16>) -> tensor<1x1x1x512xbf16> loc(#loc454)
        %174 = tosa.clamp %173 {
          LayerName = "/layer4/layer4.0/relu_1/Relu",
          OutputName = "/layer4/layer4.0/relu_1/Relu",
          max_fp = 3.40282347E+38 : f32,
          max_int = 2147483647 : i64,
          min_fp = 0.000000e+00 : f32,
          min_int = 0 : i64} : (tensor<1x1x1x512xbf16>) -> tensor<1x1x1x512xbf16> loc(#loc455)
        %175 = tosa.reshape %174 {new_shape = array<i64: 1, 512, 1, 1>} : (tensor<1x1x1x512xbf16>) -> tensor<1x512x1x1xbf16> loc(#loc453)
        xten_nn.output %175 : tensor<1x512x1x1xbf16> loc(#loc455)
      } -> tensor<1x512x1x1xbf16> loc(#loc453)
      xten_nn.output %169 : tensor<1x512x1x1xbf16> loc(#loc453)
    } -> tensor<1x512x1x1xbf16> loc(#loc453)
    %156 = xten_nn.subgraph (%arg1 = %153: tensor<1x1024x2x2xbf16>, %arg2 = %9: tensor<2048x1024x1x1xbf16>, %arg3 = %97: tensor<2048xbf16>)  attributes {
      IfmOperands = [0 : index],
      LayerName = "/layer4/layer4.0/downsample/downsample.0/Conv",
      Operands = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          Name = "/layer3/layer3.5/relu_2/Relu_output_0",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 1024, 2, 2]> : vector<4xindex>
        },
        {
          Name = "onnx::Conv_639",
          UnknownDataFormat = true,
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[2048, 1024, 1, 1]> : vector<4xindex>
        },
        {
          Name = "onnx::Conv_640",
          UnknownDataFormat = true
        }
      ],
      OutputName = "/layer4/layer4.0/downsample/downsample.0/Conv",
      Reason = "InCoreChain",
      Results = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          Name = "/layer4/layer4.0/downsample/downsample.0/Conv_output_0",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 2048, 1, 1]> : vector<4xindex>
        }
      ],
      TilingRecipe = {
        "conv-spatial-2d" = false,
        "conv-split-stamps" = true,
        "conv-split-stamps-OC-only" = false,
        "conv-split-stamps-OH-only" = false,
        "convtype-set-by-overlay-heuristic" = false,
        "disable-oh-spatial" = false,
        "disable-ow-spatial" = false,
        "dwc-split-stamps" = false,
        "elt-split-stamps" = true,
        "fm-superiters" = false,
        "icw-superiters" = false,
        "ocw-superiters" = true,
        "ow-superiters" = false,
        "pool-split-stamps" = false,
        "reduce-split-stamps" = false
      },
      logical_mode = "2x_4x4_1x4_vertBroadcastLeft_horizBroadcastRight",
      memory_configuration = {
        L1 = {layout = "strictlegacy"},
        L2 = {ifm_buffering = "single", layout = "flexible", limited_wts_space = false, ofm_buffering = "single", weights_buffering = "double"}
      }} {
      %169 = xten_nn.subgraph (%arg4 = %arg1: tensor<1x1024x2x2xbf16>, %arg5 = %arg2: tensor<2048x1024x1x1xbf16>, %arg6 = %arg3: tensor<2048xbf16>)  attributes {
        Dilations = array<i64: 1, 1>,
        HWPadding = [[0, 0], [0, 0]],
        LayerName = "/layer4/layer4.0/downsample/downsample.0/Conv",
        Operands = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer3/layer3.5/relu_2/Relu_output_0",
            Port = "data_io.ifm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 1024, 2, 2]> : vector<4xindex>
          },
          {
            Name = "onnx::Conv_639",
            Port = "data_io.wts",
            SubPort = "wts_data",
            UnknownDataFormat = true,
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[2048, 1024, 1, 1]> : vector<4xindex>
          },
          {
            Name = "onnx::Conv_640",
            Port = "data_io.wts",
            SubPort = "bias",
            UnknownDataFormat = true
          }
        ],
        OutputName = "/layer4/layer4.0/downsample/downsample.0/Conv",
        Reason = "MllibKernel",
        Results = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer4/layer4.0/downsample/downsample.0/Conv_output_0",
            Port = "data_io.ofm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 2048, 1, 1]> : vector<4xindex>
          }
        ],
        Specializes = "Conv2DBf16",
        Traits = {
          AllowDMAOptimization = true
        },
        With = {
          config.AIE_API_EMULATE_BFLOAT16_MMUL_WITH_BFP16 = 1 : ui8,
          config.act = 0 : ui8,
          config.act_type = "RELU",
          config.aie_arch = "aie2p",
          config.batch_size = 1 : ui8,
          config.compiler = "peano",
          config.conv_type = [0 : ui8, 12 : ui8, 64 : ui8],
          config.dtype_ifm = "bfloat16",
          config.dtype_ofm = "bfloat16",
          config.dtype_wts = "bfloat16",
          config.enable_bfp16_wts = 0 : ui8,
          config.ksize.height = 1 : ui8,
          config.ksize.width = 1 : ui8,
          config.lrelu_alpha = 1.000000e+00 : f32,
          config.stride_h = 2 : ui8,
          config.stride_w = 2 : ui8
        }} {
        %170 = tosa.slice %arg4 {
          PartOfLayerName = "/layer4/layer4.0/downsample/downsample.0/Conv",
          size = array<i64: 1, 1024, 1, 1>,
          start = array<i64: 0, 0, 0, 0>} : (tensor<1x1024x2x2xbf16>) -> tensor<1x1024x1x1xbf16> loc(#loc456)
        %171 = tosa.reshape %arg5 {new_shape = array<i64: 2048, 1, 1, 1024>} : (tensor<2048x1024x1x1xbf16>) -> tensor<2048x1x1x1024xbf16> loc(#loc456)
        %172 = tosa.reshape %170 {new_shape = array<i64: 1, 1, 1, 1024>} : (tensor<1x1024x1x1xbf16>) -> tensor<1x1x1x1024xbf16> loc(#loc456)
        %173 = tosa.conv2d %172, %171, %arg6 {
          OutputName = "/layer4/layer4.0/downsample/downsample.0/Conv",
          PartOfLayerName = "/layer4/layer4.0/downsample/downsample.0/Conv",
          acc_type = f32,
          dilation = array<i64: 1, 1>,
          pad = array<i64: 0, 0, 0, 0>,
          stride = array<i64: 2, 2>} : (tensor<1x1x1x1024xbf16>, tensor<2048x1x1x1024xbf16>, tensor<2048xbf16>) -> tensor<1x1x1x2048xbf16> loc(#loc456)
        %174 = tosa.reshape %173 {new_shape = array<i64: 1, 2048, 1, 1>} : (tensor<1x1x1x2048xbf16>) -> tensor<1x2048x1x1xbf16> loc(#loc456)
        xten_nn.output %174 : tensor<1x2048x1x1xbf16> loc(#loc456)
      } -> tensor<1x2048x1x1xbf16> loc(#loc456)
      xten_nn.output %169 : tensor<1x2048x1x1xbf16> loc(#loc456)
    } -> tensor<1x2048x1x1xbf16> loc(#loc456)
    %157 = xten_nn.subgraph (%arg1 = %155: tensor<1x512x1x1xbf16>, %arg2 = %10: tensor<2048x512x1x1xbf16>, %arg3 = %100: tensor<2048xbf16>, %arg4 = %156: tensor<1x2048x1x1xbf16>)  attributes {
      IfmOperands = [0 : index, 3 : index],
      LayerName = "/layer4/layer4.0/conv3/Conv",
      OfmShare = 3 : index,
      Operands = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          Name = "/layer4/layer4.0/relu_1/Relu_output_0",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 512, 1, 1]> : vector<4xindex>
        },
        {
          Name = "onnx::Conv_636",
          UnknownDataFormat = true,
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[2048, 512, 1, 1]> : vector<4xindex>
        },
        {
          Name = "onnx::Conv_637",
          UnknownDataFormat = true
        },
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          Name = "/layer4/layer4.0/Add_output_0",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 2048, 1, 1]> : vector<4xindex>
        }
      ],
      OutputName = "/layer4/layer4.0/Add",
      Reason = "InCoreChain",
      Results = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          Name = "/layer4/layer4.0/Add_output_0",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 2048, 1, 1]> : vector<4xindex>
        }
      ],
      TilingRecipe = {
        "conv-spatial-2d" = false,
        "conv-split-stamps" = true,
        "conv-split-stamps-OC-only" = false,
        "conv-split-stamps-OH-only" = false,
        "convtype-set-by-overlay-heuristic" = false,
        "disable-oh-spatial" = false,
        "disable-ow-spatial" = false,
        "dwc-split-stamps" = false,
        "elt-split-stamps" = true,
        "fm-superiters" = false,
        "icw-superiters" = false,
        "ocw-superiters" = true,
        "ow-superiters" = false,
        "pool-split-stamps" = false,
        "reduce-split-stamps" = false
      },
      logical_mode = "2x_4x4_1x4_vertBroadcastLeft_horizBroadcastRight",
      memory_configuration = {
        L1 = {layout = "strictlegacy"},
        L2 = {ifm_buffering = "single", layout = "flexible", limited_wts_space = false, ofm_buffering = "single", weights_buffering = "double"}
      }} {
      %169 = xten_nn.subgraph (%arg5 = %arg1: tensor<1x512x1x1xbf16>, %arg6 = %arg2: tensor<2048x512x1x1xbf16>, %arg7 = %arg3: tensor<2048xbf16>)  attributes {
        Dilations = array<i64: 1, 1>,
        HWPadding = [[0, 0], [0, 0]],
        LayerName = "/layer4/layer4.0/conv3/Conv",
        Operands = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer4/layer4.0/relu_1/Relu_output_0",
            Port = "data_io.ifm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 512, 1, 1]> : vector<4xindex>
          },
          {
            Name = "onnx::Conv_636",
            Port = "data_io.wts",
            SubPort = "wts_data",
            UnknownDataFormat = true,
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[2048, 512, 1, 1]> : vector<4xindex>
          },
          {
            Name = "onnx::Conv_637",
            Port = "data_io.wts",
            SubPort = "bias",
            UnknownDataFormat = true
          }
        ],
        OutputName = "/layer4/layer4.0/conv3/Conv",
        Reason = "MllibKernel",
        Results = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer4/layer4.0/conv3/Conv_output_0",
            Port = "data_io.ofm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 2048, 1, 1]> : vector<4xindex>
          }
        ],
        Specializes = "Conv2DBf16",
        Traits = {
          AllowDMAOptimization = true
        },
        With = {
          config.AIE_API_EMULATE_BFLOAT16_MMUL_WITH_BFP16 = 1 : ui8,
          config.act = 0 : ui8,
          config.act_type = "RELU",
          config.aie_arch = "aie2p",
          config.batch_size = 1 : ui8,
          config.compiler = "peano",
          config.conv_type = [0 : ui8, 12 : ui8, 64 : ui8],
          config.dtype_ifm = "bfloat16",
          config.dtype_ofm = "bfloat16",
          config.dtype_wts = "bfloat16",
          config.enable_bfp16_wts = 0 : ui8,
          config.ksize.height = 1 : ui8,
          config.ksize.width = 1 : ui8,
          config.lrelu_alpha = 1.000000e+00 : f32,
          config.stride_h = 1 : ui8,
          config.stride_w = 1 : ui8
        }} {
        %171 = tosa.reshape %arg6 {new_shape = array<i64: 2048, 1, 1, 512>} : (tensor<2048x512x1x1xbf16>) -> tensor<2048x1x1x512xbf16> loc(#loc458)
        %172 = tosa.reshape %arg5 {new_shape = array<i64: 1, 1, 1, 512>} : (tensor<1x512x1x1xbf16>) -> tensor<1x1x1x512xbf16> loc(#loc458)
        %173 = tosa.conv2d %172, %171, %arg7 {
          LayerName = "/layer4/layer4.0/conv3/Conv",
          OutputName = "/layer4/layer4.0/conv3/Conv",
          acc_type = f32,
          dilation = array<i64: 1, 1>,
          pad = array<i64: 0, 0, 0, 0>,
          stride = array<i64: 1, 1>} : (tensor<1x1x1x512xbf16>, tensor<2048x1x1x512xbf16>, tensor<2048xbf16>) -> tensor<1x1x1x2048xbf16> loc(#loc458)
        %174 = tosa.reshape %173 {new_shape = array<i64: 1, 2048, 1, 1>} : (tensor<1x1x1x2048xbf16>) -> tensor<1x2048x1x1xbf16> loc(#loc458)
        xten_nn.output %174 : tensor<1x2048x1x1xbf16> loc(#loc458)
      } -> tensor<1x2048x1x1xbf16> loc(#loc458)
      %170 = xten_nn.subgraph (%arg5 = %169: tensor<1x2048x1x1xbf16>, %arg6 = %arg4: tensor<1x2048x1x1xbf16>)  attributes {
        LayerName = "/layer4/layer4.0/relu_2/Relu",
        Operands = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer4/layer4.0/Add_output_0",
            Port = "data_io.ifm1",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 2048, 1, 1]> : vector<4xindex>
          },
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer4/layer4.0/Add_output_0",
            Port = "data_io.ifm2",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 2048, 1, 1]> : vector<4xindex>
          }
        ],
        OutputName = "/layer4/layer4.0/Add",
        Reason = "MllibKernel",
        Results = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer4/layer4.0/Add_output_0",
            Port = "data_io.ofm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 2048, 1, 1]> : vector<4xindex>
          }
        ],
        Specializes = "AddBf16",
        Traits = {
          Binary = true,
          Elementwise = true,
          NonNegativeOut = true
        },
        With = {
          config.act = 1 : ui8,
          config.act_type = "RELU",
          config.aie_arch = "aie2p",
          config.compiler = "peano",
          config.dtype = "bfloat16"
        }} {
        %171 = tosa.add %arg5, %arg6 {LayerName = "/layer4/layer4.0/Add", OutputName = "/layer4/layer4.0/Add"} : (tensor<1x2048x1x1xbf16>, tensor<1x2048x1x1xbf16>) -> tensor<1x2048x1x1xbf16> loc(#loc460)
        %172 = tosa.clamp %171 {
          LayerName = "/layer4/layer4.0/relu_2/Relu",
          OutputName = "/layer4/layer4.0/relu_2/Relu",
          max_fp = 3.40282347E+38 : f32,
          max_int = 2147483647 : i64,
          min_fp = 0.000000e+00 : f32,
          min_int = 0 : i64} : (tensor<1x2048x1x1xbf16>) -> tensor<1x2048x1x1xbf16> loc(#loc461)
        xten_nn.output %172 : tensor<1x2048x1x1xbf16> loc(#loc461)
      } -> tensor<1x2048x1x1xbf16> loc(#loc459)
      xten_nn.output %170 : tensor<1x2048x1x1xbf16> loc(#loc459)
    } -> tensor<1x2048x1x1xbf16> loc(#loc457)
    %158 = xten_nn.subgraph (%arg1 = %157: tensor<1x2048x1x1xbf16>, %arg2 = %8: tensor<512x2048x1x1xbf16>, %arg3 = %101: tensor<512xbf16>)  attributes {
      IfmOperands = [0 : index],
      LayerName = "/layer4/layer4.1/relu/Relu",
      Operands = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 2048, 1, 1]> : vector<4xindex>
        },
        {
          UnknownDataFormat = true,
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[512, 2048, 1, 1]> : vector<4xindex>
        },
        {
          UnknownDataFormat = true
        }
      ],
      OutputName = "/layer4/layer4.1/conv1/Conv",
      Reason = "InCoreChain",
      Results = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          Name = "/layer4/layer4.1/conv1/Conv_output_0",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 512, 1, 1]> : vector<4xindex>
        }
      ],
      TilingRecipe = {
        "conv-spatial-2d" = false,
        "conv-split-stamps" = true,
        "conv-split-stamps-OC-only" = false,
        "conv-split-stamps-OH-only" = false,
        "convtype-set-by-overlay-heuristic" = false,
        "disable-oh-spatial" = false,
        "disable-ow-spatial" = false,
        "dwc-split-stamps" = false,
        "elt-split-stamps" = true,
        "fm-superiters" = false,
        "icw-superiters" = false,
        "ocw-superiters" = true,
        "ow-superiters" = false,
        "pool-split-stamps" = false,
        "reduce-split-stamps" = false
      },
      logical_mode = "2x_4x4_1x4_vertBroadcastLeft_horizBroadcastRight",
      memory_configuration = {
        L1 = {layout = "strictlegacy"},
        L2 = {ifm_buffering = "single", layout = "flexible", limited_wts_space = false, ofm_buffering = "single", weights_buffering = "double"}
      }} {
      %169 = xten_nn.subgraph (%arg4 = %arg1: tensor<1x2048x1x1xbf16>, %arg5 = %arg2: tensor<512x2048x1x1xbf16>, %arg6 = %arg3: tensor<512xbf16>)  attributes {
        Dilations = array<i64: 1, 1>,
        HWPadding = [[0, 0], [0, 0]],
        LayerName = "/layer4/layer4.1/relu/Relu",
        Operands = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Port = "data_io.ifm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 2048, 1, 1]> : vector<4xindex>
          },
          {
            Port = "data_io.wts",
            SubPort = "wts_data",
            UnknownDataFormat = true,
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[512, 2048, 1, 1]> : vector<4xindex>
          },
          {
            Port = "data_io.wts",
            SubPort = "bias",
            UnknownDataFormat = true
          }
        ],
        OutputName = "/layer4/layer4.1/conv1/Conv",
        Reason = "MllibKernel",
        Results = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer4/layer4.1/conv1/Conv_output_0",
            Port = "data_io.ofm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 512, 1, 1]> : vector<4xindex>
          }
        ],
        Specializes = "Conv2DBf16",
        Traits = {
          AllowDMAOptimization = true,
          NonNegativeOut = true
        },
        With = {
          config.AIE_API_EMULATE_BFLOAT16_MMUL_WITH_BFP16 = 1 : ui8,
          config.act = 1 : ui8,
          config.act_type = "RELU",
          config.aie_arch = "aie2p",
          config.batch_size = 1 : ui8,
          config.compiler = "peano",
          config.conv_type = [0 : ui8, 12 : ui8, 64 : ui8],
          config.dtype_ifm = "bfloat16",
          config.dtype_ofm = "bfloat16",
          config.dtype_wts = "bfloat16",
          config.enable_bfp16_wts = 0 : ui8,
          config.ksize.height = 1 : ui8,
          config.ksize.width = 1 : ui8,
          config.lrelu_alpha = 0.000000e+00 : f32,
          config.stride_h = 1 : ui8,
          config.stride_w = 1 : ui8
        }} {
        %170 = tosa.reshape %arg5 {new_shape = array<i64: 512, 1, 1, 2048>} : (tensor<512x2048x1x1xbf16>) -> tensor<512x1x1x2048xbf16> loc(#loc462)
        %171 = tosa.reshape %arg4 {new_shape = array<i64: 1, 1, 1, 2048>} : (tensor<1x2048x1x1xbf16>) -> tensor<1x1x1x2048xbf16> loc(#loc462)
        %172 = tosa.conv2d %171, %170, %arg6 {
          LayerName = "/layer4/layer4.1/conv1/Conv",
          OutputName = "/layer4/layer4.1/conv1/Conv",
          acc_type = f32,
          dilation = array<i64: 1, 1>,
          pad = array<i64: 0, 0, 0, 0>,
          stride = array<i64: 1, 1>} : (tensor<1x1x1x2048xbf16>, tensor<512x1x1x2048xbf16>, tensor<512xbf16>) -> tensor<1x1x1x512xbf16> loc(#loc463)
        %173 = tosa.clamp %172 {
          LayerName = "/layer4/layer4.1/relu/Relu",
          OutputName = "/layer4/layer4.1/relu/Relu",
          max_fp = 3.40282347E+38 : f32,
          max_int = 2147483647 : i64,
          min_fp = 0.000000e+00 : f32,
          min_int = 0 : i64} : (tensor<1x1x1x512xbf16>) -> tensor<1x1x1x512xbf16> loc(#loc464)
        %174 = tosa.reshape %173 {new_shape = array<i64: 1, 512, 1, 1>} : (tensor<1x1x1x512xbf16>) -> tensor<1x512x1x1xbf16> loc(#loc462)
        xten_nn.output %174 : tensor<1x512x1x1xbf16> loc(#loc464)
      } -> tensor<1x512x1x1xbf16> loc(#loc462)
      xten_nn.output %169 : tensor<1x512x1x1xbf16> loc(#loc462)
    } -> tensor<1x512x1x1xbf16> loc(#loc462)
    %159 = xten_nn.subgraph (%arg1 = %158: tensor<1x512x1x1xbf16>, %arg2 = %7: tensor<512x512x3x3xbf16>, %arg3 = %93: tensor<512xbf16>)  attributes {
      IfmOperands = [0 : index],
      LayerName = "/layer4/layer4.1/relu_1/Relu",
      Operands = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 512, 1, 1]> : vector<4xindex>
        },
        {
          UnknownDataFormat = true,
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[512, 512, 3, 3]> : vector<4xindex>
        },
        {
          UnknownDataFormat = true
        }
      ],
      OutputName = "/layer4/layer4.1/conv2/Conv",
      Reason = "InCoreChain",
      Results = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          Name = "/layer4/layer4.1/conv2/Conv_output_0",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 512, 1, 1]> : vector<4xindex>
        }
      ],
      TilingRecipe = {
        "conv-spatial-2d" = false,
        "conv-split-stamps" = true,
        "conv-split-stamps-OC-only" = false,
        "conv-split-stamps-OH-only" = false,
        "convtype-set-by-overlay-heuristic" = false,
        "disable-oh-spatial" = false,
        "disable-ow-spatial" = false,
        "dwc-split-stamps" = false,
        "elt-split-stamps" = true,
        "fm-superiters" = false,
        "icw-superiters" = true,
        "ocw-superiters" = true,
        "ow-superiters" = false,
        "pool-split-stamps" = false,
        "reduce-split-stamps" = false
      },
      logical_mode = "2x_4x4_1x4_vertBroadcastLeft_horizBroadcastRight",
      memory_configuration = {
        L1 = {layout = "strictlegacy"},
        L2 = {ifm_buffering = "single", layout = "flexible", limited_wts_space = false, ofm_buffering = "single", weights_buffering = "double"}
      }} {
      %169 = xten_nn.subgraph (%arg4 = %arg1: tensor<1x512x1x1xbf16>, %arg5 = %arg2: tensor<512x512x3x3xbf16>, %arg6 = %arg3: tensor<512xbf16>)  attributes {
        Dilations = array<i64: 1, 1>,
        HWPadding = [[1, 1], [1, 1]],
        LayerName = "/layer4/layer4.1/relu_1/Relu",
        Operands = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Port = "data_io.ifm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 512, 1, 1]> : vector<4xindex>
          },
          {
            Port = "data_io.wts",
            SubPort = "wts_data",
            UnknownDataFormat = true,
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[512, 512, 3, 3]> : vector<4xindex>
          },
          {
            Port = "data_io.wts",
            SubPort = "bias",
            UnknownDataFormat = true
          }
        ],
        OutputName = "/layer4/layer4.1/conv2/Conv",
        Reason = "MllibKernel",
        Results = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer4/layer4.1/conv2/Conv_output_0",
            Port = "data_io.ofm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 512, 1, 1]> : vector<4xindex>
          }
        ],
        Specializes = "Conv2DBf16",
        Traits = {
          AllowDMAOptimization = true,
          NonNegativeOut = true
        },
        With = {
          config.AIE_API_EMULATE_BFLOAT16_MMUL_WITH_BFP16 = 1 : ui8,
          config.act = 1 : ui8,
          config.act_type = "RELU",
          config.aie_arch = "aie2p",
          config.batch_size = 1 : ui8,
          config.compiler = "peano",
          config.conv_type = [0 : ui8, 12 : ui8, 64 : ui8],
          config.dtype_ifm = "bfloat16",
          config.dtype_ofm = "bfloat16",
          config.dtype_wts = "bfloat16",
          config.enable_bfp16_wts = 0 : ui8,
          config.ksize.height = 3 : ui8,
          config.ksize.width = 3 : ui8,
          config.lrelu_alpha = 0.000000e+00 : f32,
          config.stride_h = 1 : ui8,
          config.stride_w = 1 : ui8
        }} {
        %170 = "tosa.const"() <{value = dense<[0, 2, 3, 1]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc248)
        %171 = tosa.transpose %arg5, %170 : (tensor<512x512x3x3xbf16>, tensor<4xi32>) -> tensor<512x3x3x512xbf16> loc(#loc465)
        %172 = tosa.reshape %arg4 {new_shape = array<i64: 1, 1, 1, 512>} : (tensor<1x512x1x1xbf16>) -> tensor<1x1x1x512xbf16> loc(#loc465)
        %173 = tosa.conv2d %172, %171, %arg6 {
          OutputName = "/layer4/layer4.1/conv2/Conv",
          PartOfLayerName = "/layer4/layer4.1/conv2/Conv",
          acc_type = f32,
          dilation = array<i64: 1, 1>,
          pad = array<i64: 1, 1, 1, 1>,
          stride = array<i64: 1, 1>} : (tensor<1x1x1x512xbf16>, tensor<512x3x3x512xbf16>, tensor<512xbf16>) -> tensor<1x1x1x512xbf16> loc(#loc466)
        %174 = tosa.clamp %173 {
          LayerName = "/layer4/layer4.1/relu_1/Relu",
          OutputName = "/layer4/layer4.1/relu_1/Relu",
          max_fp = 3.40282347E+38 : f32,
          max_int = 2147483647 : i64,
          min_fp = 0.000000e+00 : f32,
          min_int = 0 : i64} : (tensor<1x1x1x512xbf16>) -> tensor<1x1x1x512xbf16> loc(#loc467)
        %175 = tosa.reshape %174 {new_shape = array<i64: 1, 512, 1, 1>} : (tensor<1x1x1x512xbf16>) -> tensor<1x512x1x1xbf16> loc(#loc465)
        xten_nn.output %175 : tensor<1x512x1x1xbf16> loc(#loc467)
      } -> tensor<1x512x1x1xbf16> loc(#loc465)
      xten_nn.output %169 : tensor<1x512x1x1xbf16> loc(#loc465)
    } -> tensor<1x512x1x1xbf16> loc(#loc465)
    %160 = xten_nn.subgraph (%arg1 = %159: tensor<1x512x1x1xbf16>, %arg2 = %6: tensor<2048x512x1x1xbf16>, %arg3 = %96: tensor<2048xbf16>, %arg4 = %157: tensor<1x2048x1x1xbf16>)  attributes {
      IfmOperands = [0 : index, 3 : index],
      LayerName = "/layer4/layer4.1/conv3/Conv",
      OfmShare = 3 : index,
      Operands = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          Name = "/layer4/layer4.1/relu_1/Relu_output_0",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 512, 1, 1]> : vector<4xindex>
        },
        {
          Name = "onnx::Conv_648",
          UnknownDataFormat = true,
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[2048, 512, 1, 1]> : vector<4xindex>
        },
        {
          Name = "onnx::Conv_649",
          UnknownDataFormat = true
        },
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          Name = "/layer4/layer4.1/Add_output_0",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 2048, 1, 1]> : vector<4xindex>
        }
      ],
      OutputName = "/layer4/layer4.1/Add",
      Reason = "InCoreChain",
      Results = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          Name = "/layer4/layer4.1/Add_output_0",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 2048, 1, 1]> : vector<4xindex>
        }
      ],
      TilingRecipe = {
        "conv-spatial-2d" = false,
        "conv-split-stamps" = true,
        "conv-split-stamps-OC-only" = false,
        "conv-split-stamps-OH-only" = false,
        "convtype-set-by-overlay-heuristic" = false,
        "disable-oh-spatial" = false,
        "disable-ow-spatial" = false,
        "dwc-split-stamps" = false,
        "elt-split-stamps" = true,
        "fm-superiters" = false,
        "icw-superiters" = false,
        "ocw-superiters" = true,
        "ow-superiters" = false,
        "pool-split-stamps" = false,
        "reduce-split-stamps" = false
      },
      logical_mode = "2x_4x4_1x4_vertBroadcastLeft_horizBroadcastRight",
      memory_configuration = {
        L1 = {layout = "strictlegacy"},
        L2 = {ifm_buffering = "single", layout = "flexible", limited_wts_space = false, ofm_buffering = "single", weights_buffering = "double"}
      }} {
      %169 = xten_nn.subgraph (%arg5 = %arg1: tensor<1x512x1x1xbf16>, %arg6 = %arg2: tensor<2048x512x1x1xbf16>, %arg7 = %arg3: tensor<2048xbf16>)  attributes {
        Dilations = array<i64: 1, 1>,
        HWPadding = [[0, 0], [0, 0]],
        LayerName = "/layer4/layer4.1/conv3/Conv",
        Operands = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer4/layer4.1/relu_1/Relu_output_0",
            Port = "data_io.ifm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 512, 1, 1]> : vector<4xindex>
          },
          {
            Name = "onnx::Conv_648",
            Port = "data_io.wts",
            SubPort = "wts_data",
            UnknownDataFormat = true,
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[2048, 512, 1, 1]> : vector<4xindex>
          },
          {
            Name = "onnx::Conv_649",
            Port = "data_io.wts",
            SubPort = "bias",
            UnknownDataFormat = true
          }
        ],
        OutputName = "/layer4/layer4.1/conv3/Conv",
        Reason = "MllibKernel",
        Results = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer4/layer4.1/conv3/Conv_output_0",
            Port = "data_io.ofm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 2048, 1, 1]> : vector<4xindex>
          }
        ],
        Specializes = "Conv2DBf16",
        Traits = {
          AllowDMAOptimization = true
        },
        With = {
          config.AIE_API_EMULATE_BFLOAT16_MMUL_WITH_BFP16 = 1 : ui8,
          config.act = 0 : ui8,
          config.act_type = "RELU",
          config.aie_arch = "aie2p",
          config.batch_size = 1 : ui8,
          config.compiler = "peano",
          config.conv_type = [0 : ui8, 12 : ui8, 64 : ui8],
          config.dtype_ifm = "bfloat16",
          config.dtype_ofm = "bfloat16",
          config.dtype_wts = "bfloat16",
          config.enable_bfp16_wts = 0 : ui8,
          config.ksize.height = 1 : ui8,
          config.ksize.width = 1 : ui8,
          config.lrelu_alpha = 1.000000e+00 : f32,
          config.stride_h = 1 : ui8,
          config.stride_w = 1 : ui8
        }} {
        %171 = tosa.reshape %arg6 {new_shape = array<i64: 2048, 1, 1, 512>} : (tensor<2048x512x1x1xbf16>) -> tensor<2048x1x1x512xbf16> loc(#loc469)
        %172 = tosa.reshape %arg5 {new_shape = array<i64: 1, 1, 1, 512>} : (tensor<1x512x1x1xbf16>) -> tensor<1x1x1x512xbf16> loc(#loc469)
        %173 = tosa.conv2d %172, %171, %arg7 {
          LayerName = "/layer4/layer4.1/conv3/Conv",
          OutputName = "/layer4/layer4.1/conv3/Conv",
          acc_type = f32,
          dilation = array<i64: 1, 1>,
          pad = array<i64: 0, 0, 0, 0>,
          stride = array<i64: 1, 1>} : (tensor<1x1x1x512xbf16>, tensor<2048x1x1x512xbf16>, tensor<2048xbf16>) -> tensor<1x1x1x2048xbf16> loc(#loc469)
        %174 = tosa.reshape %173 {new_shape = array<i64: 1, 2048, 1, 1>} : (tensor<1x1x1x2048xbf16>) -> tensor<1x2048x1x1xbf16> loc(#loc469)
        xten_nn.output %174 : tensor<1x2048x1x1xbf16> loc(#loc469)
      } -> tensor<1x2048x1x1xbf16> loc(#loc469)
      %170 = xten_nn.subgraph (%arg5 = %169: tensor<1x2048x1x1xbf16>, %arg6 = %arg4: tensor<1x2048x1x1xbf16>)  attributes {
        LayerName = "/layer4/layer4.1/relu_2/Relu",
        Operands = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer4/layer4.1/Add_output_0",
            Port = "data_io.ifm1",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 2048, 1, 1]> : vector<4xindex>
          },
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer4/layer4.1/Add_output_0",
            Port = "data_io.ifm2",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 2048, 1, 1]> : vector<4xindex>
          }
        ],
        OutputName = "/layer4/layer4.1/Add",
        Reason = "MllibKernel",
        Results = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer4/layer4.1/Add_output_0",
            Port = "data_io.ofm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 2048, 1, 1]> : vector<4xindex>
          }
        ],
        Specializes = "AddBf16",
        Traits = {
          Binary = true,
          Elementwise = true,
          NonNegativeOut = true
        },
        With = {
          config.act = 1 : ui8,
          config.act_type = "RELU",
          config.aie_arch = "aie2p",
          config.compiler = "peano",
          config.dtype = "bfloat16"
        }} {
        %171 = tosa.add %arg5, %arg6 {LayerName = "/layer4/layer4.1/Add", OutputName = "/layer4/layer4.1/Add"} : (tensor<1x2048x1x1xbf16>, tensor<1x2048x1x1xbf16>) -> tensor<1x2048x1x1xbf16> loc(#loc471)
        %172 = tosa.clamp %171 {
          LayerName = "/layer4/layer4.1/relu_2/Relu",
          OutputName = "/layer4/layer4.1/relu_2/Relu",
          max_fp = 3.40282347E+38 : f32,
          max_int = 2147483647 : i64,
          min_fp = 0.000000e+00 : f32,
          min_int = 0 : i64} : (tensor<1x2048x1x1xbf16>) -> tensor<1x2048x1x1xbf16> loc(#loc472)
        xten_nn.output %172 : tensor<1x2048x1x1xbf16> loc(#loc472)
      } -> tensor<1x2048x1x1xbf16> loc(#loc470)
      xten_nn.output %170 : tensor<1x2048x1x1xbf16> loc(#loc470)
    } -> tensor<1x2048x1x1xbf16> loc(#loc468)
    %161 = xten_nn.subgraph (%arg1 = %160: tensor<1x2048x1x1xbf16>, %arg2 = %5: tensor<512x2048x1x1xbf16>, %arg3 = %78: tensor<512xbf16>)  attributes {
      IfmOperands = [0 : index],
      LayerName = "/layer4/layer4.2/relu/Relu",
      Operands = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 2048, 1, 1]> : vector<4xindex>
        },
        {
          UnknownDataFormat = true,
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[512, 2048, 1, 1]> : vector<4xindex>
        },
        {
          UnknownDataFormat = true
        }
      ],
      OutputName = "/layer4/layer4.2/conv1/Conv",
      Reason = "InCoreChain",
      Results = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          Name = "/layer4/layer4.2/conv1/Conv_output_0",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 512, 1, 1]> : vector<4xindex>
        }
      ],
      TilingRecipe = {
        "conv-spatial-2d" = false,
        "conv-split-stamps" = true,
        "conv-split-stamps-OC-only" = false,
        "conv-split-stamps-OH-only" = false,
        "convtype-set-by-overlay-heuristic" = false,
        "disable-oh-spatial" = false,
        "disable-ow-spatial" = false,
        "dwc-split-stamps" = false,
        "elt-split-stamps" = true,
        "fm-superiters" = false,
        "icw-superiters" = false,
        "ocw-superiters" = true,
        "ow-superiters" = false,
        "pool-split-stamps" = false,
        "reduce-split-stamps" = false
      },
      logical_mode = "2x_4x4_1x4_vertBroadcastLeft_horizBroadcastRight",
      memory_configuration = {
        L1 = {layout = "strictlegacy"},
        L2 = {ifm_buffering = "single", layout = "flexible", limited_wts_space = false, ofm_buffering = "single", weights_buffering = "double"}
      }} {
      %169 = xten_nn.subgraph (%arg4 = %arg1: tensor<1x2048x1x1xbf16>, %arg5 = %arg2: tensor<512x2048x1x1xbf16>, %arg6 = %arg3: tensor<512xbf16>)  attributes {
        Dilations = array<i64: 1, 1>,
        HWPadding = [[0, 0], [0, 0]],
        LayerName = "/layer4/layer4.2/relu/Relu",
        Operands = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Port = "data_io.ifm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 2048, 1, 1]> : vector<4xindex>
          },
          {
            Port = "data_io.wts",
            SubPort = "wts_data",
            UnknownDataFormat = true,
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[512, 2048, 1, 1]> : vector<4xindex>
          },
          {
            Port = "data_io.wts",
            SubPort = "bias",
            UnknownDataFormat = true
          }
        ],
        OutputName = "/layer4/layer4.2/conv1/Conv",
        Reason = "MllibKernel",
        Results = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer4/layer4.2/conv1/Conv_output_0",
            Port = "data_io.ofm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 512, 1, 1]> : vector<4xindex>
          }
        ],
        Specializes = "Conv2DBf16",
        Traits = {
          AllowDMAOptimization = true,
          NonNegativeOut = true
        },
        With = {
          config.AIE_API_EMULATE_BFLOAT16_MMUL_WITH_BFP16 = 1 : ui8,
          config.act = 1 : ui8,
          config.act_type = "RELU",
          config.aie_arch = "aie2p",
          config.batch_size = 1 : ui8,
          config.compiler = "peano",
          config.conv_type = [0 : ui8, 12 : ui8, 64 : ui8],
          config.dtype_ifm = "bfloat16",
          config.dtype_ofm = "bfloat16",
          config.dtype_wts = "bfloat16",
          config.enable_bfp16_wts = 0 : ui8,
          config.ksize.height = 1 : ui8,
          config.ksize.width = 1 : ui8,
          config.lrelu_alpha = 0.000000e+00 : f32,
          config.stride_h = 1 : ui8,
          config.stride_w = 1 : ui8
        }} {
        %170 = tosa.reshape %arg5 {new_shape = array<i64: 512, 1, 1, 2048>} : (tensor<512x2048x1x1xbf16>) -> tensor<512x1x1x2048xbf16> loc(#loc473)
        %171 = tosa.reshape %arg4 {new_shape = array<i64: 1, 1, 1, 2048>} : (tensor<1x2048x1x1xbf16>) -> tensor<1x1x1x2048xbf16> loc(#loc473)
        %172 = tosa.conv2d %171, %170, %arg6 {
          LayerName = "/layer4/layer4.2/conv1/Conv",
          OutputName = "/layer4/layer4.2/conv1/Conv",
          acc_type = f32,
          dilation = array<i64: 1, 1>,
          pad = array<i64: 0, 0, 0, 0>,
          stride = array<i64: 1, 1>} : (tensor<1x1x1x2048xbf16>, tensor<512x1x1x2048xbf16>, tensor<512xbf16>) -> tensor<1x1x1x512xbf16> loc(#loc474)
        %173 = tosa.clamp %172 {
          LayerName = "/layer4/layer4.2/relu/Relu",
          OutputName = "/layer4/layer4.2/relu/Relu",
          max_fp = 3.40282347E+38 : f32,
          max_int = 2147483647 : i64,
          min_fp = 0.000000e+00 : f32,
          min_int = 0 : i64} : (tensor<1x1x1x512xbf16>) -> tensor<1x1x1x512xbf16> loc(#loc475)
        %174 = tosa.reshape %173 {new_shape = array<i64: 1, 512, 1, 1>} : (tensor<1x1x1x512xbf16>) -> tensor<1x512x1x1xbf16> loc(#loc473)
        xten_nn.output %174 : tensor<1x512x1x1xbf16> loc(#loc475)
      } -> tensor<1x512x1x1xbf16> loc(#loc473)
      xten_nn.output %169 : tensor<1x512x1x1xbf16> loc(#loc473)
    } -> tensor<1x512x1x1xbf16> loc(#loc473)
    %162 = xten_nn.subgraph (%arg1 = %161: tensor<1x512x1x1xbf16>, %arg2 = %4: tensor<512x512x3x3xbf16>, %arg3 = %64: tensor<512xbf16>)  attributes {
      IfmOperands = [0 : index],
      LayerName = "/layer4/layer4.2/relu_1/Relu",
      Operands = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 512, 1, 1]> : vector<4xindex>
        },
        {
          UnknownDataFormat = true,
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[512, 512, 3, 3]> : vector<4xindex>
        },
        {
          UnknownDataFormat = true
        }
      ],
      OutputName = "/layer4/layer4.2/conv2/Conv",
      Reason = "InCoreChain",
      Results = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          Name = "/layer4/layer4.2/conv2/Conv_output_0",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 512, 1, 1]> : vector<4xindex>
        }
      ],
      TilingRecipe = {
        "conv-spatial-2d" = false,
        "conv-split-stamps" = true,
        "conv-split-stamps-OC-only" = false,
        "conv-split-stamps-OH-only" = false,
        "convtype-set-by-overlay-heuristic" = false,
        "disable-oh-spatial" = false,
        "disable-ow-spatial" = false,
        "dwc-split-stamps" = false,
        "elt-split-stamps" = true,
        "fm-superiters" = false,
        "icw-superiters" = true,
        "ocw-superiters" = true,
        "ow-superiters" = false,
        "pool-split-stamps" = false,
        "reduce-split-stamps" = false
      },
      logical_mode = "2x_4x4_1x4_vertBroadcastLeft_horizBroadcastRight",
      memory_configuration = {
        L1 = {layout = "strictlegacy"},
        L2 = {ifm_buffering = "single", layout = "flexible", limited_wts_space = false, ofm_buffering = "single", weights_buffering = "double"}
      }} {
      %169 = xten_nn.subgraph (%arg4 = %arg1: tensor<1x512x1x1xbf16>, %arg5 = %arg2: tensor<512x512x3x3xbf16>, %arg6 = %arg3: tensor<512xbf16>)  attributes {
        Dilations = array<i64: 1, 1>,
        HWPadding = [[1, 1], [1, 1]],
        LayerName = "/layer4/layer4.2/relu_1/Relu",
        Operands = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Port = "data_io.ifm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 512, 1, 1]> : vector<4xindex>
          },
          {
            Port = "data_io.wts",
            SubPort = "wts_data",
            UnknownDataFormat = true,
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[512, 512, 3, 3]> : vector<4xindex>
          },
          {
            Port = "data_io.wts",
            SubPort = "bias",
            UnknownDataFormat = true
          }
        ],
        OutputName = "/layer4/layer4.2/conv2/Conv",
        Reason = "MllibKernel",
        Results = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer4/layer4.2/conv2/Conv_output_0",
            Port = "data_io.ofm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 512, 1, 1]> : vector<4xindex>
          }
        ],
        Specializes = "Conv2DBf16",
        Traits = {
          AllowDMAOptimization = true,
          NonNegativeOut = true
        },
        With = {
          config.AIE_API_EMULATE_BFLOAT16_MMUL_WITH_BFP16 = 1 : ui8,
          config.act = 1 : ui8,
          config.act_type = "RELU",
          config.aie_arch = "aie2p",
          config.batch_size = 1 : ui8,
          config.compiler = "peano",
          config.conv_type = [0 : ui8, 12 : ui8, 64 : ui8],
          config.dtype_ifm = "bfloat16",
          config.dtype_ofm = "bfloat16",
          config.dtype_wts = "bfloat16",
          config.enable_bfp16_wts = 0 : ui8,
          config.ksize.height = 3 : ui8,
          config.ksize.width = 3 : ui8,
          config.lrelu_alpha = 0.000000e+00 : f32,
          config.stride_h = 1 : ui8,
          config.stride_w = 1 : ui8
        }} {
        %170 = "tosa.const"() <{value = dense<[0, 2, 3, 1]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc248)
        %171 = tosa.transpose %arg5, %170 : (tensor<512x512x3x3xbf16>, tensor<4xi32>) -> tensor<512x3x3x512xbf16> loc(#loc476)
        %172 = tosa.reshape %arg4 {new_shape = array<i64: 1, 1, 1, 512>} : (tensor<1x512x1x1xbf16>) -> tensor<1x1x1x512xbf16> loc(#loc476)
        %173 = tosa.conv2d %172, %171, %arg6 {
          OutputName = "/layer4/layer4.2/conv2/Conv",
          PartOfLayerName = "/layer4/layer4.2/conv2/Conv",
          acc_type = f32,
          dilation = array<i64: 1, 1>,
          pad = array<i64: 1, 1, 1, 1>,
          stride = array<i64: 1, 1>} : (tensor<1x1x1x512xbf16>, tensor<512x3x3x512xbf16>, tensor<512xbf16>) -> tensor<1x1x1x512xbf16> loc(#loc477)
        %174 = tosa.clamp %173 {
          LayerName = "/layer4/layer4.2/relu_1/Relu",
          OutputName = "/layer4/layer4.2/relu_1/Relu",
          max_fp = 3.40282347E+38 : f32,
          max_int = 2147483647 : i64,
          min_fp = 0.000000e+00 : f32,
          min_int = 0 : i64} : (tensor<1x1x1x512xbf16>) -> tensor<1x1x1x512xbf16> loc(#loc478)
        %175 = tosa.reshape %174 {new_shape = array<i64: 1, 512, 1, 1>} : (tensor<1x1x1x512xbf16>) -> tensor<1x512x1x1xbf16> loc(#loc476)
        xten_nn.output %175 : tensor<1x512x1x1xbf16> loc(#loc478)
      } -> tensor<1x512x1x1xbf16> loc(#loc476)
      xten_nn.output %169 : tensor<1x512x1x1xbf16> loc(#loc476)
    } -> tensor<1x512x1x1xbf16> loc(#loc476)
    %163 = xten_nn.subgraph (%arg1 = %162: tensor<1x512x1x1xbf16>, %arg2 = %3: tensor<2048x512x1x1xbf16>, %arg3 = %90: tensor<2048xbf16>, %arg4 = %160: tensor<1x2048x1x1xbf16>)  attributes {
      IfmOperands = [0 : index, 3 : index],
      LayerName = "/layer4/layer4.2/conv3/Conv",
      OfmShare = 3 : index,
      Operands = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          Name = "/layer4/layer4.2/relu_1/Relu_output_0",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 512, 1, 1]> : vector<4xindex>
        },
        {
          Name = "onnx::Conv_657",
          UnknownDataFormat = true,
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[2048, 512, 1, 1]> : vector<4xindex>
        },
        {
          Name = "onnx::Conv_658",
          UnknownDataFormat = true
        },
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          Name = "/layer4/layer4.2/Add_output_0",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 2048, 1, 1]> : vector<4xindex>
        }
      ],
      OutputName = "/layer4/layer4.2/Add",
      Reason = "InCoreChain",
      Results = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          Name = "/layer4/layer4.2/Add_output_0",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 2048, 1, 1]> : vector<4xindex>
        }
      ],
      TilingRecipe = {
        "conv-spatial-2d" = false,
        "conv-split-stamps" = true,
        "conv-split-stamps-OC-only" = false,
        "conv-split-stamps-OH-only" = false,
        "convtype-set-by-overlay-heuristic" = false,
        "disable-oh-spatial" = false,
        "disable-ow-spatial" = false,
        "dwc-split-stamps" = false,
        "elt-split-stamps" = true,
        "fm-superiters" = false,
        "icw-superiters" = false,
        "ocw-superiters" = true,
        "ow-superiters" = false,
        "pool-split-stamps" = false,
        "reduce-split-stamps" = false
      },
      logical_mode = "2x_4x4_1x4_vertBroadcastLeft_horizBroadcastRight",
      memory_configuration = {
        L1 = {layout = "strictlegacy"},
        L2 = {ifm_buffering = "single", layout = "flexible", limited_wts_space = false, ofm_buffering = "single", weights_buffering = "double"}
      }} {
      %169 = xten_nn.subgraph (%arg5 = %arg1: tensor<1x512x1x1xbf16>, %arg6 = %arg2: tensor<2048x512x1x1xbf16>, %arg7 = %arg3: tensor<2048xbf16>)  attributes {
        Dilations = array<i64: 1, 1>,
        HWPadding = [[0, 0], [0, 0]],
        LayerName = "/layer4/layer4.2/conv3/Conv",
        Operands = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer4/layer4.2/relu_1/Relu_output_0",
            Port = "data_io.ifm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 512, 1, 1]> : vector<4xindex>
          },
          {
            Name = "onnx::Conv_657",
            Port = "data_io.wts",
            SubPort = "wts_data",
            UnknownDataFormat = true,
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[2048, 512, 1, 1]> : vector<4xindex>
          },
          {
            Name = "onnx::Conv_658",
            Port = "data_io.wts",
            SubPort = "bias",
            UnknownDataFormat = true
          }
        ],
        OutputName = "/layer4/layer4.2/conv3/Conv",
        Reason = "MllibKernel",
        Results = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer4/layer4.2/conv3/Conv_output_0",
            Port = "data_io.ofm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 2048, 1, 1]> : vector<4xindex>
          }
        ],
        Specializes = "Conv2DBf16",
        Traits = {
          AllowDMAOptimization = true
        },
        With = {
          config.AIE_API_EMULATE_BFLOAT16_MMUL_WITH_BFP16 = 1 : ui8,
          config.act = 0 : ui8,
          config.act_type = "RELU",
          config.aie_arch = "aie2p",
          config.batch_size = 1 : ui8,
          config.compiler = "peano",
          config.conv_type = [0 : ui8, 12 : ui8, 64 : ui8],
          config.dtype_ifm = "bfloat16",
          config.dtype_ofm = "bfloat16",
          config.dtype_wts = "bfloat16",
          config.enable_bfp16_wts = 0 : ui8,
          config.ksize.height = 1 : ui8,
          config.ksize.width = 1 : ui8,
          config.lrelu_alpha = 1.000000e+00 : f32,
          config.stride_h = 1 : ui8,
          config.stride_w = 1 : ui8
        }} {
        %171 = tosa.reshape %arg6 {new_shape = array<i64: 2048, 1, 1, 512>} : (tensor<2048x512x1x1xbf16>) -> tensor<2048x1x1x512xbf16> loc(#loc480)
        %172 = tosa.reshape %arg5 {new_shape = array<i64: 1, 1, 1, 512>} : (tensor<1x512x1x1xbf16>) -> tensor<1x1x1x512xbf16> loc(#loc480)
        %173 = tosa.conv2d %172, %171, %arg7 {
          LayerName = "/layer4/layer4.2/conv3/Conv",
          OutputName = "/layer4/layer4.2/conv3/Conv",
          acc_type = f32,
          dilation = array<i64: 1, 1>,
          pad = array<i64: 0, 0, 0, 0>,
          stride = array<i64: 1, 1>} : (tensor<1x1x1x512xbf16>, tensor<2048x1x1x512xbf16>, tensor<2048xbf16>) -> tensor<1x1x1x2048xbf16> loc(#loc480)
        %174 = tosa.reshape %173 {new_shape = array<i64: 1, 2048, 1, 1>} : (tensor<1x1x1x2048xbf16>) -> tensor<1x2048x1x1xbf16> loc(#loc480)
        xten_nn.output %174 : tensor<1x2048x1x1xbf16> loc(#loc480)
      } -> tensor<1x2048x1x1xbf16> loc(#loc480)
      %170 = xten_nn.subgraph (%arg5 = %169: tensor<1x2048x1x1xbf16>, %arg6 = %arg4: tensor<1x2048x1x1xbf16>)  attributes {
        LayerName = "/layer4/layer4.2/relu_2/Relu",
        Operands = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer4/layer4.2/Add_output_0",
            Port = "data_io.ifm1",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 2048, 1, 1]> : vector<4xindex>
          },
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer4/layer4.2/Add_output_0",
            Port = "data_io.ifm2",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 2048, 1, 1]> : vector<4xindex>
          }
        ],
        OutputName = "/layer4/layer4.2/Add",
        Reason = "MllibKernel",
        Results = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer4/layer4.2/Add_output_0",
            Port = "data_io.ofm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 2048, 1, 1]> : vector<4xindex>
          }
        ],
        Specializes = "AddBf16",
        Traits = {
          Binary = true,
          Elementwise = true,
          NonNegativeOut = true
        },
        With = {
          config.act = 1 : ui8,
          config.act_type = "RELU",
          config.aie_arch = "aie2p",
          config.compiler = "peano",
          config.dtype = "bfloat16"
        }} {
        %171 = tosa.add %arg5, %arg6 {LayerName = "/layer4/layer4.2/Add", OutputName = "/layer4/layer4.2/Add"} : (tensor<1x2048x1x1xbf16>, tensor<1x2048x1x1xbf16>) -> tensor<1x2048x1x1xbf16> loc(#loc482)
        %172 = tosa.clamp %171 {
          LayerName = "/layer4/layer4.2/relu_2/Relu",
          OutputName = "/layer4/layer4.2/relu_2/Relu",
          max_fp = 3.40282347E+38 : f32,
          max_int = 2147483647 : i64,
          min_fp = 0.000000e+00 : f32,
          min_int = 0 : i64} : (tensor<1x2048x1x1xbf16>) -> tensor<1x2048x1x1xbf16> loc(#loc483)
        xten_nn.output %172 : tensor<1x2048x1x1xbf16> loc(#loc483)
      } -> tensor<1x2048x1x1xbf16> loc(#loc481)
      xten_nn.output %170 : tensor<1x2048x1x1xbf16> loc(#loc481)
    } -> tensor<1x2048x1x1xbf16> loc(#loc479)
    %164 = xten_nn.subgraph (%arg1 = %163: tensor<1x2048x1x1xbf16>)  attributes {
      IfmOperands = [0 : index],
      LayerName = "/avgpool/GlobalAveragePool",
      Operands = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          Name = "/layer4/layer4.2/relu_2/Relu_output_0",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 2048, 1, 1]> : vector<4xindex>
        }
      ],
      OutputName = "/avgpool/GlobalAveragePool_Duplicated#0",
      Reason = "InCoreChain",
      Results = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          Name = "/avgpool/GlobalAveragePool_output_0",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 2048, 1, 1]> : vector<4xindex>
        }
      ],
      TilingRecipe = {
        "conv-spatial-2d" = false,
        "conv-split-stamps" = true,
        "conv-split-stamps-OC-only" = false,
        "conv-split-stamps-OH-only" = false,
        "convtype-set-by-overlay-heuristic" = false,
        "disable-oh-spatial" = false,
        "disable-ow-spatial" = false,
        "dwc-split-stamps" = false,
        "elt-split-stamps" = true,
        "fm-superiters" = false,
        "icw-superiters" = false,
        "ocw-superiters" = true,
        "ow-superiters" = false,
        "pool-split-stamps" = false,
        "reduce-split-stamps" = false
      },
      logical_mode = "2x_4x4_1x4_vertBroadcastLeft_horizBroadcastRight",
      memory_configuration = {
        L1 = {layout = "strictlegacy"},
        L2 = {ifm_buffering = "single", layout = "flexible", limited_wts_space = false, ofm_buffering = "single", weights_buffering = "double"}
      }} {
      %169 = xten_nn.subgraph (%arg2 = %arg1: tensor<1x2048x1x1xbf16>)  attributes {
        LayerName = "/avgpool/GlobalAveragePool",
        Operands = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/layer4/layer4.2/relu_2/Relu_output_0",
            Port = "data_io.ifm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 2048, 1, 1]> : vector<4xindex>
          }
        ],
        OutputName = "/avgpool/GlobalAveragePool_Duplicated#0",
        PadValue = 0.000000e+00 : bf16,
        Reason = "MllibKernel",
        Results = [
          {
            CurrentDataFormat = "NCHW",
            L3DataFormat = "HCWN",
            L3Vectorization = "C:8",
            Name = "/avgpool/GlobalAveragePool_output_0",
            Port = "data_io.ofm",
            l3_extend_end = dense<0> : vector<4xindex>,
            l3_tile_count = dense<[1, 2048, 1, 1]> : vector<4xindex>
          }
        ],
        Specializes = "ReduceMeanC8Bf16",
        Traits = {
          Reduce = true
        },
        With = {
          config.aie_arch = "aie2p",
          config.compiler = "peano",
          config.dtype = "bfloat16",
          config.full_channel = 2048 : ui32,
          config.full_height = 1 : ui32,
          config.full_width = 1 : ui32,
          config.reduce_dim = "W"
        }} {
        %170 = xten_nn.reduce_mean %arg2 {axes = array<i64: 3>, keepdims = 1 : i64} : (tensor<1x2048x1x1xbf16>) -> tensor<1x2048x1x1xbf16> loc(#loc484)
        xten_nn.output %170 : tensor<1x2048x1x1xbf16> loc(#loc484)
      } -> tensor<1x2048x1x1xbf16> loc(#loc484)
      xten_nn.output %169 : tensor<1x2048x1x1xbf16> loc(#loc484)
    } -> tensor<1x2048x1x1xbf16> loc(#loc484)
    %165 = xten_nn.subgraph (%arg1 = %164: tensor<1x2048x1x1xbf16>)  attributes {
      IfmOperands = [0 : index],
      LayerName = "/fc/fc.0/Gemm_Duplicated#0",
      Op = "Reshape",
      Operands = [
        {
          CurrentDataFormat = "NCHW",
          L3DataFormat = "HCWN",
          L3Vectorization = "C:8",
          Name = "/Flatten_output_0",
          Port = "data_io.ifm",
          l3_extend_end = dense<0> : vector<4xindex>,
          l3_extend_start = dense<0> : vector<4xindex>,
          l3_tile_count = dense<[1, 2048, 1, 1]> : vector<4xindex>
        }
      ],
      OutputName = "/avgpool/GlobalAveragePool_Duplicated#1",
      Reason = "PseudoOp",
      Results = [
        {
          CurrentDataFormat = "NHW",
          L3DataFormat = "NHW",
          Name = "/avgpool/GlobalAveragePool_output_0",
          Port = "data_io.ofm",
          l3_extend_end = dense<0> : vector<3xindex>,
          l3_extend_start = dense<0> : vector<3xindex>,
          l3_tile_count = dense<[1, 1, 2048]> : vector<3xindex>
        }
      ]} {
      %169 = tosa.reshape %arg1 {new_shape = array<i64: 1, 1, 2048>} : (tensor<1x2048x1x1xbf16>) -> tensor<1x1x2048xbf16> loc(#loc485)
      xten_nn.output %169 : tensor<1x1x2048xbf16> loc(#loc485)
    } -> tensor<1x1x2048xbf16> loc(#loc485)
    %166 = xten_nn.subgraph (%arg1 = %165: tensor<1x1x2048xbf16>, %arg2 = %56: tensor<1x2048x64xbf16>, %arg3 = %58: tensor<1x1x64xbf16>)  attributes {
      IfmOperands = [0 : index],
      LayerName = "/fc/fc.0/Gemm_Duplicated#1",
      Operands = [
        {
          CurrentDataFormat = "NHW",
          L3DataFormat = "NHW",
          Name = "/Flatten_output_0",
          Port = "data_io.mat_a",
          l3_extend_end = dense<0> : vector<3xindex>,
          l3_tile_count = dense<[1, 1, 2048]> : vector<3xindex>
        },
        {
          CurrentDataFormat = "NHW",
          L3DataFormat = "NHW",
          Name = "fc.0.weight",
          Port = "data_io.mat_b",
          SubPort = "mat_b_data",
          UnknownDataFormat = true,
          l3_extend_end = dense<0> : vector<3xindex>,
          l3_tile_count = dense<[1, 2048, 64]> : vector<3xindex>
        },
        {
          Name = "fc.0.bias",
          Port = "data_io.mat_b",
          SubPort = "bias",
          UnknownDataFormat = true
        }
      ],
      OutputName = "/fc/fc.1/Relu",
      Reason = "InCoreChain",
      Results = [
        {
          CurrentDataFormat = "NHW",
          L3DataFormat = "NHW",
          Name = "/fc/fc.1/Relu_output_0",
          Port = "data_io.ofm",
          l3_extend_end = dense<0> : vector<3xindex>,
          l3_tile_count = dense<[1, 1, 64]> : vector<3xindex>
        }
      ],
      Tiler = "Microkernel",
      TilerArgs = {
        OperatorArgs = {config.aie_arch = "aie2p", config.permute.mat_a = "NHW", config.permute.mat_b = "NHW", config.permute.mat_c = "NHW", config.try_using_bfp16_wts = true, config.wts_constant = true, iteration_domains.B.size = 1 : ui32, iteration_domains.K.size = 2048 : ui32, iteration_domains.M.size = 1 : ui32, iteration_domains.N.size = 64 : ui32, kernels.gemm.config.bias_flag = 1 : ui32},
        OperatorName = "GemmBfp16WBf16ABf16"
      }} {
      %169 = xten_nn.subgraph (%arg4 = %arg1: tensor<1x1x2048xbf16>, %arg5 = %arg2: tensor<1x2048x64xbf16>, %arg6 = %arg3: tensor<1x1x64xbf16>)  attributes {
        LayerName = "/fc/fc.0/Gemm_Duplicated#1",
        Operands = [
          {
            CurrentDataFormat = "NHW",
            L3DataFormat = "NHW",
            Name = "/Flatten_output_0",
            Port = "data_io.mat_a",
            l3_extend_end = dense<0> : vector<3xindex>,
            l3_tile_count = dense<[1, 1, 2048]> : vector<3xindex>
          },
          {
            CurrentDataFormat = "NHW",
            External = true,
            L3DataFormat = "NHW",
            Name = "fc.0.weight",
            Port = "data_io.mat_b",
            SubPort = "mat_b_data",
            UnknownDataFormat = true,
            l3_extend_end = dense<0> : vector<3xindex>,
            l3_tile_count = dense<[1, 2048, 64]> : vector<3xindex>
          },
          {
            External = true,
            Name = "fc.0.bias",
            Port = "data_io.mat_b",
            SubPort = "bias",
            UnknownDataFormat = true
          }
        ],
        OutputName = "/fc/fc.0/Gemm",
        Reason = "MllibKernel",
        Results = [
          {
            CurrentDataFormat = "NHW",
            L3DataFormat = "NHW",
            Name = "/fc/fc.0/Gemm_output_0",
            Port = "data_io.mat_c",
            l3_extend_end = dense<0> : vector<3xindex>,
            l3_tile_count = dense<[1, 1, 64]> : vector<3xindex>
          }
        ],
        Specializes = "GemmBfp16",
        With = {
          config.AIE_API_EMULATE_BFLOAT16_MMUL_WITH_BFP16 = 1 : ui8,
          config.aie_arch = "aie2p",
          config.bias_supported = 1 : ui16,
          config.compiler = "peano",
          config.dtype = "bfloat16"
        }} {
        %171 = tosa.matmul %arg4, %arg5 {PartOfLayerName = "/fc/fc.0/Gemm"} : (tensor<1x1x2048xbf16>, tensor<1x2048x64xbf16>) -> tensor<1x1x64xf32> loc(#loc487)
        %172 = tosa.cast %171 : (tensor<1x1x64xf32>) -> tensor<1x1x64xbf16> loc(#loc487)
        %173 = tosa.add %172, %arg6 {OutputName = "/fc/fc.0/Gemm", PartOfLayerName = "/fc/fc.0/Gemm"} : (tensor<1x1x64xbf16>, tensor<1x1x64xbf16>) -> tensor<1x1x64xbf16> loc(#loc487)
        xten_nn.output %173 : tensor<1x1x64xbf16> loc(#loc487)
      } -> tensor<1x1x64xbf16> loc(#loc487)
      %170 = xten_nn.subgraph (%arg4 = %169: tensor<1x1x64xbf16>)  attributes {
        LayerName = "/fc/fc.1/Relu",
        Operands = [
          {
            CurrentDataFormat = "NHW",
            L3DataFormat = "NHW",
            Name = "/fc/fc.0/Gemm_output_0",
            Port = "data_io.ifm",
            l3_extend_end = dense<0> : vector<3xindex>,
            l3_tile_count = dense<[1, 1, 64]> : vector<3xindex>
          }
        ],
        OutputName = "/fc/fc.1/Relu",
        Reason = "MllibKernel",
        Results = [
          {
            CurrentDataFormat = "NHW",
            L3DataFormat = "NHW",
            Name = "/fc/fc.1/Relu_output_0",
            Port = "data_io.ofm",
            l3_extend_end = dense<0> : vector<3xindex>,
            l3_tile_count = dense<[1, 1, 64]> : vector<3xindex>
          }
        ],
        Specializes = "ClipBf163D",
        Traits = {
          Elementwise = true,
          NonNegativeOut = true,
          Unary = true
        },
        With = {
          config.aie_arch = "aie2p",
          config.clamp_max = 3.40282347E+38 : f32,
          config.clamp_min = 0.000000e+00 : f32,
          config.compiler = "peano",
          config.dtype = "bfloat16",
          config.ifm_shift = 0 : si8,
          config.ofm_shift = 0 : si8
        }} {
        %171 = tosa.clamp %arg4 {
          LayerName = "/fc/fc.1/Relu",
          OutputName = "/fc/fc.1/Relu",
          max_fp = 3.40282347E+38 : f32,
          max_int = 2147483647 : i64,
          min_fp = 0.000000e+00 : f32,
          min_int = 0 : i64} : (tensor<1x1x64xbf16>) -> tensor<1x1x64xbf16> loc(#loc488)
        xten_nn.output %171 : tensor<1x1x64xbf16> loc(#loc488)
      } -> tensor<1x1x64xbf16> loc(#loc488)
      xten_nn.output %170 : tensor<1x1x64xbf16> loc(#loc488)
    } -> tensor<1x1x64xbf16> loc(#loc486)
    %167 = xten_nn.subgraph (%arg1 = %166: tensor<1x1x64xbf16>, %arg2 = %55: tensor<1x64x10xbf16>, %arg3 = %57: tensor<1x1x10xbf16>)  attributes {
      IfmOperands = [0 : index],
      LayerName = "/fc/fc.2/Gemm_Duplicated#0",
      Operands = [
        {
          CurrentDataFormat = "NHW",
          L3DataFormat = "NHW",
          Name = "/fc/fc.1/Relu_output_0",
          Port = "data_io.mat_a",
          l3_extend_end = dense<0> : vector<3xindex>,
          l3_tile_count = dense<[1, 1, 64]> : vector<3xindex>
        },
        {
          CurrentDataFormat = "NHW",
          L3DataFormat = "NHW",
          Name = "fc.2.weight",
          Port = "data_io.mat_b",
          SubPort = "mat_b_data",
          UnknownDataFormat = true,
          l3_extend_end = dense<0> : vector<3xindex>,
          l3_tile_count = dense<[1, 64, 10]> : vector<3xindex>
        },
        {
          Name = "fc.2.bias",
          Port = "data_io.mat_b",
          SubPort = "bias",
          UnknownDataFormat = true
        }
      ],
      OutputName = "/fc/fc.2/Gemm_Duplicated#0",
      Reason = "InCoreChain",
      Results = [
        {
          CurrentDataFormat = "NHW",
          L3DataFormat = "NHW",
          Name = "output",
          Port = "data_io.mat_c",
          l3_extend_end = dense<0> : vector<3xindex>,
          l3_tile_count = dense<[1, 1, 10]> : vector<3xindex>
        }
      ],
      Tiler = "Microkernel",
      TilerArgs = {
        OperatorArgs = {config.aie_arch = "aie2p", config.permute.mat_a = "NHW", config.permute.mat_b = "NHW", config.permute.mat_c = "NHW", config.try_using_bfp16_wts = true, config.wts_constant = true, iteration_domains.B.size = 1 : ui32, iteration_domains.K.size = 64 : ui32, iteration_domains.M.size = 1 : ui32, iteration_domains.N.size = 10 : ui32, kernels.gemm.config.bias_flag = 1 : ui32},
        OperatorName = "GemmBfp16WBf16ABf16"
      }} {
      %169 = xten_nn.subgraph (%arg4 = %arg1: tensor<1x1x64xbf16>, %arg5 = %arg2: tensor<1x64x10xbf16>, %arg6 = %arg3: tensor<1x1x10xbf16>)  attributes {
        LayerName = "/fc/fc.2/Gemm_Duplicated#0",
        Operands = [
          {
            CurrentDataFormat = "NHW",
            L3DataFormat = "NHW",
            Name = "/fc/fc.1/Relu_output_0",
            Port = "data_io.mat_a",
            l3_extend_end = dense<0> : vector<3xindex>,
            l3_tile_count = dense<[1, 1, 64]> : vector<3xindex>
          },
          {
            CurrentDataFormat = "NHW",
            External = true,
            L3DataFormat = "NHW",
            Name = "fc.2.weight",
            Port = "data_io.mat_b",
            SubPort = "mat_b_data",
            UnknownDataFormat = true,
            l3_extend_end = dense<0> : vector<3xindex>,
            l3_tile_count = dense<[1, 64, 10]> : vector<3xindex>
          },
          {
            External = true,
            Name = "fc.2.bias",
            Port = "data_io.mat_b",
            SubPort = "bias",
            UnknownDataFormat = true
          }
        ],
        OutputName = "/fc/fc.2/Gemm_Duplicated#0",
        Reason = "MllibKernel",
        Results = [
          {
            CurrentDataFormat = "NHW",
            L3DataFormat = "NHW",
            Name = "output",
            Port = "data_io.mat_c",
            l3_extend_end = dense<0> : vector<3xindex>,
            l3_tile_count = dense<[1, 1, 10]> : vector<3xindex>
          }
        ],
        Specializes = "GemmBfp16",
        With = {
          config.AIE_API_EMULATE_BFLOAT16_MMUL_WITH_BFP16 = 1 : ui8,
          config.aie_arch = "aie2p",
          config.bias_supported = 1 : ui16,
          config.compiler = "peano",
          config.dtype = "bfloat16"
        }} {
        %170 = tosa.matmul %arg4, %arg5 {PartOfLayerName = "/fc/fc.2/Gemm"} : (tensor<1x1x64xbf16>, tensor<1x64x10xbf16>) -> tensor<1x1x10xf32> loc(#loc489)
        %171 = tosa.cast %170 : (tensor<1x1x10xf32>) -> tensor<1x1x10xbf16> loc(#loc489)
        %172 = tosa.add %171, %arg6 {OutputName = "/fc/fc.2/Gemm", PartOfLayerName = "/fc/fc.2/Gemm"} : (tensor<1x1x10xbf16>, tensor<1x1x10xbf16>) -> tensor<1x1x10xbf16> loc(#loc489)
        xten_nn.output %172 : tensor<1x1x10xbf16> loc(#loc489)
      } -> tensor<1x1x10xbf16> loc(#loc489)
      xten_nn.output %169 : tensor<1x1x10xbf16> loc(#loc489)
    } -> tensor<1x1x10xbf16> loc(#loc489)
    %168 = xten_nn.subgraph (%arg1 = %167: tensor<1x1x10xbf16>)  attributes {
      IfmOperands = [0 : index],
      LayerName = "/fc/fc.2/Gemm_Duplicated#1",
      Op = "Reshape",
      Operands = [
        {
          CurrentDataFormat = "NHW",
          L3DataFormat = "NHW",
          Name = "/fc/fc.1/Relu_output_0",
          Port = "data_io.ifm",
          l3_extend_end = dense<0> : vector<3xindex>,
          l3_extend_start = dense<0> : vector<3xindex>,
          l3_tile_count = dense<[1, 1, 10]> : vector<3xindex>
        }
      ],
      OutputName = "/fc/fc.2/Gemm_Duplicated#1",
      Reason = "PseudoOp",
      Results = [
        {
          CurrentDataFormat = "AB",
          L3DataFormat = "AB",
          Name = "output",
          Port = "data_io.ofm",
          l3_extend_end = dense<0> : vector<2xindex>,
          l3_extend_start = dense<0> : vector<2xindex>,
          l3_tile_count = dense<[1, 10]> : vector<2xindex>
        }
      ]} {
      %169 = tosa.reshape %arg1 {new_shape = array<i64: 1, 10>} : (tensor<1x1x10xbf16>) -> tensor<1x10xbf16> loc(#loc489)
      xten_nn.output %169 : tensor<1x10xbf16> loc(#loc489)
    } -> tensor<1x10xbf16> loc(#loc489)
    return %168 : tensor<1x10xbf16> loc(#loc)
  } loc(#loc)
  func.func @forward(%arg0: tensor<1x3x32x32xbf16> {onnx.name = "input", xten_nn.RTAnnotations = {scale_factor = 1.000000e+00 : f32, tensor_name = "input"}} loc(unknown)) -> (tensor<1x10xbf16> {onnx.name = "output", xten_nn.RTAnnotations = {scale_factor = 1.000000e+00 : f32, tensor_name = "output"}}) {
    %0 = call @forward_outlined_part_0(%arg0) : (tensor<1x3x32x32xbf16>) -> tensor<1x10xbf16> loc(#loc)
    return %0 : tensor<1x10xbf16> loc(#loc)
  } loc(#loc)
} loc(#loc)
#loc1 = loc("Initializer_onnx::Conv_502")
#loc2 = loc("/conv1/Conv")
#loc3 = loc("/relu/Relu")
#loc4 = loc("Initializer_onnx::Conv_577")
#loc5 = loc("Initializer_onnx::Conv_634")
#loc6 = loc("Initializer_onnx::Conv_592")
#loc7 = loc("Initializer_onnx::Conv_547")
#loc8 = loc("Initializer_onnx::Conv_568")
#loc9 = loc("Initializer_onnx::Conv_655")
#loc10 = loc("Initializer_onnx::Conv_565")
#loc11 = loc("Initializer_onnx::Conv_580")
#loc12 = loc("Initializer_onnx::Conv_520")
#loc13 = loc("Initializer_onnx::Conv_556")
#loc14 = loc("Initializer_onnx::Conv_616")
#loc15 = loc("Initializer_onnx::Conv_562")
#loc16 = loc("Initializer_onnx::Conv_589")
#loc17 = loc("Initializer_onnx::Conv_559")
#loc18 = loc("Initializer_onnx::Conv_541")
#loc19 = loc("Initializer_onnx::Conv_598")
#loc20 = loc("Initializer_onnx::Conv_544")
#loc21 = loc("Initializer_onnx::Conv_574")
#loc22 = loc("Initializer_onnx::Conv_508")
#loc23 = loc("Initializer_onnx::Conv_652")
#loc24 = loc("Initializer_onnx::Conv_583")
#loc25 = loc("Initializer_onnx::Conv_523")
#loc26 = loc("Initializer_onnx::Conv_532")
#loc27 = loc("Initializer_onnx::Conv_595")
#loc28 = loc("Initializer_onnx::Conv_529")
#loc29 = loc("Initializer_onnx::Conv_550")
#loc30 = loc("Initializer_onnx::Conv_553")
#loc31 = loc("Initializer_onnx::Conv_586")
#loc32 = loc("Initializer_onnx::Conv_538")
#loc33 = loc("Initializer_onnx::Conv_535")
#loc34 = loc("Initializer_onnx::Conv_604")
#loc35 = loc("Initializer_onnx::Conv_658")
#loc36 = loc("Initializer_onnx::Conv_607")
#loc37 = loc("Initializer_onnx::Conv_610")
#loc38 = loc("Initializer_onnx::Conv_646")
#loc39 = loc("Initializer_onnx::Conv_601")
#loc40 = loc("Initializer_onnx::Conv_613")
#loc41 = loc("Initializer_onnx::Conv_649")
#loc42 = loc("Initializer_onnx::Conv_640")
#loc43 = loc("Initializer_onnx::Conv_622")
#loc44 = loc("Initializer_onnx::Conv_631")
#loc45 = loc("Initializer_onnx::Conv_637")
#loc46 = loc("Initializer_onnx::Conv_643")
#loc47 = loc("Initializer_onnx::Conv_625")
#loc48 = loc("Initializer_onnx::Conv_517")
#loc49 = loc("Initializer_onnx::Conv_628")
#loc50 = loc("Initializer_onnx::Conv_571")
#loc51 = loc("Initializer_onnx::Conv_619")
#loc52 = loc("Initializer_onnx::Conv_505")
#loc53 = loc("Initializer_onnx::Conv_514")
#loc54 = loc("Initializer_onnx::Conv_526")
#loc55 = loc("Initializer_onnx::Conv_511")
#loc56 = loc("/maxpool/MaxPool")
#loc57 = loc("/layer1/layer1.0/conv1/Conv")
#loc58 = loc("/layer1/layer1.0/relu/Relu")
#loc59 = loc("/layer1/layer1.0/conv2/Conv")
#loc60 = loc("/layer1/layer1.0/relu_1/Relu")
#loc61 = loc("/layer1/layer1.0/downsample/downsample.0/Conv")
#loc62 = loc("/layer1/layer1.0/conv3/Conv")
#loc63 = loc("/layer1/layer1.0/Add")
#loc64 = loc("/layer1/layer1.0/relu_2/Relu")
#loc65 = loc("/layer1/layer1.1/conv1/Conv")
#loc66 = loc("/layer1/layer1.1/relu/Relu")
#loc67 = loc("/layer1/layer1.1/conv2/Conv")
#loc68 = loc("/layer1/layer1.1/relu_1/Relu")
#loc69 = loc("/layer1/layer1.1/conv3/Conv")
#loc70 = loc("/layer1/layer1.1/Add")
#loc71 = loc("/layer1/layer1.1/relu_2/Relu")
#loc72 = loc("/layer1/layer1.2/conv1/Conv")
#loc73 = loc("/layer1/layer1.2/relu/Relu")
#loc74 = loc("/layer1/layer1.2/conv2/Conv")
#loc75 = loc("/layer1/layer1.2/relu_1/Relu")
#loc76 = loc("/layer1/layer1.2/conv3/Conv")
#loc77 = loc("/layer1/layer1.2/Add")
#loc78 = loc("/layer1/layer1.2/relu_2/Relu")
#loc79 = loc("/layer2/layer2.0/conv1/Conv")
#loc80 = loc("/layer2/layer2.0/relu/Relu")
#loc81 = loc("/layer2/layer2.0/conv2/Conv")
#loc82 = loc("/layer2/layer2.0/relu_1/Relu")
#loc83 = loc("/layer2/layer2.0/downsample/downsample.0/Conv")
#loc84 = loc("/layer2/layer2.0/conv3/Conv")
#loc85 = loc("/layer2/layer2.0/Add")
#loc86 = loc("/layer2/layer2.0/relu_2/Relu")
#loc87 = loc("/layer2/layer2.1/conv1/Conv")
#loc88 = loc("/layer2/layer2.1/relu/Relu")
#loc89 = loc("/layer2/layer2.1/conv2/Conv")
#loc90 = loc("/layer2/layer2.1/relu_1/Relu")
#loc91 = loc("/layer2/layer2.1/conv3/Conv")
#loc92 = loc("/layer2/layer2.1/Add")
#loc93 = loc("/layer2/layer2.1/relu_2/Relu")
#loc94 = loc("/layer2/layer2.2/conv1/Conv")
#loc95 = loc("/layer2/layer2.2/relu/Relu")
#loc96 = loc("/layer2/layer2.2/conv2/Conv")
#loc97 = loc("/layer2/layer2.2/relu_1/Relu")
#loc98 = loc("/layer2/layer2.2/conv3/Conv")
#loc99 = loc("/layer2/layer2.2/Add")
#loc100 = loc("/layer2/layer2.2/relu_2/Relu")
#loc101 = loc("/layer2/layer2.3/conv1/Conv")
#loc102 = loc("/layer2/layer2.3/relu/Relu")
#loc103 = loc("/layer2/layer2.3/conv2/Conv")
#loc104 = loc("/layer2/layer2.3/relu_1/Relu")
#loc105 = loc("/layer2/layer2.3/conv3/Conv")
#loc106 = loc("/layer2/layer2.3/Add")
#loc107 = loc("/layer2/layer2.3/relu_2/Relu")
#loc108 = loc("/layer3/layer3.0/conv1/Conv")
#loc109 = loc("/layer3/layer3.0/relu/Relu")
#loc110 = loc("/layer3/layer3.0/conv2/Conv")
#loc111 = loc("/layer3/layer3.0/relu_1/Relu")
#loc112 = loc("/layer3/layer3.0/downsample/downsample.0/Conv")
#loc113 = loc("/layer3/layer3.0/conv3/Conv")
#loc114 = loc("/layer3/layer3.0/Add")
#loc115 = loc("/layer3/layer3.0/relu_2/Relu")
#loc116 = loc("/layer3/layer3.1/conv1/Conv")
#loc117 = loc("/layer3/layer3.1/relu/Relu")
#loc118 = loc("/layer3/layer3.1/conv2/Conv")
#loc119 = loc("/layer3/layer3.1/relu_1/Relu")
#loc120 = loc("/layer3/layer3.1/conv3/Conv")
#loc121 = loc("/layer3/layer3.1/Add")
#loc122 = loc("/layer3/layer3.1/relu_2/Relu")
#loc123 = loc("/layer3/layer3.2/conv1/Conv")
#loc124 = loc("/layer3/layer3.2/relu/Relu")
#loc125 = loc("/layer3/layer3.2/conv2/Conv")
#loc126 = loc("/layer3/layer3.2/relu_1/Relu")
#loc127 = loc("/layer3/layer3.2/conv3/Conv")
#loc128 = loc("/layer3/layer3.2/Add")
#loc129 = loc("/layer3/layer3.2/relu_2/Relu")
#loc130 = loc("/layer3/layer3.3/conv1/Conv")
#loc131 = loc("/layer3/layer3.3/relu/Relu")
#loc132 = loc("/layer3/layer3.3/conv2/Conv")
#loc133 = loc("/layer3/layer3.3/relu_1/Relu")
#loc134 = loc("/layer3/layer3.3/conv3/Conv")
#loc135 = loc("/layer3/layer3.3/Add")
#loc136 = loc("/layer3/layer3.3/relu_2/Relu")
#loc137 = loc("/layer3/layer3.4/conv1/Conv")
#loc138 = loc("/layer3/layer3.4/relu/Relu")
#loc139 = loc("/layer3/layer3.4/conv2/Conv")
#loc140 = loc("/layer3/layer3.4/relu_1/Relu")
#loc141 = loc("/layer3/layer3.4/conv3/Conv")
#loc142 = loc("/layer3/layer3.4/Add")
#loc143 = loc("/layer3/layer3.4/relu_2/Relu")
#loc144 = loc("/layer3/layer3.5/conv1/Conv")
#loc145 = loc("/layer3/layer3.5/relu/Relu")
#loc146 = loc("/layer3/layer3.5/conv2/Conv")
#loc147 = loc("/layer3/layer3.5/relu_1/Relu")
#loc148 = loc("/layer3/layer3.5/conv3/Conv")
#loc149 = loc("/layer3/layer3.5/Add")
#loc150 = loc("/layer3/layer3.5/relu_2/Relu")
#loc151 = loc("/layer4/layer4.0/conv1/Conv")
#loc152 = loc("/layer4/layer4.0/relu/Relu")
#loc153 = loc("/layer4/layer4.0/conv2/Conv")
#loc154 = loc("/layer4/layer4.0/relu_1/Relu")
#loc155 = loc("/layer4/layer4.0/downsample/downsample.0/Conv")
#loc156 = loc("/layer4/layer4.0/conv3/Conv")
#loc157 = loc("/layer4/layer4.0/Add")
#loc158 = loc("/layer4/layer4.0/relu_2/Relu")
#loc159 = loc("/layer4/layer4.1/conv1/Conv")
#loc160 = loc("/layer4/layer4.1/relu/Relu")
#loc161 = loc("/layer4/layer4.1/conv2/Conv")
#loc162 = loc("/layer4/layer4.1/relu_1/Relu")
#loc163 = loc("/layer4/layer4.1/conv3/Conv")
#loc164 = loc("/layer4/layer4.1/Add")
#loc165 = loc("/layer4/layer4.1/relu_2/Relu")
#loc166 = loc("/layer4/layer4.2/conv1/Conv")
#loc167 = loc("/layer4/layer4.2/relu/Relu")
#loc168 = loc("/layer4/layer4.2/conv2/Conv")
#loc169 = loc("/layer4/layer4.2/relu_1/Relu")
#loc170 = loc("/layer4/layer4.2/conv3/Conv")
#loc171 = loc("/layer4/layer4.2/Add")
#loc172 = loc("/layer4/layer4.2/relu_2/Relu")
#loc173 = loc("/avgpool/GlobalAveragePool")
#loc174 = loc("/Flatten")
#loc175 = loc("/fc/fc.0/Gemm")
#loc176 = loc("/fc/fc.1/Relu")
#loc177 = loc("/fc/fc.2/Gemm")
#loc178 = loc(fused[#loc2, #loc3, #loc4, #loc5, #loc6, #loc7, #loc8, #loc9, #loc10, #loc11, #loc12, #loc13, #loc14, #loc15, #loc16, #loc17, #loc18, #loc19, #loc20, #loc21, #loc22, #loc23, #loc24, #loc25, #loc26, #loc27, #loc28, #loc29, #loc30, #loc31, #loc32, #loc33, #loc34, #loc35, #loc36, #loc37, #loc38, #loc39, #loc40, #loc41, #loc42, #loc43, #loc44, #loc45, #loc46, #loc47, #loc48, #loc49, #loc50, #loc51, #loc52, #loc53, #loc54, #loc55, #loc56, #loc57, #loc58, #loc59, #loc60, #loc61, #loc62, #loc63, #loc64, #loc65, #loc66, #loc67, #loc68, #loc69, #loc70, #loc71, #loc72, #loc73, #loc74, #loc75, #loc76, #loc77, #loc78, #loc79, #loc80, #loc81, #loc82, #loc83, #loc84, #loc85, #loc86, #loc87, #loc88, #loc89, #loc90, #loc91, #loc92, #loc93, #loc94, #loc95, #loc96, #loc97, #loc98, #loc99, #loc100, #loc101, #loc102, #loc103, #loc104, #loc105, #loc106, #loc107, #loc108, #loc109, #loc110, #loc111, #loc112, #loc113, #loc114, #loc115, #loc116, #loc117, #loc118, #loc119, #loc120, #loc121, #loc122, #loc123, #loc124, #loc125, #loc126, #loc127, #loc128, #loc129, #loc130, #loc131, #loc132, #loc133, #loc134, #loc135, #loc136, #loc137, #loc138, #loc139, #loc140, #loc141, #loc142, #loc143, #loc144, #loc145, #loc146, #loc147, #loc148, #loc149, #loc150, #loc151, #loc152, #loc153, #loc154, #loc155, #loc156, #loc157, #loc158, #loc159, #loc160, #loc161, #loc162, #loc163, #loc164, #loc165, #loc166, #loc167, #loc168, #loc169, #loc170, #loc171, #loc172, #loc173, #loc174, #loc175, #loc176, #loc177, #loc1])
#loc179 = loc(fused[#loc2, #loc3])
#loc180 = loc(fused[#loc57, #loc58])
#loc181 = loc(fused[#loc59, #loc60])
#loc182 = loc(fused[#loc62, #loc63, #loc64])
#loc183 = loc(fused[#loc63, #loc64])
#loc184 = loc(fused[#loc65, #loc66])
#loc185 = loc(fused[#loc67, #loc68])
#loc186 = loc(fused[#loc69, #loc70, #loc71])
#loc187 = loc(fused[#loc70, #loc71])
#loc188 = loc(fused[#loc72, #loc73])
#loc189 = loc(fused[#loc74, #loc75])
#loc190 = loc(fused[#loc76, #loc77, #loc78])
#loc191 = loc(fused[#loc77, #loc78])
#loc192 = loc(fused[#loc79, #loc80])
#loc193 = loc(fused[#loc81, #loc82])
#loc194 = loc(fused[#loc84, #loc85, #loc86])
#loc195 = loc(fused[#loc85, #loc86])
#loc196 = loc(fused[#loc87, #loc88])
#loc197 = loc(fused[#loc89, #loc90])
#loc198 = loc(fused[#loc91, #loc92, #loc93])
#loc199 = loc(fused[#loc92, #loc93])
#loc200 = loc(fused[#loc94, #loc95])
#loc201 = loc(fused[#loc96, #loc97])
#loc202 = loc(fused[#loc98, #loc99, #loc100])
#loc203 = loc(fused[#loc99, #loc100])
#loc204 = loc(fused[#loc101, #loc102])
#loc205 = loc(fused[#loc103, #loc104])
#loc206 = loc(fused[#loc105, #loc106, #loc107])
#loc207 = loc(fused[#loc106, #loc107])
#loc208 = loc(fused[#loc108, #loc109])
#loc209 = loc(fused[#loc110, #loc111])
#loc210 = loc(fused[#loc113, #loc114, #loc115])
#loc211 = loc(fused[#loc114, #loc115])
#loc212 = loc(fused[#loc116, #loc117])
#loc213 = loc(fused[#loc118, #loc119])
#loc214 = loc(fused[#loc120, #loc121, #loc122])
#loc215 = loc(fused[#loc121, #loc122])
#loc216 = loc(fused[#loc123, #loc124])
#loc217 = loc(fused[#loc125, #loc126])
#loc218 = loc(fused[#loc127, #loc128, #loc129])
#loc219 = loc(fused[#loc128, #loc129])
#loc220 = loc(fused[#loc130, #loc131])
#loc221 = loc(fused[#loc132, #loc133])
#loc222 = loc(fused[#loc134, #loc135, #loc136])
#loc223 = loc(fused[#loc135, #loc136])
#loc224 = loc(fused[#loc137, #loc138])
#loc225 = loc(fused[#loc139, #loc140])
#loc226 = loc(fused[#loc141, #loc142, #loc143])
#loc227 = loc(fused[#loc142, #loc143])
#loc228 = loc(fused[#loc144, #loc145])
#loc229 = loc(fused[#loc146, #loc147])
#loc230 = loc(fused[#loc148, #loc149, #loc150])
#loc231 = loc(fused[#loc149, #loc150])
#loc232 = loc(fused[#loc151, #loc152])
#loc233 = loc(fused[#loc153, #loc154])
#loc234 = loc(fused[#loc156, #loc157, #loc158])
#loc235 = loc(fused[#loc157, #loc158])
#loc236 = loc(fused[#loc159, #loc160])
#loc237 = loc(fused[#loc161, #loc162])
#loc238 = loc(fused[#loc163, #loc164, #loc165])
#loc239 = loc(fused[#loc164, #loc165])
#loc240 = loc(fused[#loc166, #loc167])
#loc241 = loc(fused[#loc168, #loc169])
#loc242 = loc(fused[#loc170, #loc171, #loc172])
#loc243 = loc(fused[#loc171, #loc172])
#loc244 = loc(fused[#loc173, #loc174, #loc175])
#loc245 = loc(fused[#loc175, #loc176])
#loc246 = loc(callsite(#loc1 at #loc178))
#loc247 = loc(callsite(#loc179 at #loc178))
#loc248 = loc(callsite(#loc at #loc178))
#loc249 = loc(callsite(#loc2 at #loc178))
#loc250 = loc(callsite(#loc3 at #loc178))
#loc251 = loc(callsite(#loc4 at #loc178))
#loc252 = loc(callsite(#loc5 at #loc178))
#loc253 = loc(callsite(#loc6 at #loc178))
#loc254 = loc(callsite(#loc7 at #loc178))
#loc255 = loc(callsite(#loc8 at #loc178))
#loc256 = loc(callsite(#loc9 at #loc178))
#loc257 = loc(callsite(#loc10 at #loc178))
#loc258 = loc(callsite(#loc11 at #loc178))
#loc259 = loc(callsite(#loc12 at #loc178))
#loc260 = loc(callsite(#loc13 at #loc178))
#loc261 = loc(callsite(#loc14 at #loc178))
#loc262 = loc(callsite(#loc15 at #loc178))
#loc263 = loc(callsite(#loc16 at #loc178))
#loc264 = loc(callsite(#loc17 at #loc178))
#loc265 = loc(callsite(#loc18 at #loc178))
#loc266 = loc(callsite(#loc19 at #loc178))
#loc267 = loc(callsite(#loc20 at #loc178))
#loc268 = loc(callsite(#loc21 at #loc178))
#loc269 = loc(callsite(#loc22 at #loc178))
#loc270 = loc(callsite(#loc23 at #loc178))
#loc271 = loc(callsite(#loc24 at #loc178))
#loc272 = loc(callsite(#loc25 at #loc178))
#loc273 = loc(callsite(#loc26 at #loc178))
#loc274 = loc(callsite(#loc27 at #loc178))
#loc275 = loc(callsite(#loc28 at #loc178))
#loc276 = loc(callsite(#loc29 at #loc178))
#loc277 = loc(callsite(#loc30 at #loc178))
#loc278 = loc(callsite(#loc31 at #loc178))
#loc279 = loc(callsite(#loc32 at #loc178))
#loc280 = loc(callsite(#loc33 at #loc178))
#loc281 = loc(callsite(#loc34 at #loc178))
#loc282 = loc(callsite(#loc35 at #loc178))
#loc283 = loc(callsite(#loc36 at #loc178))
#loc284 = loc(callsite(#loc37 at #loc178))
#loc285 = loc(callsite(#loc38 at #loc178))
#loc286 = loc(callsite(#loc39 at #loc178))
#loc287 = loc(callsite(#loc40 at #loc178))
#loc288 = loc(callsite(#loc41 at #loc178))
#loc289 = loc(callsite(#loc42 at #loc178))
#loc290 = loc(callsite(#loc43 at #loc178))
#loc291 = loc(callsite(#loc44 at #loc178))
#loc292 = loc(callsite(#loc45 at #loc178))
#loc293 = loc(callsite(#loc46 at #loc178))
#loc294 = loc(callsite(#loc47 at #loc178))
#loc295 = loc(callsite(#loc48 at #loc178))
#loc296 = loc(callsite(#loc49 at #loc178))
#loc297 = loc(callsite(#loc50 at #loc178))
#loc298 = loc(callsite(#loc51 at #loc178))
#loc299 = loc(callsite(#loc52 at #loc178))
#loc300 = loc(callsite(#loc53 at #loc178))
#loc301 = loc(callsite(#loc54 at #loc178))
#loc302 = loc(callsite(#loc55 at #loc178))
#loc303 = loc(callsite(#loc56 at #loc178))
#loc304 = loc(callsite(#loc180 at #loc178))
#loc305 = loc(callsite(#loc57 at #loc178))
#loc306 = loc(callsite(#loc58 at #loc178))
#loc307 = loc(callsite(#loc181 at #loc178))
#loc308 = loc(callsite(#loc59 at #loc178))
#loc309 = loc(callsite(#loc60 at #loc178))
#loc310 = loc(callsite(#loc61 at #loc178))
#loc311 = loc(callsite(#loc182 at #loc178))
#loc312 = loc(callsite(#loc62 at #loc178))
#loc313 = loc(callsite(#loc183 at #loc178))
#loc314 = loc(callsite(#loc63 at #loc178))
#loc315 = loc(callsite(#loc64 at #loc178))
#loc316 = loc(callsite(#loc184 at #loc178))
#loc317 = loc(callsite(#loc65 at #loc178))
#loc318 = loc(callsite(#loc66 at #loc178))
#loc319 = loc(callsite(#loc185 at #loc178))
#loc320 = loc(callsite(#loc67 at #loc178))
#loc321 = loc(callsite(#loc68 at #loc178))
#loc322 = loc(callsite(#loc186 at #loc178))
#loc323 = loc(callsite(#loc69 at #loc178))
#loc324 = loc(callsite(#loc187 at #loc178))
#loc325 = loc(callsite(#loc70 at #loc178))
#loc326 = loc(callsite(#loc71 at #loc178))
#loc327 = loc(callsite(#loc188 at #loc178))
#loc328 = loc(callsite(#loc72 at #loc178))
#loc329 = loc(callsite(#loc73 at #loc178))
#loc330 = loc(callsite(#loc189 at #loc178))
#loc331 = loc(callsite(#loc74 at #loc178))
#loc332 = loc(callsite(#loc75 at #loc178))
#loc333 = loc(callsite(#loc190 at #loc178))
#loc334 = loc(callsite(#loc76 at #loc178))
#loc335 = loc(callsite(#loc191 at #loc178))
#loc336 = loc(callsite(#loc77 at #loc178))
#loc337 = loc(callsite(#loc78 at #loc178))
#loc338 = loc(callsite(#loc192 at #loc178))
#loc339 = loc(callsite(#loc79 at #loc178))
#loc340 = loc(callsite(#loc80 at #loc178))
#loc341 = loc(callsite(#loc193 at #loc178))
#loc342 = loc(callsite(#loc81 at #loc178))
#loc343 = loc(callsite(#loc82 at #loc178))
#loc344 = loc(callsite(#loc83 at #loc178))
#loc345 = loc(callsite(#loc194 at #loc178))
#loc346 = loc(callsite(#loc84 at #loc178))
#loc347 = loc(callsite(#loc195 at #loc178))
#loc348 = loc(callsite(#loc85 at #loc178))
#loc349 = loc(callsite(#loc86 at #loc178))
#loc350 = loc(callsite(#loc196 at #loc178))
#loc351 = loc(callsite(#loc87 at #loc178))
#loc352 = loc(callsite(#loc88 at #loc178))
#loc353 = loc(callsite(#loc197 at #loc178))
#loc354 = loc(callsite(#loc89 at #loc178))
#loc355 = loc(callsite(#loc90 at #loc178))
#loc356 = loc(callsite(#loc198 at #loc178))
#loc357 = loc(callsite(#loc91 at #loc178))
#loc358 = loc(callsite(#loc199 at #loc178))
#loc359 = loc(callsite(#loc92 at #loc178))
#loc360 = loc(callsite(#loc93 at #loc178))
#loc361 = loc(callsite(#loc200 at #loc178))
#loc362 = loc(callsite(#loc94 at #loc178))
#loc363 = loc(callsite(#loc95 at #loc178))
#loc364 = loc(callsite(#loc201 at #loc178))
#loc365 = loc(callsite(#loc96 at #loc178))
#loc366 = loc(callsite(#loc97 at #loc178))
#loc367 = loc(callsite(#loc202 at #loc178))
#loc368 = loc(callsite(#loc98 at #loc178))
#loc369 = loc(callsite(#loc203 at #loc178))
#loc370 = loc(callsite(#loc99 at #loc178))
#loc371 = loc(callsite(#loc100 at #loc178))
#loc372 = loc(callsite(#loc204 at #loc178))
#loc373 = loc(callsite(#loc101 at #loc178))
#loc374 = loc(callsite(#loc102 at #loc178))
#loc375 = loc(callsite(#loc205 at #loc178))
#loc376 = loc(callsite(#loc103 at #loc178))
#loc377 = loc(callsite(#loc104 at #loc178))
#loc378 = loc(callsite(#loc206 at #loc178))
#loc379 = loc(callsite(#loc105 at #loc178))
#loc380 = loc(callsite(#loc207 at #loc178))
#loc381 = loc(callsite(#loc106 at #loc178))
#loc382 = loc(callsite(#loc107 at #loc178))
#loc383 = loc(callsite(#loc208 at #loc178))
#loc384 = loc(callsite(#loc108 at #loc178))
#loc385 = loc(callsite(#loc109 at #loc178))
#loc386 = loc(callsite(#loc209 at #loc178))
#loc387 = loc(callsite(#loc110 at #loc178))
#loc388 = loc(callsite(#loc111 at #loc178))
#loc389 = loc(callsite(#loc112 at #loc178))
#loc390 = loc(callsite(#loc210 at #loc178))
#loc391 = loc(callsite(#loc113 at #loc178))
#loc392 = loc(callsite(#loc211 at #loc178))
#loc393 = loc(callsite(#loc114 at #loc178))
#loc394 = loc(callsite(#loc115 at #loc178))
#loc395 = loc(callsite(#loc212 at #loc178))
#loc396 = loc(callsite(#loc116 at #loc178))
#loc397 = loc(callsite(#loc117 at #loc178))
#loc398 = loc(callsite(#loc213 at #loc178))
#loc399 = loc(callsite(#loc118 at #loc178))
#loc400 = loc(callsite(#loc119 at #loc178))
#loc401 = loc(callsite(#loc214 at #loc178))
#loc402 = loc(callsite(#loc120 at #loc178))
#loc403 = loc(callsite(#loc215 at #loc178))
#loc404 = loc(callsite(#loc121 at #loc178))
#loc405 = loc(callsite(#loc122 at #loc178))
#loc406 = loc(callsite(#loc216 at #loc178))
#loc407 = loc(callsite(#loc123 at #loc178))
#loc408 = loc(callsite(#loc124 at #loc178))
#loc409 = loc(callsite(#loc217 at #loc178))
#loc410 = loc(callsite(#loc125 at #loc178))
#loc411 = loc(callsite(#loc126 at #loc178))
#loc412 = loc(callsite(#loc218 at #loc178))
#loc413 = loc(callsite(#loc127 at #loc178))
#loc414 = loc(callsite(#loc219 at #loc178))
#loc415 = loc(callsite(#loc128 at #loc178))
#loc416 = loc(callsite(#loc129 at #loc178))
#loc417 = loc(callsite(#loc220 at #loc178))
#loc418 = loc(callsite(#loc130 at #loc178))
#loc419 = loc(callsite(#loc131 at #loc178))
#loc420 = loc(callsite(#loc221 at #loc178))
#loc421 = loc(callsite(#loc132 at #loc178))
#loc422 = loc(callsite(#loc133 at #loc178))
#loc423 = loc(callsite(#loc222 at #loc178))
#loc424 = loc(callsite(#loc134 at #loc178))
#loc425 = loc(callsite(#loc223 at #loc178))
#loc426 = loc(callsite(#loc135 at #loc178))
#loc427 = loc(callsite(#loc136 at #loc178))
#loc428 = loc(callsite(#loc224 at #loc178))
#loc429 = loc(callsite(#loc137 at #loc178))
#loc430 = loc(callsite(#loc138 at #loc178))
#loc431 = loc(callsite(#loc225 at #loc178))
#loc432 = loc(callsite(#loc139 at #loc178))
#loc433 = loc(callsite(#loc140 at #loc178))
#loc434 = loc(callsite(#loc226 at #loc178))
#loc435 = loc(callsite(#loc141 at #loc178))
#loc436 = loc(callsite(#loc227 at #loc178))
#loc437 = loc(callsite(#loc142 at #loc178))
#loc438 = loc(callsite(#loc143 at #loc178))
#loc439 = loc(callsite(#loc228 at #loc178))
#loc440 = loc(callsite(#loc144 at #loc178))
#loc441 = loc(callsite(#loc145 at #loc178))
#loc442 = loc(callsite(#loc229 at #loc178))
#loc443 = loc(callsite(#loc146 at #loc178))
#loc444 = loc(callsite(#loc147 at #loc178))
#loc445 = loc(callsite(#loc230 at #loc178))
#loc446 = loc(callsite(#loc148 at #loc178))
#loc447 = loc(callsite(#loc231 at #loc178))
#loc448 = loc(callsite(#loc149 at #loc178))
#loc449 = loc(callsite(#loc150 at #loc178))
#loc450 = loc(callsite(#loc232 at #loc178))
#loc451 = loc(callsite(#loc151 at #loc178))
#loc452 = loc(callsite(#loc152 at #loc178))
#loc453 = loc(callsite(#loc233 at #loc178))
#loc454 = loc(callsite(#loc153 at #loc178))
#loc455 = loc(callsite(#loc154 at #loc178))
#loc456 = loc(callsite(#loc155 at #loc178))
#loc457 = loc(callsite(#loc234 at #loc178))
#loc458 = loc(callsite(#loc156 at #loc178))
#loc459 = loc(callsite(#loc235 at #loc178))
#loc460 = loc(callsite(#loc157 at #loc178))
#loc461 = loc(callsite(#loc158 at #loc178))
#loc462 = loc(callsite(#loc236 at #loc178))
#loc463 = loc(callsite(#loc159 at #loc178))
#loc464 = loc(callsite(#loc160 at #loc178))
#loc465 = loc(callsite(#loc237 at #loc178))
#loc466 = loc(callsite(#loc161 at #loc178))
#loc467 = loc(callsite(#loc162 at #loc178))
#loc468 = loc(callsite(#loc238 at #loc178))
#loc469 = loc(callsite(#loc163 at #loc178))
#loc470 = loc(callsite(#loc239 at #loc178))
#loc471 = loc(callsite(#loc164 at #loc178))
#loc472 = loc(callsite(#loc165 at #loc178))
#loc473 = loc(callsite(#loc240 at #loc178))
#loc474 = loc(callsite(#loc166 at #loc178))
#loc475 = loc(callsite(#loc167 at #loc178))
#loc476 = loc(callsite(#loc241 at #loc178))
#loc477 = loc(callsite(#loc168 at #loc178))
#loc478 = loc(callsite(#loc169 at #loc178))
#loc479 = loc(callsite(#loc242 at #loc178))
#loc480 = loc(callsite(#loc170 at #loc178))
#loc481 = loc(callsite(#loc243 at #loc178))
#loc482 = loc(callsite(#loc171 at #loc178))
#loc483 = loc(callsite(#loc172 at #loc178))
#loc484 = loc(callsite(#loc173 at #loc178))
#loc485 = loc(callsite(#loc244 at #loc178))
#loc486 = loc(callsite(#loc245 at #loc178))
#loc487 = loc(callsite(#loc175 at #loc178))
#loc488 = loc(callsite(#loc176 at #loc178))
#loc489 = loc(callsite(#loc177 at #loc178))
