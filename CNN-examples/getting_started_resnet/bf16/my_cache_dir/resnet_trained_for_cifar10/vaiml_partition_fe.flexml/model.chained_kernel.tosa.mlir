#loc = loc(unknown)
module attributes {
  vaimlconf.device = "stx",
  vaimlconf.install_dir = "/scratch/thozerbs/ryzen_ai/venv/lib/python3.12/site-packages/flexml/flexml_extras",
  vaimlconf.library_metadata = ["${vaimlconf.install_dir}/../../../../../../../git/RyzenAI-SW/CNN-examples/getting_started_resnet/bf16/my_cache_dir/resnet_trained_for_cifar10/vaiml_partition_fe.flexml/custom_ops", "/embedded/libraryMetadata/L1", "/embedded/libraryMetadata/L1", "/embedded/libraryMetadata/L2", "${vaimlconf.install_dir}/../../vitis_mllib/L1/metadata", "${vaimlconf.install_dir}/../../vitis_mllib/L2/metadata", "/embedded/L1/metadata", "/embedded/L2/metadata", "/embedded/libraryMetadata/DMAC", "/embedded/tiling-recipe-specs"],
  vaimlconf.overlay_for_TGs = "rai_1x4x4",
  vaimlconf.single_core_compiler = "peano",
  vaimlconf.unified_overlay = "rai_2x4x4.json"} {
  func.func @forward(%arg0: tensor<1x3x32x32xbf16> {onnx.name = "input", xten_nn.RTAnnotations = {scale_factor = 1.000000e+00 : f32, tensor_name = "input"}} loc(unknown)) -> (tensor<1x10xbf16> {onnx.name = "output", xten_nn.RTAnnotations = {scale_factor = 1.000000e+00 : f32, tensor_name = "output"}}) attributes {
    max_heap_size = 2304 : ui32,
    max_stack_size = 1600 : ui32,
    stack_heap_start_address = 46016 : ui32,
    total_stack_heap_region_size = 6272 : ui32} {
    %0 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<2048x512x1x1xbf16>}> : () -> tensor<2048x512x1x1xbf16> loc(#loc)
    %1 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<512x512x3x3xbf16>}> : () -> tensor<512x512x3x3xbf16> loc(#loc)
    %2 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<512x2048x1x1xbf16>}> : () -> tensor<512x2048x1x1xbf16> loc(#loc)
    %3 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<2048x512x1x1xbf16>}> : () -> tensor<2048x512x1x1xbf16> loc(#loc)
    %4 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<512x512x3x3xbf16>}> : () -> tensor<512x512x3x3xbf16> loc(#loc)
    %5 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<512x2048x1x1xbf16>}> : () -> tensor<512x2048x1x1xbf16> loc(#loc)
    %6 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<2048x1024x1x1xbf16>}> : () -> tensor<2048x1024x1x1xbf16> loc(#loc)
    %7 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<2048x512x1x1xbf16>}> : () -> tensor<2048x512x1x1xbf16> loc(#loc)
    %8 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<512x512x3x3xbf16>}> : () -> tensor<512x512x3x3xbf16> loc(#loc)
    %9 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<512x1024x1x1xbf16>}> : () -> tensor<512x1024x1x1xbf16> loc(#loc)
    %10 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<1024x256x1x1xbf16>}> : () -> tensor<1024x256x1x1xbf16> loc(#loc)
    %11 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<256x256x3x3xbf16>}> : () -> tensor<256x256x3x3xbf16> loc(#loc)
    %12 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<256x1024x1x1xbf16>}> : () -> tensor<256x1024x1x1xbf16> loc(#loc)
    %13 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<1024x256x1x1xbf16>}> : () -> tensor<1024x256x1x1xbf16> loc(#loc)
    %14 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<256x256x3x3xbf16>}> : () -> tensor<256x256x3x3xbf16> loc(#loc)
    %15 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<256x1024x1x1xbf16>}> : () -> tensor<256x1024x1x1xbf16> loc(#loc)
    %16 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<1024x256x1x1xbf16>}> : () -> tensor<1024x256x1x1xbf16> loc(#loc)
    %17 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<256x256x3x3xbf16>}> : () -> tensor<256x256x3x3xbf16> loc(#loc)
    %18 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<256x1024x1x1xbf16>}> : () -> tensor<256x1024x1x1xbf16> loc(#loc)
    %19 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<1024x256x1x1xbf16>}> : () -> tensor<1024x256x1x1xbf16> loc(#loc)
    %20 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<256x256x3x3xbf16>}> : () -> tensor<256x256x3x3xbf16> loc(#loc)
    %21 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<256x1024x1x1xbf16>}> : () -> tensor<256x1024x1x1xbf16> loc(#loc)
    %22 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<1024x256x1x1xbf16>}> : () -> tensor<1024x256x1x1xbf16> loc(#loc)
    %23 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<256x256x3x3xbf16>}> : () -> tensor<256x256x3x3xbf16> loc(#loc)
    %24 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<256x1024x1x1xbf16>}> : () -> tensor<256x1024x1x1xbf16> loc(#loc)
    %25 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<1024x512x1x1xbf16>}> : () -> tensor<1024x512x1x1xbf16> loc(#loc)
    %26 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<1024x256x1x1xbf16>}> : () -> tensor<1024x256x1x1xbf16> loc(#loc)
    %27 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<256x256x3x3xbf16>}> : () -> tensor<256x256x3x3xbf16> loc(#loc)
    %28 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<256x512x1x1xbf16>}> : () -> tensor<256x512x1x1xbf16> loc(#loc)
    %29 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<512x128x1x1xbf16>}> : () -> tensor<512x128x1x1xbf16> loc(#loc)
    %30 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<128x128x3x3xbf16>}> : () -> tensor<128x128x3x3xbf16> loc(#loc)
    %31 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<128x512x1x1xbf16>}> : () -> tensor<128x512x1x1xbf16> loc(#loc)
    %32 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<512x128x1x1xbf16>}> : () -> tensor<512x128x1x1xbf16> loc(#loc)
    %33 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<128x128x3x3xbf16>}> : () -> tensor<128x128x3x3xbf16> loc(#loc)
    %34 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<128x512x1x1xbf16>}> : () -> tensor<128x512x1x1xbf16> loc(#loc)
    %35 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<512x128x1x1xbf16>}> : () -> tensor<512x128x1x1xbf16> loc(#loc)
    %36 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<128x128x3x3xbf16>}> : () -> tensor<128x128x3x3xbf16> loc(#loc)
    %37 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<128x512x1x1xbf16>}> : () -> tensor<128x512x1x1xbf16> loc(#loc)
    %38 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<512x256x1x1xbf16>}> : () -> tensor<512x256x1x1xbf16> loc(#loc)
    %39 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<512x128x1x1xbf16>}> : () -> tensor<512x128x1x1xbf16> loc(#loc)
    %40 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<128x128x3x3xbf16>}> : () -> tensor<128x128x3x3xbf16> loc(#loc)
    %41 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<128x256x1x1xbf16>}> : () -> tensor<128x256x1x1xbf16> loc(#loc)
    %42 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<256x64x1x1xbf16>}> : () -> tensor<256x64x1x1xbf16> loc(#loc)
    %43 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<64x64x3x3xbf16>}> : () -> tensor<64x64x3x3xbf16> loc(#loc)
    %44 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<64x256x1x1xbf16>}> : () -> tensor<64x256x1x1xbf16> loc(#loc)
    %45 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<256x64x1x1xbf16>}> : () -> tensor<256x64x1x1xbf16> loc(#loc)
    %46 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<64x64x3x3xbf16>}> : () -> tensor<64x64x3x3xbf16> loc(#loc)
    %47 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<64x256x1x1xbf16>}> : () -> tensor<64x256x1x1xbf16> loc(#loc)
    %48 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<256x64x1x1xbf16>}> : () -> tensor<256x64x1x1xbf16> loc(#loc)
    %49 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<256x64x1x1xbf16>}> : () -> tensor<256x64x1x1xbf16> loc(#loc)
    %50 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<64x64x3x3xbf16>}> : () -> tensor<64x64x3x3xbf16> loc(#loc)
    %51 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<64x64x1x1xbf16>}> : () -> tensor<64x64x1x1xbf16> loc(#loc)
    %52 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<1x64x10xbf16>}> : () -> tensor<1x64x10xbf16> loc(#loc)
    %53 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<1x2048x64xbf16>}> : () -> tensor<1x2048x64xbf16> loc(#loc)
    %54 = "tosa.const"() <{value = dense<[[[7.714840e-02, -1.289060e-01, -7.324210e-02, 3.417970e-02, 6.079100e-02, 3.369140e-02, 9.521480e-02, 1.977540e-02, -3.784180e-02, -7.958980e-02]]]> : tensor<1x1x10xbf16>}> : () -> tensor<1x1x10xbf16> loc(#loc)
    %55 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<1x1x64xbf16>}> : () -> tensor<1x1x64xbf16> loc(#loc)
    %56 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<256xbf16>}> : () -> tensor<256xbf16> loc(#loc1)
    %57 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<512xbf16>}> : () -> tensor<512xbf16> loc(#loc2)
    %58 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<1024xbf16>}> : () -> tensor<1024xbf16> loc(#loc3)
    %59 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<128xbf16>}> : () -> tensor<128xbf16> loc(#loc4)
    %60 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<128xbf16>}> : () -> tensor<128xbf16> loc(#loc5)
    %61 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<512xbf16>}> : () -> tensor<512xbf16> loc(#loc6)
    %62 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<128xbf16>}> : () -> tensor<128xbf16> loc(#loc7)
    %63 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<1024xbf16>}> : () -> tensor<1024xbf16> loc(#loc8)
    %64 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<64xbf16>}> : () -> tensor<64xbf16> loc(#loc9)
    %65 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<128xbf16>}> : () -> tensor<128xbf16> loc(#loc10)
    %66 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<256xbf16>}> : () -> tensor<256xbf16> loc(#loc11)
    %67 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<512xbf16>}> : () -> tensor<512xbf16> loc(#loc12)
    %68 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<256xbf16>}> : () -> tensor<256xbf16> loc(#loc13)
    %69 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<128xbf16>}> : () -> tensor<128xbf16> loc(#loc14)
    %70 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<512xbf16>}> : () -> tensor<512xbf16> loc(#loc15)
    %71 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<256xbf16>}> : () -> tensor<256xbf16> loc(#loc16)
    %72 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<512xbf16>}> : () -> tensor<512xbf16> loc(#loc17)
    %73 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<256xbf16>}> : () -> tensor<256xbf16> loc(#loc18)
    %74 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<64xbf16>}> : () -> tensor<64xbf16> loc(#loc19)
    %75 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<512xbf16>}> : () -> tensor<512xbf16> loc(#loc20)
    %76 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<1024xbf16>}> : () -> tensor<1024xbf16> loc(#loc21)
    %77 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<256xbf16>}> : () -> tensor<256xbf16> loc(#loc22)
    %78 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<256xbf16>}> : () -> tensor<256xbf16> loc(#loc23)
    %79 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<256xbf16>}> : () -> tensor<256xbf16> loc(#loc24)
    %80 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<64xbf16>}> : () -> tensor<64xbf16> loc(#loc25)
    %81 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<128xbf16>}> : () -> tensor<128xbf16> loc(#loc26)
    %82 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<512xbf16>}> : () -> tensor<512xbf16> loc(#loc27)
    %83 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<256xbf16>}> : () -> tensor<256xbf16> loc(#loc28)
    %84 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<128xbf16>}> : () -> tensor<128xbf16> loc(#loc29)
    %85 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<128xbf16>}> : () -> tensor<128xbf16> loc(#loc30)
    %86 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<256xbf16>}> : () -> tensor<256xbf16> loc(#loc31)
    %87 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<2048xbf16>}> : () -> tensor<2048xbf16> loc(#loc32)
    %88 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<256xbf16>}> : () -> tensor<256xbf16> loc(#loc33)
    %89 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<1024xbf16>}> : () -> tensor<1024xbf16> loc(#loc34)
    %90 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<512xbf16>}> : () -> tensor<512xbf16> loc(#loc35)
    %91 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<1024xbf16>}> : () -> tensor<1024xbf16> loc(#loc36)
    %92 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<256xbf16>}> : () -> tensor<256xbf16> loc(#loc37)
    %93 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<2048xbf16>}> : () -> tensor<2048xbf16> loc(#loc38)
    %94 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<2048xbf16>}> : () -> tensor<2048xbf16> loc(#loc39)
    %95 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<256xbf16>}> : () -> tensor<256xbf16> loc(#loc40)
    %96 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<512xbf16>}> : () -> tensor<512xbf16> loc(#loc41)
    %97 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<2048xbf16>}> : () -> tensor<2048xbf16> loc(#loc42)
    %98 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<512xbf16>}> : () -> tensor<512xbf16> loc(#loc43)
    %99 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<256xbf16>}> : () -> tensor<256xbf16> loc(#loc44)
    %100 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<64xbf16>}> : () -> tensor<64xbf16> loc(#loc45)
    %101 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<1024xbf16>}> : () -> tensor<1024xbf16> loc(#loc46)
    %102 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<512xbf16>}> : () -> tensor<512xbf16> loc(#loc47)
    %103 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<1024xbf16>}> : () -> tensor<1024xbf16> loc(#loc48)
    %104 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<64xbf16>}> : () -> tensor<64xbf16> loc(#loc49)
    %105 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<64xbf16>}> : () -> tensor<64xbf16> loc(#loc50)
    %106 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<256xbf16>}> : () -> tensor<256xbf16> loc(#loc51)
    %107 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<64xbf16>}> : () -> tensor<64xbf16> loc(#loc52)
    %108 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<256xbf16>}> : () -> tensor<256xbf16> loc(#loc53)
    %109 = "tosa.const"() <{value = dense_resource<__elided__> : tensor<64x3x7x7xbf16>}> : () -> tensor<64x3x7x7xbf16> loc(#loc178)
    %110 = xten_nn.subgraph (%arg1 = %arg0: tensor<1x3x32x32xbf16>, %arg2 = %109: tensor<64x3x7x7xbf16>, %arg3 = %105: tensor<64xbf16>)  attributes {
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
        %170 = "tosa.const"() <{value = dense<[0, 3, 1, 2]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc)
        %171 = "tosa.const"() <{value = dense<[0, 2, 3, 1]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc)
        %172 = tosa.transpose %arg5, %171 : (tensor<64x3x7x7xbf16>, tensor<4xi32>) -> tensor<64x7x7x3xbf16> loc(#loc178)
        %173 = tosa.transpose %arg4, %171 : (tensor<1x3x32x32xbf16>, tensor<4xi32>) -> tensor<1x32x32x3xbf16> loc(#loc178)
        %174 = tosa.conv2d %173, %172, %arg6 {
          PartOfLayerName = "/conv1/Conv",
          PartOfOutputName = "/conv1/Conv",
          acc_type = f32,
          dilation = array<i64: 1, 1>,
          pad = array<i64: 3, 2, 3, 2>,
          stride = array<i64: 2, 2>} : (tensor<1x32x32x3xbf16>, tensor<64x7x7x3xbf16>, tensor<64xbf16>) -> tensor<1x16x16x64xbf16> loc(#loc54)
        %175 = tosa.clamp %174 {
          LayerName = "/relu/Relu",
          OutputName = "/relu/Relu",
          max_fp = 3.40282347E+38 : f32,
          max_int = 2147483647 : i64,
          min_fp = 0.000000e+00 : f32,
          min_int = 0 : i64} : (tensor<1x16x16x64xbf16>) -> tensor<1x16x16x64xbf16> loc(#loc55)
        %176 = tosa.transpose %175, %170 : (tensor<1x16x16x64xbf16>, tensor<4xi32>) -> tensor<1x64x16x16xbf16> loc(#loc178)
        xten_nn.output %176 : tensor<1x64x16x16xbf16> loc(#loc55)
      } -> tensor<1x64x16x16xbf16> loc(#loc178)
      xten_nn.output %169 : tensor<1x64x16x16xbf16> loc(#loc178)
    } -> tensor<1x64x16x16xbf16> loc(#loc178)
    %111 = xten_nn.subgraph (%arg1 = %110: tensor<1x64x16x16xbf16>)  attributes {
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
        %170 = "tosa.const"() <{value = dense<[0, 2, 3, 1]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc)
        %171 = "tosa.const"() <{value = dense<[0, 3, 1, 2]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc)
        %172 = tosa.const_shape  {value = dense<[0, 0, 0, 0, 1, 0, 1, 0]> : tensor<8xindex>} : () -> !tosa.shape<8> loc(#loc)
        %173 = "tosa.const"() <{value = dense<0xFF80> : tensor<bf16>}> : () -> tensor<bf16> loc(#loc)
        %174 = tosa.pad %arg2, %172, %173 : (tensor<1x64x16x16xbf16>, !tosa.shape<8>, tensor<bf16>) -> tensor<1x64x17x17xbf16> loc(#loc56)
        %175 = tosa.transpose %174, %170 : (tensor<1x64x17x17xbf16>, tensor<4xi32>) -> tensor<1x17x17x64xbf16> loc(#loc56)
        %176 = tosa.max_pool2d %175 {
          OutputName = "/maxpool/MaxPool",
          PartOfLayerName = "/maxpool/MaxPool",
          kernel = array<i64: 3, 3>,
          pad = array<i64: 0, 0, 0, 0>,
          stride = array<i64: 2, 2>} : (tensor<1x17x17x64xbf16>) -> tensor<1x8x8x64xbf16> loc(#loc56)
        %177 = tosa.transpose %176, %171 : (tensor<1x8x8x64xbf16>, tensor<4xi32>) -> tensor<1x64x8x8xbf16> loc(#loc56)
        xten_nn.output %177 : tensor<1x64x8x8xbf16> loc(#loc56)
      } -> tensor<1x64x8x8xbf16> loc(#loc56)
      xten_nn.output %169 : tensor<1x64x8x8xbf16> loc(#loc56)
    } -> tensor<1x64x8x8xbf16> loc(#loc56)
    %112 = xten_nn.subgraph (%arg1 = %111: tensor<1x64x8x8xbf16>, %arg2 = %51: tensor<64x64x1x1xbf16>, %arg3 = %104: tensor<64xbf16>)  attributes {
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
        %170 = "tosa.const"() <{value = dense<[0, 3, 1, 2]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc)
        %171 = "tosa.const"() <{value = dense<[0, 2, 3, 1]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc)
        %172 = tosa.reshape %arg5 {new_shape = array<i64: 64, 1, 1, 64>} : (tensor<64x64x1x1xbf16>) -> tensor<64x1x1x64xbf16> loc(#loc179)
        %173 = tosa.transpose %arg4, %171 : (tensor<1x64x8x8xbf16>, tensor<4xi32>) -> tensor<1x8x8x64xbf16> loc(#loc179)
        %174 = tosa.conv2d %173, %172, %arg6 {
          PartOfLayerName = "/layer1/layer1.0/conv1/Conv",
          PartOfOutputName = "/layer1/layer1.0/conv1/Conv",
          acc_type = f32,
          dilation = array<i64: 1, 1>,
          pad = array<i64: 0, 0, 0, 0>,
          stride = array<i64: 1, 1>} : (tensor<1x8x8x64xbf16>, tensor<64x1x1x64xbf16>, tensor<64xbf16>) -> tensor<1x8x8x64xbf16> loc(#loc57)
        %175 = tosa.clamp %174 {
          LayerName = "/layer1/layer1.0/relu/Relu",
          OutputName = "/layer1/layer1.0/relu/Relu",
          max_fp = 3.40282347E+38 : f32,
          max_int = 2147483647 : i64,
          min_fp = 0.000000e+00 : f32,
          min_int = 0 : i64} : (tensor<1x8x8x64xbf16>) -> tensor<1x8x8x64xbf16> loc(#loc58)
        %176 = tosa.transpose %175, %170 : (tensor<1x8x8x64xbf16>, tensor<4xi32>) -> tensor<1x64x8x8xbf16> loc(#loc179)
        xten_nn.output %176 : tensor<1x64x8x8xbf16> loc(#loc58)
      } -> tensor<1x64x8x8xbf16> loc(#loc179)
      xten_nn.output %169 : tensor<1x64x8x8xbf16> loc(#loc179)
    } -> tensor<1x64x8x8xbf16> loc(#loc179)
    %113 = xten_nn.subgraph (%arg1 = %112: tensor<1x64x8x8xbf16>, %arg2 = %50: tensor<64x64x3x3xbf16>, %arg3 = %74: tensor<64xbf16>)  attributes {
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
        %170 = "tosa.const"() <{value = dense<[0, 3, 1, 2]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc)
        %171 = "tosa.const"() <{value = dense<[0, 2, 3, 1]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc)
        %172 = tosa.transpose %arg5, %171 : (tensor<64x64x3x3xbf16>, tensor<4xi32>) -> tensor<64x3x3x64xbf16> loc(#loc180)
        %173 = tosa.transpose %arg4, %171 : (tensor<1x64x8x8xbf16>, tensor<4xi32>) -> tensor<1x8x8x64xbf16> loc(#loc180)
        %174 = tosa.conv2d %173, %172, %arg6 {
          PartOfLayerName = "/layer1/layer1.0/conv2/Conv",
          PartOfOutputName = "/layer1/layer1.0/conv2/Conv",
          acc_type = f32,
          dilation = array<i64: 1, 1>,
          pad = array<i64: 1, 1, 1, 1>,
          stride = array<i64: 1, 1>} : (tensor<1x8x8x64xbf16>, tensor<64x3x3x64xbf16>, tensor<64xbf16>) -> tensor<1x8x8x64xbf16> loc(#loc59)
        %175 = tosa.clamp %174 {
          LayerName = "/layer1/layer1.0/relu_1/Relu",
          OutputName = "/layer1/layer1.0/relu_1/Relu",
          max_fp = 3.40282347E+38 : f32,
          max_int = 2147483647 : i64,
          min_fp = 0.000000e+00 : f32,
          min_int = 0 : i64} : (tensor<1x8x8x64xbf16>) -> tensor<1x8x8x64xbf16> loc(#loc60)
        %176 = tosa.transpose %175, %170 : (tensor<1x8x8x64xbf16>, tensor<4xi32>) -> tensor<1x64x8x8xbf16> loc(#loc180)
        xten_nn.output %176 : tensor<1x64x8x8xbf16> loc(#loc60)
      } -> tensor<1x64x8x8xbf16> loc(#loc180)
      xten_nn.output %169 : tensor<1x64x8x8xbf16> loc(#loc180)
    } -> tensor<1x64x8x8xbf16> loc(#loc180)
    %114 = xten_nn.subgraph (%arg1 = %111: tensor<1x64x8x8xbf16>, %arg2 = %48: tensor<256x64x1x1xbf16>, %arg3 = %106: tensor<256xbf16>)  attributes {
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
        %170 = "tosa.const"() <{value = dense<[0, 3, 1, 2]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc)
        %171 = "tosa.const"() <{value = dense<[0, 2, 3, 1]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc)
        %172 = tosa.reshape %arg5 {new_shape = array<i64: 256, 1, 1, 64>} : (tensor<256x64x1x1xbf16>) -> tensor<256x1x1x64xbf16> loc(#loc61)
        %173 = tosa.transpose %arg4, %171 : (tensor<1x64x8x8xbf16>, tensor<4xi32>) -> tensor<1x8x8x64xbf16> loc(#loc61)
        %174 = tosa.conv2d %173, %172, %arg6 {
          PartOfLayerName = "/layer1/layer1.0/downsample/downsample.0/Conv",
          PartOfOutputName = "/layer1/layer1.0/downsample/downsample.0/Conv",
          acc_type = f32,
          dilation = array<i64: 1, 1>,
          pad = array<i64: 0, 0, 0, 0>,
          stride = array<i64: 1, 1>} : (tensor<1x8x8x64xbf16>, tensor<256x1x1x64xbf16>, tensor<256xbf16>) -> tensor<1x8x8x256xbf16> loc(#loc61)
        %175 = tosa.transpose %174, %170 : (tensor<1x8x8x256xbf16>, tensor<4xi32>) -> tensor<1x256x8x8xbf16> loc(#loc61)
        xten_nn.output %175 : tensor<1x256x8x8xbf16> loc(#loc61)
      } -> tensor<1x256x8x8xbf16> loc(#loc61)
      xten_nn.output %169 : tensor<1x256x8x8xbf16> loc(#loc61)
    } -> tensor<1x256x8x8xbf16> loc(#loc61)
    %115 = xten_nn.subgraph (%arg1 = %113: tensor<1x64x8x8xbf16>, %arg2 = %49: tensor<256x64x1x1xbf16>, %arg3 = %108: tensor<256xbf16>, %arg4 = %114: tensor<1x256x8x8xbf16>)  attributes {
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
        %171 = "tosa.const"() <{value = dense<[0, 3, 1, 2]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc)
        %172 = "tosa.const"() <{value = dense<[0, 2, 3, 1]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc)
        %173 = tosa.reshape %arg6 {new_shape = array<i64: 256, 1, 1, 64>} : (tensor<256x64x1x1xbf16>) -> tensor<256x1x1x64xbf16> loc(#loc62)
        %174 = tosa.transpose %arg5, %172 : (tensor<1x64x8x8xbf16>, tensor<4xi32>) -> tensor<1x8x8x64xbf16> loc(#loc62)
        %175 = tosa.conv2d %174, %173, %arg7 {
          PartOfLayerName = "/layer1/layer1.0/conv3/Conv",
          PartOfOutputName = "/layer1/layer1.0/conv3/Conv",
          acc_type = f32,
          dilation = array<i64: 1, 1>,
          pad = array<i64: 0, 0, 0, 0>,
          stride = array<i64: 1, 1>} : (tensor<1x8x8x64xbf16>, tensor<256x1x1x64xbf16>, tensor<256xbf16>) -> tensor<1x8x8x256xbf16> loc(#loc62)
        %176 = tosa.transpose %175, %171 : (tensor<1x8x8x256xbf16>, tensor<4xi32>) -> tensor<1x256x8x8xbf16> loc(#loc62)
        xten_nn.output %176 : tensor<1x256x8x8xbf16> loc(#loc62)
      } -> tensor<1x256x8x8xbf16> loc(#loc62)
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
        %171 = tosa.add %arg5, %arg6 {LayerName = "/layer1/layer1.0/Add", OutputName = "/layer1/layer1.0/Add"} : (tensor<1x256x8x8xbf16>, tensor<1x256x8x8xbf16>) -> tensor<1x256x8x8xbf16> loc(#loc63)
        %172 = tosa.clamp %171 {
          LayerName = "/layer1/layer1.0/relu_2/Relu",
          OutputName = "/layer1/layer1.0/relu_2/Relu",
          max_fp = 3.40282347E+38 : f32,
          max_int = 2147483647 : i64,
          min_fp = 0.000000e+00 : f32,
          min_int = 0 : i64} : (tensor<1x256x8x8xbf16>) -> tensor<1x256x8x8xbf16> loc(#loc64)
        xten_nn.output %172 : tensor<1x256x8x8xbf16> loc(#loc64)
      } -> tensor<1x256x8x8xbf16> loc(#loc182)
      xten_nn.output %170 : tensor<1x256x8x8xbf16> loc(#loc182)
    } -> tensor<1x256x8x8xbf16> loc(#loc181)
    %116 = xten_nn.subgraph (%arg1 = %115: tensor<1x256x8x8xbf16>, %arg2 = %47: tensor<64x256x1x1xbf16>, %arg3 = %100: tensor<64xbf16>)  attributes {
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
        %170 = "tosa.const"() <{value = dense<[0, 3, 1, 2]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc)
        %171 = "tosa.const"() <{value = dense<[0, 2, 3, 1]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc)
        %172 = tosa.reshape %arg5 {new_shape = array<i64: 64, 1, 1, 256>} : (tensor<64x256x1x1xbf16>) -> tensor<64x1x1x256xbf16> loc(#loc183)
        %173 = tosa.transpose %arg4, %171 : (tensor<1x256x8x8xbf16>, tensor<4xi32>) -> tensor<1x8x8x256xbf16> loc(#loc183)
        %174 = tosa.conv2d %173, %172, %arg6 {
          PartOfLayerName = "/layer1/layer1.1/conv1/Conv",
          PartOfOutputName = "/layer1/layer1.1/conv1/Conv",
          acc_type = f32,
          dilation = array<i64: 1, 1>,
          pad = array<i64: 0, 0, 0, 0>,
          stride = array<i64: 1, 1>} : (tensor<1x8x8x256xbf16>, tensor<64x1x1x256xbf16>, tensor<64xbf16>) -> tensor<1x8x8x64xbf16> loc(#loc65)
        %175 = tosa.clamp %174 {
          LayerName = "/layer1/layer1.1/relu/Relu",
          OutputName = "/layer1/layer1.1/relu/Relu",
          max_fp = 3.40282347E+38 : f32,
          max_int = 2147483647 : i64,
          min_fp = 0.000000e+00 : f32,
          min_int = 0 : i64} : (tensor<1x8x8x64xbf16>) -> tensor<1x8x8x64xbf16> loc(#loc66)
        %176 = tosa.transpose %175, %170 : (tensor<1x8x8x64xbf16>, tensor<4xi32>) -> tensor<1x64x8x8xbf16> loc(#loc183)
        xten_nn.output %176 : tensor<1x64x8x8xbf16> loc(#loc66)
      } -> tensor<1x64x8x8xbf16> loc(#loc183)
      xten_nn.output %169 : tensor<1x64x8x8xbf16> loc(#loc183)
    } -> tensor<1x64x8x8xbf16> loc(#loc183)
    %117 = xten_nn.subgraph (%arg1 = %116: tensor<1x64x8x8xbf16>, %arg2 = %46: tensor<64x64x3x3xbf16>, %arg3 = %64: tensor<64xbf16>)  attributes {
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
        %170 = "tosa.const"() <{value = dense<[0, 3, 1, 2]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc)
        %171 = "tosa.const"() <{value = dense<[0, 2, 3, 1]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc)
        %172 = tosa.transpose %arg5, %171 : (tensor<64x64x3x3xbf16>, tensor<4xi32>) -> tensor<64x3x3x64xbf16> loc(#loc184)
        %173 = tosa.transpose %arg4, %171 : (tensor<1x64x8x8xbf16>, tensor<4xi32>) -> tensor<1x8x8x64xbf16> loc(#loc184)
        %174 = tosa.conv2d %173, %172, %arg6 {
          PartOfLayerName = "/layer1/layer1.1/conv2/Conv",
          PartOfOutputName = "/layer1/layer1.1/conv2/Conv",
          acc_type = f32,
          dilation = array<i64: 1, 1>,
          pad = array<i64: 1, 1, 1, 1>,
          stride = array<i64: 1, 1>} : (tensor<1x8x8x64xbf16>, tensor<64x3x3x64xbf16>, tensor<64xbf16>) -> tensor<1x8x8x64xbf16> loc(#loc67)
        %175 = tosa.clamp %174 {
          LayerName = "/layer1/layer1.1/relu_1/Relu",
          OutputName = "/layer1/layer1.1/relu_1/Relu",
          max_fp = 3.40282347E+38 : f32,
          max_int = 2147483647 : i64,
          min_fp = 0.000000e+00 : f32,
          min_int = 0 : i64} : (tensor<1x8x8x64xbf16>) -> tensor<1x8x8x64xbf16> loc(#loc68)
        %176 = tosa.transpose %175, %170 : (tensor<1x8x8x64xbf16>, tensor<4xi32>) -> tensor<1x64x8x8xbf16> loc(#loc184)
        xten_nn.output %176 : tensor<1x64x8x8xbf16> loc(#loc68)
      } -> tensor<1x64x8x8xbf16> loc(#loc184)
      xten_nn.output %169 : tensor<1x64x8x8xbf16> loc(#loc184)
    } -> tensor<1x64x8x8xbf16> loc(#loc184)
    %118 = xten_nn.subgraph (%arg1 = %117: tensor<1x64x8x8xbf16>, %arg2 = %45: tensor<256x64x1x1xbf16>, %arg3 = %77: tensor<256xbf16>, %arg4 = %115: tensor<1x256x8x8xbf16>)  attributes {
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
        %171 = "tosa.const"() <{value = dense<[0, 3, 1, 2]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc)
        %172 = "tosa.const"() <{value = dense<[0, 2, 3, 1]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc)
        %173 = tosa.reshape %arg6 {new_shape = array<i64: 256, 1, 1, 64>} : (tensor<256x64x1x1xbf16>) -> tensor<256x1x1x64xbf16> loc(#loc69)
        %174 = tosa.transpose %arg5, %172 : (tensor<1x64x8x8xbf16>, tensor<4xi32>) -> tensor<1x8x8x64xbf16> loc(#loc69)
        %175 = tosa.conv2d %174, %173, %arg7 {
          PartOfLayerName = "/layer1/layer1.1/conv3/Conv",
          PartOfOutputName = "/layer1/layer1.1/conv3/Conv",
          acc_type = f32,
          dilation = array<i64: 1, 1>,
          pad = array<i64: 0, 0, 0, 0>,
          stride = array<i64: 1, 1>} : (tensor<1x8x8x64xbf16>, tensor<256x1x1x64xbf16>, tensor<256xbf16>) -> tensor<1x8x8x256xbf16> loc(#loc69)
        %176 = tosa.transpose %175, %171 : (tensor<1x8x8x256xbf16>, tensor<4xi32>) -> tensor<1x256x8x8xbf16> loc(#loc69)
        xten_nn.output %176 : tensor<1x256x8x8xbf16> loc(#loc69)
      } -> tensor<1x256x8x8xbf16> loc(#loc69)
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
        %171 = tosa.add %arg5, %arg6 {LayerName = "/layer1/layer1.1/Add", OutputName = "/layer1/layer1.1/Add"} : (tensor<1x256x8x8xbf16>, tensor<1x256x8x8xbf16>) -> tensor<1x256x8x8xbf16> loc(#loc70)
        %172 = tosa.clamp %171 {
          LayerName = "/layer1/layer1.1/relu_2/Relu",
          OutputName = "/layer1/layer1.1/relu_2/Relu",
          max_fp = 3.40282347E+38 : f32,
          max_int = 2147483647 : i64,
          min_fp = 0.000000e+00 : f32,
          min_int = 0 : i64} : (tensor<1x256x8x8xbf16>) -> tensor<1x256x8x8xbf16> loc(#loc71)
        xten_nn.output %172 : tensor<1x256x8x8xbf16> loc(#loc71)
      } -> tensor<1x256x8x8xbf16> loc(#loc186)
      xten_nn.output %170 : tensor<1x256x8x8xbf16> loc(#loc186)
    } -> tensor<1x256x8x8xbf16> loc(#loc185)
    %119 = xten_nn.subgraph (%arg1 = %118: tensor<1x256x8x8xbf16>, %arg2 = %44: tensor<64x256x1x1xbf16>, %arg3 = %107: tensor<64xbf16>)  attributes {
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
        %170 = "tosa.const"() <{value = dense<[0, 3, 1, 2]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc)
        %171 = "tosa.const"() <{value = dense<[0, 2, 3, 1]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc)
        %172 = tosa.reshape %arg5 {new_shape = array<i64: 64, 1, 1, 256>} : (tensor<64x256x1x1xbf16>) -> tensor<64x1x1x256xbf16> loc(#loc187)
        %173 = tosa.transpose %arg4, %171 : (tensor<1x256x8x8xbf16>, tensor<4xi32>) -> tensor<1x8x8x256xbf16> loc(#loc187)
        %174 = tosa.conv2d %173, %172, %arg6 {
          PartOfLayerName = "/layer1/layer1.2/conv1/Conv",
          PartOfOutputName = "/layer1/layer1.2/conv1/Conv",
          acc_type = f32,
          dilation = array<i64: 1, 1>,
          pad = array<i64: 0, 0, 0, 0>,
          stride = array<i64: 1, 1>} : (tensor<1x8x8x256xbf16>, tensor<64x1x1x256xbf16>, tensor<64xbf16>) -> tensor<1x8x8x64xbf16> loc(#loc72)
        %175 = tosa.clamp %174 {
          LayerName = "/layer1/layer1.2/relu/Relu",
          OutputName = "/layer1/layer1.2/relu/Relu",
          max_fp = 3.40282347E+38 : f32,
          max_int = 2147483647 : i64,
          min_fp = 0.000000e+00 : f32,
          min_int = 0 : i64} : (tensor<1x8x8x64xbf16>) -> tensor<1x8x8x64xbf16> loc(#loc73)
        %176 = tosa.transpose %175, %170 : (tensor<1x8x8x64xbf16>, tensor<4xi32>) -> tensor<1x64x8x8xbf16> loc(#loc187)
        xten_nn.output %176 : tensor<1x64x8x8xbf16> loc(#loc73)
      } -> tensor<1x64x8x8xbf16> loc(#loc187)
      xten_nn.output %169 : tensor<1x64x8x8xbf16> loc(#loc187)
    } -> tensor<1x64x8x8xbf16> loc(#loc187)
    %120 = xten_nn.subgraph (%arg1 = %119: tensor<1x64x8x8xbf16>, %arg2 = %43: tensor<64x64x3x3xbf16>, %arg3 = %80: tensor<64xbf16>)  attributes {
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
        %170 = "tosa.const"() <{value = dense<[0, 3, 1, 2]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc)
        %171 = "tosa.const"() <{value = dense<[0, 2, 3, 1]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc)
        %172 = tosa.transpose %arg5, %171 : (tensor<64x64x3x3xbf16>, tensor<4xi32>) -> tensor<64x3x3x64xbf16> loc(#loc188)
        %173 = tosa.transpose %arg4, %171 : (tensor<1x64x8x8xbf16>, tensor<4xi32>) -> tensor<1x8x8x64xbf16> loc(#loc188)
        %174 = tosa.conv2d %173, %172, %arg6 {
          PartOfLayerName = "/layer1/layer1.2/conv2/Conv",
          PartOfOutputName = "/layer1/layer1.2/conv2/Conv",
          acc_type = f32,
          dilation = array<i64: 1, 1>,
          pad = array<i64: 1, 1, 1, 1>,
          stride = array<i64: 1, 1>} : (tensor<1x8x8x64xbf16>, tensor<64x3x3x64xbf16>, tensor<64xbf16>) -> tensor<1x8x8x64xbf16> loc(#loc74)
        %175 = tosa.clamp %174 {
          LayerName = "/layer1/layer1.2/relu_1/Relu",
          OutputName = "/layer1/layer1.2/relu_1/Relu",
          max_fp = 3.40282347E+38 : f32,
          max_int = 2147483647 : i64,
          min_fp = 0.000000e+00 : f32,
          min_int = 0 : i64} : (tensor<1x8x8x64xbf16>) -> tensor<1x8x8x64xbf16> loc(#loc75)
        %176 = tosa.transpose %175, %170 : (tensor<1x8x8x64xbf16>, tensor<4xi32>) -> tensor<1x64x8x8xbf16> loc(#loc188)
        xten_nn.output %176 : tensor<1x64x8x8xbf16> loc(#loc75)
      } -> tensor<1x64x8x8xbf16> loc(#loc188)
      xten_nn.output %169 : tensor<1x64x8x8xbf16> loc(#loc188)
    } -> tensor<1x64x8x8xbf16> loc(#loc188)
    %121 = xten_nn.subgraph (%arg1 = %120: tensor<1x64x8x8xbf16>, %arg2 = %42: tensor<256x64x1x1xbf16>, %arg3 = %78: tensor<256xbf16>, %arg4 = %118: tensor<1x256x8x8xbf16>)  attributes {
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
        %171 = "tosa.const"() <{value = dense<[0, 3, 1, 2]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc)
        %172 = "tosa.const"() <{value = dense<[0, 2, 3, 1]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc)
        %173 = tosa.reshape %arg6 {new_shape = array<i64: 256, 1, 1, 64>} : (tensor<256x64x1x1xbf16>) -> tensor<256x1x1x64xbf16> loc(#loc76)
        %174 = tosa.transpose %arg5, %172 : (tensor<1x64x8x8xbf16>, tensor<4xi32>) -> tensor<1x8x8x64xbf16> loc(#loc76)
        %175 = tosa.conv2d %174, %173, %arg7 {
          PartOfLayerName = "/layer1/layer1.2/conv3/Conv",
          PartOfOutputName = "/layer1/layer1.2/conv3/Conv",
          acc_type = f32,
          dilation = array<i64: 1, 1>,
          pad = array<i64: 0, 0, 0, 0>,
          stride = array<i64: 1, 1>} : (tensor<1x8x8x64xbf16>, tensor<256x1x1x64xbf16>, tensor<256xbf16>) -> tensor<1x8x8x256xbf16> loc(#loc76)
        %176 = tosa.transpose %175, %171 : (tensor<1x8x8x256xbf16>, tensor<4xi32>) -> tensor<1x256x8x8xbf16> loc(#loc76)
        xten_nn.output %176 : tensor<1x256x8x8xbf16> loc(#loc76)
      } -> tensor<1x256x8x8xbf16> loc(#loc76)
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
        %171 = tosa.add %arg5, %arg6 {LayerName = "/layer1/layer1.2/Add", OutputName = "/layer1/layer1.2/Add"} : (tensor<1x256x8x8xbf16>, tensor<1x256x8x8xbf16>) -> tensor<1x256x8x8xbf16> loc(#loc77)
        %172 = tosa.clamp %171 {
          LayerName = "/layer1/layer1.2/relu_2/Relu",
          OutputName = "/layer1/layer1.2/relu_2/Relu",
          max_fp = 3.40282347E+38 : f32,
          max_int = 2147483647 : i64,
          min_fp = 0.000000e+00 : f32,
          min_int = 0 : i64} : (tensor<1x256x8x8xbf16>) -> tensor<1x256x8x8xbf16> loc(#loc78)
        xten_nn.output %172 : tensor<1x256x8x8xbf16> loc(#loc78)
      } -> tensor<1x256x8x8xbf16> loc(#loc190)
      xten_nn.output %170 : tensor<1x256x8x8xbf16> loc(#loc190)
    } -> tensor<1x256x8x8xbf16> loc(#loc189)
    %122 = xten_nn.subgraph (%arg1 = %121: tensor<1x256x8x8xbf16>, %arg2 = %41: tensor<128x256x1x1xbf16>, %arg3 = %85: tensor<128xbf16>)  attributes {
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
        %170 = "tosa.const"() <{value = dense<[0, 3, 1, 2]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc)
        %171 = "tosa.const"() <{value = dense<[0, 2, 3, 1]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc)
        %172 = tosa.reshape %arg5 {new_shape = array<i64: 128, 1, 1, 256>} : (tensor<128x256x1x1xbf16>) -> tensor<128x1x1x256xbf16> loc(#loc191)
        %173 = tosa.transpose %arg4, %171 : (tensor<1x256x8x8xbf16>, tensor<4xi32>) -> tensor<1x8x8x256xbf16> loc(#loc191)
        %174 = tosa.conv2d %173, %172, %arg6 {
          PartOfLayerName = "/layer2/layer2.0/conv1/Conv",
          PartOfOutputName = "/layer2/layer2.0/conv1/Conv",
          acc_type = f32,
          dilation = array<i64: 1, 1>,
          pad = array<i64: 0, 0, 0, 0>,
          stride = array<i64: 1, 1>} : (tensor<1x8x8x256xbf16>, tensor<128x1x1x256xbf16>, tensor<128xbf16>) -> tensor<1x8x8x128xbf16> loc(#loc79)
        %175 = tosa.clamp %174 {
          LayerName = "/layer2/layer2.0/relu/Relu",
          OutputName = "/layer2/layer2.0/relu/Relu",
          max_fp = 3.40282347E+38 : f32,
          max_int = 2147483647 : i64,
          min_fp = 0.000000e+00 : f32,
          min_int = 0 : i64} : (tensor<1x8x8x128xbf16>) -> tensor<1x8x8x128xbf16> loc(#loc80)
        %176 = tosa.transpose %175, %170 : (tensor<1x8x8x128xbf16>, tensor<4xi32>) -> tensor<1x128x8x8xbf16> loc(#loc191)
        xten_nn.output %176 : tensor<1x128x8x8xbf16> loc(#loc80)
      } -> tensor<1x128x8x8xbf16> loc(#loc191)
      xten_nn.output %169 : tensor<1x128x8x8xbf16> loc(#loc191)
    } -> tensor<1x128x8x8xbf16> loc(#loc191)
    %123 = xten_nn.subgraph (%arg1 = %122: tensor<1x128x8x8xbf16>, %arg2 = %40: tensor<128x128x3x3xbf16>, %arg3 = %84: tensor<128xbf16>)  attributes {
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
        %170 = "tosa.const"() <{value = dense<[0, 3, 1, 2]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc)
        %171 = "tosa.const"() <{value = dense<[0, 2, 3, 1]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc)
        %172 = tosa.transpose %arg5, %171 : (tensor<128x128x3x3xbf16>, tensor<4xi32>) -> tensor<128x3x3x128xbf16> loc(#loc192)
        %173 = tosa.transpose %arg4, %171 : (tensor<1x128x8x8xbf16>, tensor<4xi32>) -> tensor<1x8x8x128xbf16> loc(#loc192)
        %174 = tosa.conv2d %173, %172, %arg6 {
          PartOfLayerName = "/layer2/layer2.0/conv2/Conv",
          PartOfOutputName = "/layer2/layer2.0/conv2/Conv",
          acc_type = f32,
          dilation = array<i64: 1, 1>,
          pad = array<i64: 1, 0, 1, 0>,
          stride = array<i64: 2, 2>} : (tensor<1x8x8x128xbf16>, tensor<128x3x3x128xbf16>, tensor<128xbf16>) -> tensor<1x4x4x128xbf16> loc(#loc81)
        %175 = tosa.clamp %174 {
          LayerName = "/layer2/layer2.0/relu_1/Relu",
          OutputName = "/layer2/layer2.0/relu_1/Relu",
          max_fp = 3.40282347E+38 : f32,
          max_int = 2147483647 : i64,
          min_fp = 0.000000e+00 : f32,
          min_int = 0 : i64} : (tensor<1x4x4x128xbf16>) -> tensor<1x4x4x128xbf16> loc(#loc82)
        %176 = tosa.transpose %175, %170 : (tensor<1x4x4x128xbf16>, tensor<4xi32>) -> tensor<1x128x4x4xbf16> loc(#loc192)
        xten_nn.output %176 : tensor<1x128x4x4xbf16> loc(#loc82)
      } -> tensor<1x128x4x4xbf16> loc(#loc192)
      xten_nn.output %169 : tensor<1x128x4x4xbf16> loc(#loc192)
    } -> tensor<1x128x4x4xbf16> loc(#loc192)
    %124 = xten_nn.subgraph (%arg1 = %121: tensor<1x256x8x8xbf16>, %arg2 = %38: tensor<512x256x1x1xbf16>, %arg3 = %72: tensor<512xbf16>)  attributes {
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
        %170 = "tosa.const"() <{value = dense<[0, 2, 3, 1]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc)
        %171 = "tosa.const"() <{value = dense<[0, 3, 1, 2]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc)
        %172 = tosa.reshape %arg5 {new_shape = array<i64: 512, 1, 1, 256>} : (tensor<512x256x1x1xbf16>) -> tensor<512x1x1x256xbf16> loc(#loc83)
        %173 = tosa.transpose %arg4, %170 : (tensor<1x256x8x8xbf16>, tensor<4xi32>) -> tensor<1x8x8x256xbf16> loc(#loc83)
        %174 = tosa.slice %173 {
          PartOfLayerName = "/layer2/layer2.0/downsample/downsample.0/Conv",
          size = array<i64: 1, 7, 7, 256>,
          start = array<i64: 0, 0, 0, 0>} : (tensor<1x8x8x256xbf16>) -> tensor<1x7x7x256xbf16> loc(#loc83)
        %175 = tosa.conv2d %174, %172, %arg6 {
          PartOfLayerName = "/layer2/layer2.0/downsample/downsample.0/Conv",
          PartOfOutputName = "/layer2/layer2.0/downsample/downsample.0/Conv",
          acc_type = f32,
          dilation = array<i64: 1, 1>,
          pad = array<i64: 0, 0, 0, 0>,
          stride = array<i64: 2, 2>} : (tensor<1x7x7x256xbf16>, tensor<512x1x1x256xbf16>, tensor<512xbf16>) -> tensor<1x4x4x512xbf16> loc(#loc83)
        %176 = tosa.transpose %175, %171 : (tensor<1x4x4x512xbf16>, tensor<4xi32>) -> tensor<1x512x4x4xbf16> loc(#loc83)
        xten_nn.output %176 : tensor<1x512x4x4xbf16> loc(#loc83)
      } -> tensor<1x512x4x4xbf16> loc(#loc83)
      xten_nn.output %169 : tensor<1x512x4x4xbf16> loc(#loc83)
    } -> tensor<1x512x4x4xbf16> loc(#loc83)
    %125 = xten_nn.subgraph (%arg1 = %123: tensor<1x128x4x4xbf16>, %arg2 = %39: tensor<512x128x1x1xbf16>, %arg3 = %70: tensor<512xbf16>, %arg4 = %124: tensor<1x512x4x4xbf16>)  attributes {
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
        %171 = "tosa.const"() <{value = dense<[0, 3, 1, 2]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc)
        %172 = "tosa.const"() <{value = dense<[0, 2, 3, 1]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc)
        %173 = tosa.reshape %arg6 {new_shape = array<i64: 512, 1, 1, 128>} : (tensor<512x128x1x1xbf16>) -> tensor<512x1x1x128xbf16> loc(#loc84)
        %174 = tosa.transpose %arg5, %172 : (tensor<1x128x4x4xbf16>, tensor<4xi32>) -> tensor<1x4x4x128xbf16> loc(#loc84)
        %175 = tosa.conv2d %174, %173, %arg7 {
          PartOfLayerName = "/layer2/layer2.0/conv3/Conv",
          PartOfOutputName = "/layer2/layer2.0/conv3/Conv",
          acc_type = f32,
          dilation = array<i64: 1, 1>,
          pad = array<i64: 0, 0, 0, 0>,
          stride = array<i64: 1, 1>} : (tensor<1x4x4x128xbf16>, tensor<512x1x1x128xbf16>, tensor<512xbf16>) -> tensor<1x4x4x512xbf16> loc(#loc84)
        %176 = tosa.transpose %175, %171 : (tensor<1x4x4x512xbf16>, tensor<4xi32>) -> tensor<1x512x4x4xbf16> loc(#loc84)
        xten_nn.output %176 : tensor<1x512x4x4xbf16> loc(#loc84)
      } -> tensor<1x512x4x4xbf16> loc(#loc84)
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
        %171 = tosa.add %arg5, %arg6 {LayerName = "/layer2/layer2.0/Add", OutputName = "/layer2/layer2.0/Add"} : (tensor<1x512x4x4xbf16>, tensor<1x512x4x4xbf16>) -> tensor<1x512x4x4xbf16> loc(#loc85)
        %172 = tosa.clamp %171 {
          LayerName = "/layer2/layer2.0/relu_2/Relu",
          OutputName = "/layer2/layer2.0/relu_2/Relu",
          max_fp = 3.40282347E+38 : f32,
          max_int = 2147483647 : i64,
          min_fp = 0.000000e+00 : f32,
          min_int = 0 : i64} : (tensor<1x512x4x4xbf16>) -> tensor<1x512x4x4xbf16> loc(#loc86)
        xten_nn.output %172 : tensor<1x512x4x4xbf16> loc(#loc86)
      } -> tensor<1x512x4x4xbf16> loc(#loc194)
      xten_nn.output %170 : tensor<1x512x4x4xbf16> loc(#loc194)
    } -> tensor<1x512x4x4xbf16> loc(#loc193)
    %126 = xten_nn.subgraph (%arg1 = %125: tensor<1x512x4x4xbf16>, %arg2 = %37: tensor<128x512x1x1xbf16>, %arg3 = %59: tensor<128xbf16>)  attributes {
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
        %170 = "tosa.const"() <{value = dense<[0, 3, 1, 2]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc)
        %171 = "tosa.const"() <{value = dense<[0, 2, 3, 1]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc)
        %172 = tosa.reshape %arg5 {new_shape = array<i64: 128, 1, 1, 512>} : (tensor<128x512x1x1xbf16>) -> tensor<128x1x1x512xbf16> loc(#loc195)
        %173 = tosa.transpose %arg4, %171 : (tensor<1x512x4x4xbf16>, tensor<4xi32>) -> tensor<1x4x4x512xbf16> loc(#loc195)
        %174 = tosa.conv2d %173, %172, %arg6 {
          PartOfLayerName = "/layer2/layer2.1/conv1/Conv",
          PartOfOutputName = "/layer2/layer2.1/conv1/Conv",
          acc_type = f32,
          dilation = array<i64: 1, 1>,
          pad = array<i64: 0, 0, 0, 0>,
          stride = array<i64: 1, 1>} : (tensor<1x4x4x512xbf16>, tensor<128x1x1x512xbf16>, tensor<128xbf16>) -> tensor<1x4x4x128xbf16> loc(#loc87)
        %175 = tosa.clamp %174 {
          LayerName = "/layer2/layer2.1/relu/Relu",
          OutputName = "/layer2/layer2.1/relu/Relu",
          max_fp = 3.40282347E+38 : f32,
          max_int = 2147483647 : i64,
          min_fp = 0.000000e+00 : f32,
          min_int = 0 : i64} : (tensor<1x4x4x128xbf16>) -> tensor<1x4x4x128xbf16> loc(#loc88)
        %176 = tosa.transpose %175, %170 : (tensor<1x4x4x128xbf16>, tensor<4xi32>) -> tensor<1x128x4x4xbf16> loc(#loc195)
        xten_nn.output %176 : tensor<1x128x4x4xbf16> loc(#loc88)
      } -> tensor<1x128x4x4xbf16> loc(#loc195)
      xten_nn.output %169 : tensor<1x128x4x4xbf16> loc(#loc195)
    } -> tensor<1x128x4x4xbf16> loc(#loc195)
    %127 = xten_nn.subgraph (%arg1 = %126: tensor<1x128x4x4xbf16>, %arg2 = %36: tensor<128x128x3x3xbf16>, %arg3 = %81: tensor<128xbf16>)  attributes {
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
        %170 = "tosa.const"() <{value = dense<[0, 3, 1, 2]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc)
        %171 = "tosa.const"() <{value = dense<[0, 2, 3, 1]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc)
        %172 = tosa.transpose %arg5, %171 : (tensor<128x128x3x3xbf16>, tensor<4xi32>) -> tensor<128x3x3x128xbf16> loc(#loc196)
        %173 = tosa.transpose %arg4, %171 : (tensor<1x128x4x4xbf16>, tensor<4xi32>) -> tensor<1x4x4x128xbf16> loc(#loc196)
        %174 = tosa.conv2d %173, %172, %arg6 {
          PartOfLayerName = "/layer2/layer2.1/conv2/Conv",
          PartOfOutputName = "/layer2/layer2.1/conv2/Conv",
          acc_type = f32,
          dilation = array<i64: 1, 1>,
          pad = array<i64: 1, 1, 1, 1>,
          stride = array<i64: 1, 1>} : (tensor<1x4x4x128xbf16>, tensor<128x3x3x128xbf16>, tensor<128xbf16>) -> tensor<1x4x4x128xbf16> loc(#loc89)
        %175 = tosa.clamp %174 {
          LayerName = "/layer2/layer2.1/relu_1/Relu",
          OutputName = "/layer2/layer2.1/relu_1/Relu",
          max_fp = 3.40282347E+38 : f32,
          max_int = 2147483647 : i64,
          min_fp = 0.000000e+00 : f32,
          min_int = 0 : i64} : (tensor<1x4x4x128xbf16>) -> tensor<1x4x4x128xbf16> loc(#loc90)
        %176 = tosa.transpose %175, %170 : (tensor<1x4x4x128xbf16>, tensor<4xi32>) -> tensor<1x128x4x4xbf16> loc(#loc196)
        xten_nn.output %176 : tensor<1x128x4x4xbf16> loc(#loc90)
      } -> tensor<1x128x4x4xbf16> loc(#loc196)
      xten_nn.output %169 : tensor<1x128x4x4xbf16> loc(#loc196)
    } -> tensor<1x128x4x4xbf16> loc(#loc196)
    %128 = xten_nn.subgraph (%arg1 = %127: tensor<1x128x4x4xbf16>, %arg2 = %35: tensor<512x128x1x1xbf16>, %arg3 = %82: tensor<512xbf16>, %arg4 = %125: tensor<1x512x4x4xbf16>)  attributes {
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
        %171 = "tosa.const"() <{value = dense<[0, 3, 1, 2]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc)
        %172 = "tosa.const"() <{value = dense<[0, 2, 3, 1]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc)
        %173 = tosa.reshape %arg6 {new_shape = array<i64: 512, 1, 1, 128>} : (tensor<512x128x1x1xbf16>) -> tensor<512x1x1x128xbf16> loc(#loc91)
        %174 = tosa.transpose %arg5, %172 : (tensor<1x128x4x4xbf16>, tensor<4xi32>) -> tensor<1x4x4x128xbf16> loc(#loc91)
        %175 = tosa.conv2d %174, %173, %arg7 {
          PartOfLayerName = "/layer2/layer2.1/conv3/Conv",
          PartOfOutputName = "/layer2/layer2.1/conv3/Conv",
          acc_type = f32,
          dilation = array<i64: 1, 1>,
          pad = array<i64: 0, 0, 0, 0>,
          stride = array<i64: 1, 1>} : (tensor<1x4x4x128xbf16>, tensor<512x1x1x128xbf16>, tensor<512xbf16>) -> tensor<1x4x4x512xbf16> loc(#loc91)
        %176 = tosa.transpose %175, %171 : (tensor<1x4x4x512xbf16>, tensor<4xi32>) -> tensor<1x512x4x4xbf16> loc(#loc91)
        xten_nn.output %176 : tensor<1x512x4x4xbf16> loc(#loc91)
      } -> tensor<1x512x4x4xbf16> loc(#loc91)
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
        %171 = tosa.add %arg5, %arg6 {LayerName = "/layer2/layer2.1/Add", OutputName = "/layer2/layer2.1/Add"} : (tensor<1x512x4x4xbf16>, tensor<1x512x4x4xbf16>) -> tensor<1x512x4x4xbf16> loc(#loc92)
        %172 = tosa.clamp %171 {
          LayerName = "/layer2/layer2.1/relu_2/Relu",
          OutputName = "/layer2/layer2.1/relu_2/Relu",
          max_fp = 3.40282347E+38 : f32,
          max_int = 2147483647 : i64,
          min_fp = 0.000000e+00 : f32,
          min_int = 0 : i64} : (tensor<1x512x4x4xbf16>) -> tensor<1x512x4x4xbf16> loc(#loc93)
        xten_nn.output %172 : tensor<1x512x4x4xbf16> loc(#loc93)
      } -> tensor<1x512x4x4xbf16> loc(#loc198)
      xten_nn.output %170 : tensor<1x512x4x4xbf16> loc(#loc198)
    } -> tensor<1x512x4x4xbf16> loc(#loc197)
    %129 = xten_nn.subgraph (%arg1 = %128: tensor<1x512x4x4xbf16>, %arg2 = %34: tensor<128x512x1x1xbf16>, %arg3 = %65: tensor<128xbf16>)  attributes {
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
        %170 = "tosa.const"() <{value = dense<[0, 3, 1, 2]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc)
        %171 = "tosa.const"() <{value = dense<[0, 2, 3, 1]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc)
        %172 = tosa.reshape %arg5 {new_shape = array<i64: 128, 1, 1, 512>} : (tensor<128x512x1x1xbf16>) -> tensor<128x1x1x512xbf16> loc(#loc199)
        %173 = tosa.transpose %arg4, %171 : (tensor<1x512x4x4xbf16>, tensor<4xi32>) -> tensor<1x4x4x512xbf16> loc(#loc199)
        %174 = tosa.conv2d %173, %172, %arg6 {
          PartOfLayerName = "/layer2/layer2.2/conv1/Conv",
          PartOfOutputName = "/layer2/layer2.2/conv1/Conv",
          acc_type = f32,
          dilation = array<i64: 1, 1>,
          pad = array<i64: 0, 0, 0, 0>,
          stride = array<i64: 1, 1>} : (tensor<1x4x4x512xbf16>, tensor<128x1x1x512xbf16>, tensor<128xbf16>) -> tensor<1x4x4x128xbf16> loc(#loc94)
        %175 = tosa.clamp %174 {
          LayerName = "/layer2/layer2.2/relu/Relu",
          OutputName = "/layer2/layer2.2/relu/Relu",
          max_fp = 3.40282347E+38 : f32,
          max_int = 2147483647 : i64,
          min_fp = 0.000000e+00 : f32,
          min_int = 0 : i64} : (tensor<1x4x4x128xbf16>) -> tensor<1x4x4x128xbf16> loc(#loc95)
        %176 = tosa.transpose %175, %170 : (tensor<1x4x4x128xbf16>, tensor<4xi32>) -> tensor<1x128x4x4xbf16> loc(#loc199)
        xten_nn.output %176 : tensor<1x128x4x4xbf16> loc(#loc95)
      } -> tensor<1x128x4x4xbf16> loc(#loc199)
      xten_nn.output %169 : tensor<1x128x4x4xbf16> loc(#loc199)
    } -> tensor<1x128x4x4xbf16> loc(#loc199)
    %130 = xten_nn.subgraph (%arg1 = %129: tensor<1x128x4x4xbf16>, %arg2 = %33: tensor<128x128x3x3xbf16>, %arg3 = %69: tensor<128xbf16>)  attributes {
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
        %170 = "tosa.const"() <{value = dense<[0, 3, 1, 2]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc)
        %171 = "tosa.const"() <{value = dense<[0, 2, 3, 1]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc)
        %172 = tosa.transpose %arg5, %171 : (tensor<128x128x3x3xbf16>, tensor<4xi32>) -> tensor<128x3x3x128xbf16> loc(#loc200)
        %173 = tosa.transpose %arg4, %171 : (tensor<1x128x4x4xbf16>, tensor<4xi32>) -> tensor<1x4x4x128xbf16> loc(#loc200)
        %174 = tosa.conv2d %173, %172, %arg6 {
          PartOfLayerName = "/layer2/layer2.2/conv2/Conv",
          PartOfOutputName = "/layer2/layer2.2/conv2/Conv",
          acc_type = f32,
          dilation = array<i64: 1, 1>,
          pad = array<i64: 1, 1, 1, 1>,
          stride = array<i64: 1, 1>} : (tensor<1x4x4x128xbf16>, tensor<128x3x3x128xbf16>, tensor<128xbf16>) -> tensor<1x4x4x128xbf16> loc(#loc96)
        %175 = tosa.clamp %174 {
          LayerName = "/layer2/layer2.2/relu_1/Relu",
          OutputName = "/layer2/layer2.2/relu_1/Relu",
          max_fp = 3.40282347E+38 : f32,
          max_int = 2147483647 : i64,
          min_fp = 0.000000e+00 : f32,
          min_int = 0 : i64} : (tensor<1x4x4x128xbf16>) -> tensor<1x4x4x128xbf16> loc(#loc97)
        %176 = tosa.transpose %175, %170 : (tensor<1x4x4x128xbf16>, tensor<4xi32>) -> tensor<1x128x4x4xbf16> loc(#loc200)
        xten_nn.output %176 : tensor<1x128x4x4xbf16> loc(#loc97)
      } -> tensor<1x128x4x4xbf16> loc(#loc200)
      xten_nn.output %169 : tensor<1x128x4x4xbf16> loc(#loc200)
    } -> tensor<1x128x4x4xbf16> loc(#loc200)
    %131 = xten_nn.subgraph (%arg1 = %130: tensor<1x128x4x4xbf16>, %arg2 = %32: tensor<512x128x1x1xbf16>, %arg3 = %67: tensor<512xbf16>, %arg4 = %128: tensor<1x512x4x4xbf16>)  attributes {
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
        %171 = "tosa.const"() <{value = dense<[0, 3, 1, 2]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc)
        %172 = "tosa.const"() <{value = dense<[0, 2, 3, 1]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc)
        %173 = tosa.reshape %arg6 {new_shape = array<i64: 512, 1, 1, 128>} : (tensor<512x128x1x1xbf16>) -> tensor<512x1x1x128xbf16> loc(#loc98)
        %174 = tosa.transpose %arg5, %172 : (tensor<1x128x4x4xbf16>, tensor<4xi32>) -> tensor<1x4x4x128xbf16> loc(#loc98)
        %175 = tosa.conv2d %174, %173, %arg7 {
          PartOfLayerName = "/layer2/layer2.2/conv3/Conv",
          PartOfOutputName = "/layer2/layer2.2/conv3/Conv",
          acc_type = f32,
          dilation = array<i64: 1, 1>,
          pad = array<i64: 0, 0, 0, 0>,
          stride = array<i64: 1, 1>} : (tensor<1x4x4x128xbf16>, tensor<512x1x1x128xbf16>, tensor<512xbf16>) -> tensor<1x4x4x512xbf16> loc(#loc98)
        %176 = tosa.transpose %175, %171 : (tensor<1x4x4x512xbf16>, tensor<4xi32>) -> tensor<1x512x4x4xbf16> loc(#loc98)
        xten_nn.output %176 : tensor<1x512x4x4xbf16> loc(#loc98)
      } -> tensor<1x512x4x4xbf16> loc(#loc98)
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
        %171 = tosa.add %arg5, %arg6 {LayerName = "/layer2/layer2.2/Add", OutputName = "/layer2/layer2.2/Add"} : (tensor<1x512x4x4xbf16>, tensor<1x512x4x4xbf16>) -> tensor<1x512x4x4xbf16> loc(#loc99)
        %172 = tosa.clamp %171 {
          LayerName = "/layer2/layer2.2/relu_2/Relu",
          OutputName = "/layer2/layer2.2/relu_2/Relu",
          max_fp = 3.40282347E+38 : f32,
          max_int = 2147483647 : i64,
          min_fp = 0.000000e+00 : f32,
          min_int = 0 : i64} : (tensor<1x512x4x4xbf16>) -> tensor<1x512x4x4xbf16> loc(#loc100)
        xten_nn.output %172 : tensor<1x512x4x4xbf16> loc(#loc100)
      } -> tensor<1x512x4x4xbf16> loc(#loc202)
      xten_nn.output %170 : tensor<1x512x4x4xbf16> loc(#loc202)
    } -> tensor<1x512x4x4xbf16> loc(#loc201)
    %132 = xten_nn.subgraph (%arg1 = %131: tensor<1x512x4x4xbf16>, %arg2 = %31: tensor<128x512x1x1xbf16>, %arg3 = %62: tensor<128xbf16>)  attributes {
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
        %170 = "tosa.const"() <{value = dense<[0, 3, 1, 2]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc)
        %171 = "tosa.const"() <{value = dense<[0, 2, 3, 1]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc)
        %172 = tosa.reshape %arg5 {new_shape = array<i64: 128, 1, 1, 512>} : (tensor<128x512x1x1xbf16>) -> tensor<128x1x1x512xbf16> loc(#loc203)
        %173 = tosa.transpose %arg4, %171 : (tensor<1x512x4x4xbf16>, tensor<4xi32>) -> tensor<1x4x4x512xbf16> loc(#loc203)
        %174 = tosa.conv2d %173, %172, %arg6 {
          PartOfLayerName = "/layer2/layer2.3/conv1/Conv",
          PartOfOutputName = "/layer2/layer2.3/conv1/Conv",
          acc_type = f32,
          dilation = array<i64: 1, 1>,
          pad = array<i64: 0, 0, 0, 0>,
          stride = array<i64: 1, 1>} : (tensor<1x4x4x512xbf16>, tensor<128x1x1x512xbf16>, tensor<128xbf16>) -> tensor<1x4x4x128xbf16> loc(#loc101)
        %175 = tosa.clamp %174 {
          LayerName = "/layer2/layer2.3/relu/Relu",
          OutputName = "/layer2/layer2.3/relu/Relu",
          max_fp = 3.40282347E+38 : f32,
          max_int = 2147483647 : i64,
          min_fp = 0.000000e+00 : f32,
          min_int = 0 : i64} : (tensor<1x4x4x128xbf16>) -> tensor<1x4x4x128xbf16> loc(#loc102)
        %176 = tosa.transpose %175, %170 : (tensor<1x4x4x128xbf16>, tensor<4xi32>) -> tensor<1x128x4x4xbf16> loc(#loc203)
        xten_nn.output %176 : tensor<1x128x4x4xbf16> loc(#loc102)
      } -> tensor<1x128x4x4xbf16> loc(#loc203)
      xten_nn.output %169 : tensor<1x128x4x4xbf16> loc(#loc203)
    } -> tensor<1x128x4x4xbf16> loc(#loc203)
    %133 = xten_nn.subgraph (%arg1 = %132: tensor<1x128x4x4xbf16>, %arg2 = %30: tensor<128x128x3x3xbf16>, %arg3 = %60: tensor<128xbf16>)  attributes {
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
        %170 = "tosa.const"() <{value = dense<[0, 3, 1, 2]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc)
        %171 = "tosa.const"() <{value = dense<[0, 2, 3, 1]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc)
        %172 = tosa.transpose %arg5, %171 : (tensor<128x128x3x3xbf16>, tensor<4xi32>) -> tensor<128x3x3x128xbf16> loc(#loc204)
        %173 = tosa.transpose %arg4, %171 : (tensor<1x128x4x4xbf16>, tensor<4xi32>) -> tensor<1x4x4x128xbf16> loc(#loc204)
        %174 = tosa.conv2d %173, %172, %arg6 {
          PartOfLayerName = "/layer2/layer2.3/conv2/Conv",
          PartOfOutputName = "/layer2/layer2.3/conv2/Conv",
          acc_type = f32,
          dilation = array<i64: 1, 1>,
          pad = array<i64: 1, 1, 1, 1>,
          stride = array<i64: 1, 1>} : (tensor<1x4x4x128xbf16>, tensor<128x3x3x128xbf16>, tensor<128xbf16>) -> tensor<1x4x4x128xbf16> loc(#loc103)
        %175 = tosa.clamp %174 {
          LayerName = "/layer2/layer2.3/relu_1/Relu",
          OutputName = "/layer2/layer2.3/relu_1/Relu",
          max_fp = 3.40282347E+38 : f32,
          max_int = 2147483647 : i64,
          min_fp = 0.000000e+00 : f32,
          min_int = 0 : i64} : (tensor<1x4x4x128xbf16>) -> tensor<1x4x4x128xbf16> loc(#loc104)
        %176 = tosa.transpose %175, %170 : (tensor<1x4x4x128xbf16>, tensor<4xi32>) -> tensor<1x128x4x4xbf16> loc(#loc204)
        xten_nn.output %176 : tensor<1x128x4x4xbf16> loc(#loc104)
      } -> tensor<1x128x4x4xbf16> loc(#loc204)
      xten_nn.output %169 : tensor<1x128x4x4xbf16> loc(#loc204)
    } -> tensor<1x128x4x4xbf16> loc(#loc204)
    %134 = xten_nn.subgraph (%arg1 = %133: tensor<1x128x4x4xbf16>, %arg2 = %29: tensor<512x128x1x1xbf16>, %arg3 = %102: tensor<512xbf16>, %arg4 = %131: tensor<1x512x4x4xbf16>)  attributes {
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
        %171 = "tosa.const"() <{value = dense<[0, 3, 1, 2]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc)
        %172 = "tosa.const"() <{value = dense<[0, 2, 3, 1]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc)
        %173 = tosa.reshape %arg6 {new_shape = array<i64: 512, 1, 1, 128>} : (tensor<512x128x1x1xbf16>) -> tensor<512x1x1x128xbf16> loc(#loc105)
        %174 = tosa.transpose %arg5, %172 : (tensor<1x128x4x4xbf16>, tensor<4xi32>) -> tensor<1x4x4x128xbf16> loc(#loc105)
        %175 = tosa.conv2d %174, %173, %arg7 {
          PartOfLayerName = "/layer2/layer2.3/conv3/Conv",
          PartOfOutputName = "/layer2/layer2.3/conv3/Conv",
          acc_type = f32,
          dilation = array<i64: 1, 1>,
          pad = array<i64: 0, 0, 0, 0>,
          stride = array<i64: 1, 1>} : (tensor<1x4x4x128xbf16>, tensor<512x1x1x128xbf16>, tensor<512xbf16>) -> tensor<1x4x4x512xbf16> loc(#loc105)
        %176 = tosa.transpose %175, %171 : (tensor<1x4x4x512xbf16>, tensor<4xi32>) -> tensor<1x512x4x4xbf16> loc(#loc105)
        xten_nn.output %176 : tensor<1x512x4x4xbf16> loc(#loc105)
      } -> tensor<1x512x4x4xbf16> loc(#loc105)
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
        %171 = tosa.add %arg5, %arg6 {LayerName = "/layer2/layer2.3/Add", OutputName = "/layer2/layer2.3/Add"} : (tensor<1x512x4x4xbf16>, tensor<1x512x4x4xbf16>) -> tensor<1x512x4x4xbf16> loc(#loc106)
        %172 = tosa.clamp %171 {
          LayerName = "/layer2/layer2.3/relu_2/Relu",
          OutputName = "/layer2/layer2.3/relu_2/Relu",
          max_fp = 3.40282347E+38 : f32,
          max_int = 2147483647 : i64,
          min_fp = 0.000000e+00 : f32,
          min_int = 0 : i64} : (tensor<1x512x4x4xbf16>) -> tensor<1x512x4x4xbf16> loc(#loc107)
        xten_nn.output %172 : tensor<1x512x4x4xbf16> loc(#loc107)
      } -> tensor<1x512x4x4xbf16> loc(#loc206)
      xten_nn.output %170 : tensor<1x512x4x4xbf16> loc(#loc206)
    } -> tensor<1x512x4x4xbf16> loc(#loc205)
    %135 = xten_nn.subgraph (%arg1 = %134: tensor<1x512x4x4xbf16>, %arg2 = %28: tensor<256x512x1x1xbf16>, %arg3 = %73: tensor<256xbf16>)  attributes {
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
        %170 = "tosa.const"() <{value = dense<[0, 3, 1, 2]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc)
        %171 = "tosa.const"() <{value = dense<[0, 2, 3, 1]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc)
        %172 = tosa.reshape %arg5 {new_shape = array<i64: 256, 1, 1, 512>} : (tensor<256x512x1x1xbf16>) -> tensor<256x1x1x512xbf16> loc(#loc207)
        %173 = tosa.transpose %arg4, %171 : (tensor<1x512x4x4xbf16>, tensor<4xi32>) -> tensor<1x4x4x512xbf16> loc(#loc207)
        %174 = tosa.conv2d %173, %172, %arg6 {
          PartOfLayerName = "/layer3/layer3.0/conv1/Conv",
          PartOfOutputName = "/layer3/layer3.0/conv1/Conv",
          acc_type = f32,
          dilation = array<i64: 1, 1>,
          pad = array<i64: 0, 0, 0, 0>,
          stride = array<i64: 1, 1>} : (tensor<1x4x4x512xbf16>, tensor<256x1x1x512xbf16>, tensor<256xbf16>) -> tensor<1x4x4x256xbf16> loc(#loc108)
        %175 = tosa.clamp %174 {
          LayerName = "/layer3/layer3.0/relu/Relu",
          OutputName = "/layer3/layer3.0/relu/Relu",
          max_fp = 3.40282347E+38 : f32,
          max_int = 2147483647 : i64,
          min_fp = 0.000000e+00 : f32,
          min_int = 0 : i64} : (tensor<1x4x4x256xbf16>) -> tensor<1x4x4x256xbf16> loc(#loc109)
        %176 = tosa.transpose %175, %170 : (tensor<1x4x4x256xbf16>, tensor<4xi32>) -> tensor<1x256x4x4xbf16> loc(#loc207)
        xten_nn.output %176 : tensor<1x256x4x4xbf16> loc(#loc109)
      } -> tensor<1x256x4x4xbf16> loc(#loc207)
      xten_nn.output %169 : tensor<1x256x4x4xbf16> loc(#loc207)
    } -> tensor<1x256x4x4xbf16> loc(#loc207)
    %136 = xten_nn.subgraph (%arg1 = %135: tensor<1x256x4x4xbf16>, %arg2 = %27: tensor<256x256x3x3xbf16>, %arg3 = %56: tensor<256xbf16>)  attributes {
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
        %170 = "tosa.const"() <{value = dense<[0, 3, 1, 2]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc)
        %171 = "tosa.const"() <{value = dense<[0, 2, 3, 1]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc)
        %172 = tosa.transpose %arg5, %171 : (tensor<256x256x3x3xbf16>, tensor<4xi32>) -> tensor<256x3x3x256xbf16> loc(#loc208)
        %173 = tosa.transpose %arg4, %171 : (tensor<1x256x4x4xbf16>, tensor<4xi32>) -> tensor<1x4x4x256xbf16> loc(#loc208)
        %174 = tosa.conv2d %173, %172, %arg6 {
          PartOfLayerName = "/layer3/layer3.0/conv2/Conv",
          PartOfOutputName = "/layer3/layer3.0/conv2/Conv",
          acc_type = f32,
          dilation = array<i64: 1, 1>,
          pad = array<i64: 1, 0, 1, 0>,
          stride = array<i64: 2, 2>} : (tensor<1x4x4x256xbf16>, tensor<256x3x3x256xbf16>, tensor<256xbf16>) -> tensor<1x2x2x256xbf16> loc(#loc110)
        %175 = tosa.clamp %174 {
          LayerName = "/layer3/layer3.0/relu_1/Relu",
          OutputName = "/layer3/layer3.0/relu_1/Relu",
          max_fp = 3.40282347E+38 : f32,
          max_int = 2147483647 : i64,
          min_fp = 0.000000e+00 : f32,
          min_int = 0 : i64} : (tensor<1x2x2x256xbf16>) -> tensor<1x2x2x256xbf16> loc(#loc111)
        %176 = tosa.transpose %175, %170 : (tensor<1x2x2x256xbf16>, tensor<4xi32>) -> tensor<1x256x2x2xbf16> loc(#loc208)
        xten_nn.output %176 : tensor<1x256x2x2xbf16> loc(#loc111)
      } -> tensor<1x256x2x2xbf16> loc(#loc208)
      xten_nn.output %169 : tensor<1x256x2x2xbf16> loc(#loc208)
    } -> tensor<1x256x2x2xbf16> loc(#loc208)
    %137 = xten_nn.subgraph (%arg1 = %134: tensor<1x512x4x4xbf16>, %arg2 = %25: tensor<1024x512x1x1xbf16>, %arg3 = %76: tensor<1024xbf16>)  attributes {
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
        %170 = "tosa.const"() <{value = dense<[0, 2, 3, 1]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc)
        %171 = "tosa.const"() <{value = dense<[0, 3, 1, 2]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc)
        %172 = tosa.reshape %arg5 {new_shape = array<i64: 1024, 1, 1, 512>} : (tensor<1024x512x1x1xbf16>) -> tensor<1024x1x1x512xbf16> loc(#loc112)
        %173 = tosa.transpose %arg4, %170 : (tensor<1x512x4x4xbf16>, tensor<4xi32>) -> tensor<1x4x4x512xbf16> loc(#loc112)
        %174 = tosa.slice %173 {
          PartOfLayerName = "/layer3/layer3.0/downsample/downsample.0/Conv",
          size = array<i64: 1, 3, 3, 512>,
          start = array<i64: 0, 0, 0, 0>} : (tensor<1x4x4x512xbf16>) -> tensor<1x3x3x512xbf16> loc(#loc112)
        %175 = tosa.conv2d %174, %172, %arg6 {
          PartOfLayerName = "/layer3/layer3.0/downsample/downsample.0/Conv",
          PartOfOutputName = "/layer3/layer3.0/downsample/downsample.0/Conv",
          acc_type = f32,
          dilation = array<i64: 1, 1>,
          pad = array<i64: 0, 0, 0, 0>,
          stride = array<i64: 2, 2>} : (tensor<1x3x3x512xbf16>, tensor<1024x1x1x512xbf16>, tensor<1024xbf16>) -> tensor<1x2x2x1024xbf16> loc(#loc112)
        %176 = tosa.transpose %175, %171 : (tensor<1x2x2x1024xbf16>, tensor<4xi32>) -> tensor<1x1024x2x2xbf16> loc(#loc112)
        xten_nn.output %176 : tensor<1x1024x2x2xbf16> loc(#loc112)
      } -> tensor<1x1024x2x2xbf16> loc(#loc112)
      xten_nn.output %169 : tensor<1x1024x2x2xbf16> loc(#loc112)
    } -> tensor<1x1024x2x2xbf16> loc(#loc112)
    %138 = xten_nn.subgraph (%arg1 = %136: tensor<1x256x2x2xbf16>, %arg2 = %26: tensor<1024x256x1x1xbf16>, %arg3 = %63: tensor<1024xbf16>, %arg4 = %137: tensor<1x1024x2x2xbf16>)  attributes {
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
        %171 = "tosa.const"() <{value = dense<[0, 3, 1, 2]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc)
        %172 = "tosa.const"() <{value = dense<[0, 2, 3, 1]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc)
        %173 = tosa.reshape %arg6 {new_shape = array<i64: 1024, 1, 1, 256>} : (tensor<1024x256x1x1xbf16>) -> tensor<1024x1x1x256xbf16> loc(#loc113)
        %174 = tosa.transpose %arg5, %172 : (tensor<1x256x2x2xbf16>, tensor<4xi32>) -> tensor<1x2x2x256xbf16> loc(#loc113)
        %175 = tosa.conv2d %174, %173, %arg7 {
          PartOfLayerName = "/layer3/layer3.0/conv3/Conv",
          PartOfOutputName = "/layer3/layer3.0/conv3/Conv",
          acc_type = f32,
          dilation = array<i64: 1, 1>,
          pad = array<i64: 0, 0, 0, 0>,
          stride = array<i64: 1, 1>} : (tensor<1x2x2x256xbf16>, tensor<1024x1x1x256xbf16>, tensor<1024xbf16>) -> tensor<1x2x2x1024xbf16> loc(#loc113)
        %176 = tosa.transpose %175, %171 : (tensor<1x2x2x1024xbf16>, tensor<4xi32>) -> tensor<1x1024x2x2xbf16> loc(#loc113)
        xten_nn.output %176 : tensor<1x1024x2x2xbf16> loc(#loc113)
      } -> tensor<1x1024x2x2xbf16> loc(#loc113)
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
        %171 = tosa.add %arg5, %arg6 {LayerName = "/layer3/layer3.0/Add", OutputName = "/layer3/layer3.0/Add"} : (tensor<1x1024x2x2xbf16>, tensor<1x1024x2x2xbf16>) -> tensor<1x1024x2x2xbf16> loc(#loc114)
        %172 = tosa.clamp %171 {
          LayerName = "/layer3/layer3.0/relu_2/Relu",
          OutputName = "/layer3/layer3.0/relu_2/Relu",
          max_fp = 3.40282347E+38 : f32,
          max_int = 2147483647 : i64,
          min_fp = 0.000000e+00 : f32,
          min_int = 0 : i64} : (tensor<1x1024x2x2xbf16>) -> tensor<1x1024x2x2xbf16> loc(#loc115)
        xten_nn.output %172 : tensor<1x1024x2x2xbf16> loc(#loc115)
      } -> tensor<1x1024x2x2xbf16> loc(#loc210)
      xten_nn.output %170 : tensor<1x1024x2x2xbf16> loc(#loc210)
    } -> tensor<1x1024x2x2xbf16> loc(#loc209)
    %139 = xten_nn.subgraph (%arg1 = %138: tensor<1x1024x2x2xbf16>, %arg2 = %24: tensor<256x1024x1x1xbf16>, %arg3 = %83: tensor<256xbf16>)  attributes {
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
        %170 = "tosa.const"() <{value = dense<[0, 3, 1, 2]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc)
        %171 = "tosa.const"() <{value = dense<[0, 2, 3, 1]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc)
        %172 = tosa.reshape %arg5 {new_shape = array<i64: 256, 1, 1, 1024>} : (tensor<256x1024x1x1xbf16>) -> tensor<256x1x1x1024xbf16> loc(#loc211)
        %173 = tosa.transpose %arg4, %171 : (tensor<1x1024x2x2xbf16>, tensor<4xi32>) -> tensor<1x2x2x1024xbf16> loc(#loc211)
        %174 = tosa.conv2d %173, %172, %arg6 {
          PartOfLayerName = "/layer3/layer3.1/conv1/Conv",
          PartOfOutputName = "/layer3/layer3.1/conv1/Conv",
          acc_type = f32,
          dilation = array<i64: 1, 1>,
          pad = array<i64: 0, 0, 0, 0>,
          stride = array<i64: 1, 1>} : (tensor<1x2x2x1024xbf16>, tensor<256x1x1x1024xbf16>, tensor<256xbf16>) -> tensor<1x2x2x256xbf16> loc(#loc116)
        %175 = tosa.clamp %174 {
          LayerName = "/layer3/layer3.1/relu/Relu",
          OutputName = "/layer3/layer3.1/relu/Relu",
          max_fp = 3.40282347E+38 : f32,
          max_int = 2147483647 : i64,
          min_fp = 0.000000e+00 : f32,
          min_int = 0 : i64} : (tensor<1x2x2x256xbf16>) -> tensor<1x2x2x256xbf16> loc(#loc117)
        %176 = tosa.transpose %175, %170 : (tensor<1x2x2x256xbf16>, tensor<4xi32>) -> tensor<1x256x2x2xbf16> loc(#loc211)
        xten_nn.output %176 : tensor<1x256x2x2xbf16> loc(#loc117)
      } -> tensor<1x256x2x2xbf16> loc(#loc211)
      xten_nn.output %169 : tensor<1x256x2x2xbf16> loc(#loc211)
    } -> tensor<1x256x2x2xbf16> loc(#loc211)
    %140 = xten_nn.subgraph (%arg1 = %139: tensor<1x256x2x2xbf16>, %arg2 = %23: tensor<256x256x3x3xbf16>, %arg3 = %68: tensor<256xbf16>)  attributes {
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
        %170 = "tosa.const"() <{value = dense<[0, 3, 1, 2]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc)
        %171 = "tosa.const"() <{value = dense<[0, 2, 3, 1]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc)
        %172 = tosa.transpose %arg5, %171 : (tensor<256x256x3x3xbf16>, tensor<4xi32>) -> tensor<256x3x3x256xbf16> loc(#loc212)
        %173 = tosa.transpose %arg4, %171 : (tensor<1x256x2x2xbf16>, tensor<4xi32>) -> tensor<1x2x2x256xbf16> loc(#loc212)
        %174 = tosa.conv2d %173, %172, %arg6 {
          PartOfLayerName = "/layer3/layer3.1/conv2/Conv",
          PartOfOutputName = "/layer3/layer3.1/conv2/Conv",
          acc_type = f32,
          dilation = array<i64: 1, 1>,
          pad = array<i64: 1, 1, 1, 1>,
          stride = array<i64: 1, 1>} : (tensor<1x2x2x256xbf16>, tensor<256x3x3x256xbf16>, tensor<256xbf16>) -> tensor<1x2x2x256xbf16> loc(#loc118)
        %175 = tosa.clamp %174 {
          LayerName = "/layer3/layer3.1/relu_1/Relu",
          OutputName = "/layer3/layer3.1/relu_1/Relu",
          max_fp = 3.40282347E+38 : f32,
          max_int = 2147483647 : i64,
          min_fp = 0.000000e+00 : f32,
          min_int = 0 : i64} : (tensor<1x2x2x256xbf16>) -> tensor<1x2x2x256xbf16> loc(#loc119)
        %176 = tosa.transpose %175, %170 : (tensor<1x2x2x256xbf16>, tensor<4xi32>) -> tensor<1x256x2x2xbf16> loc(#loc212)
        xten_nn.output %176 : tensor<1x256x2x2xbf16> loc(#loc119)
      } -> tensor<1x256x2x2xbf16> loc(#loc212)
      xten_nn.output %169 : tensor<1x256x2x2xbf16> loc(#loc212)
    } -> tensor<1x256x2x2xbf16> loc(#loc212)
    %141 = xten_nn.subgraph (%arg1 = %140: tensor<1x256x2x2xbf16>, %arg2 = %22: tensor<1024x256x1x1xbf16>, %arg3 = %58: tensor<1024xbf16>, %arg4 = %138: tensor<1x1024x2x2xbf16>)  attributes {
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
        %171 = "tosa.const"() <{value = dense<[0, 3, 1, 2]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc)
        %172 = "tosa.const"() <{value = dense<[0, 2, 3, 1]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc)
        %173 = tosa.reshape %arg6 {new_shape = array<i64: 1024, 1, 1, 256>} : (tensor<1024x256x1x1xbf16>) -> tensor<1024x1x1x256xbf16> loc(#loc120)
        %174 = tosa.transpose %arg5, %172 : (tensor<1x256x2x2xbf16>, tensor<4xi32>) -> tensor<1x2x2x256xbf16> loc(#loc120)
        %175 = tosa.conv2d %174, %173, %arg7 {
          PartOfLayerName = "/layer3/layer3.1/conv3/Conv",
          PartOfOutputName = "/layer3/layer3.1/conv3/Conv",
          acc_type = f32,
          dilation = array<i64: 1, 1>,
          pad = array<i64: 0, 0, 0, 0>,
          stride = array<i64: 1, 1>} : (tensor<1x2x2x256xbf16>, tensor<1024x1x1x256xbf16>, tensor<1024xbf16>) -> tensor<1x2x2x1024xbf16> loc(#loc120)
        %176 = tosa.transpose %175, %171 : (tensor<1x2x2x1024xbf16>, tensor<4xi32>) -> tensor<1x1024x2x2xbf16> loc(#loc120)
        xten_nn.output %176 : tensor<1x1024x2x2xbf16> loc(#loc120)
      } -> tensor<1x1024x2x2xbf16> loc(#loc120)
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
        %171 = tosa.add %arg5, %arg6 {LayerName = "/layer3/layer3.1/Add", OutputName = "/layer3/layer3.1/Add"} : (tensor<1x1024x2x2xbf16>, tensor<1x1024x2x2xbf16>) -> tensor<1x1024x2x2xbf16> loc(#loc121)
        %172 = tosa.clamp %171 {
          LayerName = "/layer3/layer3.1/relu_2/Relu",
          OutputName = "/layer3/layer3.1/relu_2/Relu",
          max_fp = 3.40282347E+38 : f32,
          max_int = 2147483647 : i64,
          min_fp = 0.000000e+00 : f32,
          min_int = 0 : i64} : (tensor<1x1024x2x2xbf16>) -> tensor<1x1024x2x2xbf16> loc(#loc122)
        xten_nn.output %172 : tensor<1x1024x2x2xbf16> loc(#loc122)
      } -> tensor<1x1024x2x2xbf16> loc(#loc214)
      xten_nn.output %170 : tensor<1x1024x2x2xbf16> loc(#loc214)
    } -> tensor<1x1024x2x2xbf16> loc(#loc213)
    %142 = xten_nn.subgraph (%arg1 = %141: tensor<1x1024x2x2xbf16>, %arg2 = %21: tensor<256x1024x1x1xbf16>, %arg3 = %79: tensor<256xbf16>)  attributes {
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
        %170 = "tosa.const"() <{value = dense<[0, 3, 1, 2]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc)
        %171 = "tosa.const"() <{value = dense<[0, 2, 3, 1]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc)
        %172 = tosa.reshape %arg5 {new_shape = array<i64: 256, 1, 1, 1024>} : (tensor<256x1024x1x1xbf16>) -> tensor<256x1x1x1024xbf16> loc(#loc215)
        %173 = tosa.transpose %arg4, %171 : (tensor<1x1024x2x2xbf16>, tensor<4xi32>) -> tensor<1x2x2x1024xbf16> loc(#loc215)
        %174 = tosa.conv2d %173, %172, %arg6 {
          PartOfLayerName = "/layer3/layer3.2/conv1/Conv",
          PartOfOutputName = "/layer3/layer3.2/conv1/Conv",
          acc_type = f32,
          dilation = array<i64: 1, 1>,
          pad = array<i64: 0, 0, 0, 0>,
          stride = array<i64: 1, 1>} : (tensor<1x2x2x1024xbf16>, tensor<256x1x1x1024xbf16>, tensor<256xbf16>) -> tensor<1x2x2x256xbf16> loc(#loc123)
        %175 = tosa.clamp %174 {
          LayerName = "/layer3/layer3.2/relu/Relu",
          OutputName = "/layer3/layer3.2/relu/Relu",
          max_fp = 3.40282347E+38 : f32,
          max_int = 2147483647 : i64,
          min_fp = 0.000000e+00 : f32,
          min_int = 0 : i64} : (tensor<1x2x2x256xbf16>) -> tensor<1x2x2x256xbf16> loc(#loc124)
        %176 = tosa.transpose %175, %170 : (tensor<1x2x2x256xbf16>, tensor<4xi32>) -> tensor<1x256x2x2xbf16> loc(#loc215)
        xten_nn.output %176 : tensor<1x256x2x2xbf16> loc(#loc124)
      } -> tensor<1x256x2x2xbf16> loc(#loc215)
      xten_nn.output %169 : tensor<1x256x2x2xbf16> loc(#loc215)
    } -> tensor<1x256x2x2xbf16> loc(#loc215)
    %143 = xten_nn.subgraph (%arg1 = %142: tensor<1x256x2x2xbf16>, %arg2 = %20: tensor<256x256x3x3xbf16>, %arg3 = %71: tensor<256xbf16>)  attributes {
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
        %170 = "tosa.const"() <{value = dense<[0, 3, 1, 2]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc)
        %171 = "tosa.const"() <{value = dense<[0, 2, 3, 1]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc)
        %172 = tosa.transpose %arg5, %171 : (tensor<256x256x3x3xbf16>, tensor<4xi32>) -> tensor<256x3x3x256xbf16> loc(#loc216)
        %173 = tosa.transpose %arg4, %171 : (tensor<1x256x2x2xbf16>, tensor<4xi32>) -> tensor<1x2x2x256xbf16> loc(#loc216)
        %174 = tosa.conv2d %173, %172, %arg6 {
          PartOfLayerName = "/layer3/layer3.2/conv2/Conv",
          PartOfOutputName = "/layer3/layer3.2/conv2/Conv",
          acc_type = f32,
          dilation = array<i64: 1, 1>,
          pad = array<i64: 1, 1, 1, 1>,
          stride = array<i64: 1, 1>} : (tensor<1x2x2x256xbf16>, tensor<256x3x3x256xbf16>, tensor<256xbf16>) -> tensor<1x2x2x256xbf16> loc(#loc125)
        %175 = tosa.clamp %174 {
          LayerName = "/layer3/layer3.2/relu_1/Relu",
          OutputName = "/layer3/layer3.2/relu_1/Relu",
          max_fp = 3.40282347E+38 : f32,
          max_int = 2147483647 : i64,
          min_fp = 0.000000e+00 : f32,
          min_int = 0 : i64} : (tensor<1x2x2x256xbf16>) -> tensor<1x2x2x256xbf16> loc(#loc126)
        %176 = tosa.transpose %175, %170 : (tensor<1x2x2x256xbf16>, tensor<4xi32>) -> tensor<1x256x2x2xbf16> loc(#loc216)
        xten_nn.output %176 : tensor<1x256x2x2xbf16> loc(#loc126)
      } -> tensor<1x256x2x2xbf16> loc(#loc216)
      xten_nn.output %169 : tensor<1x256x2x2xbf16> loc(#loc216)
    } -> tensor<1x256x2x2xbf16> loc(#loc216)
    %144 = xten_nn.subgraph (%arg1 = %143: tensor<1x256x2x2xbf16>, %arg2 = %19: tensor<1024x256x1x1xbf16>, %arg3 = %91: tensor<1024xbf16>, %arg4 = %141: tensor<1x1024x2x2xbf16>)  attributes {
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
        %171 = "tosa.const"() <{value = dense<[0, 3, 1, 2]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc)
        %172 = "tosa.const"() <{value = dense<[0, 2, 3, 1]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc)
        %173 = tosa.reshape %arg6 {new_shape = array<i64: 1024, 1, 1, 256>} : (tensor<1024x256x1x1xbf16>) -> tensor<1024x1x1x256xbf16> loc(#loc127)
        %174 = tosa.transpose %arg5, %172 : (tensor<1x256x2x2xbf16>, tensor<4xi32>) -> tensor<1x2x2x256xbf16> loc(#loc127)
        %175 = tosa.conv2d %174, %173, %arg7 {
          PartOfLayerName = "/layer3/layer3.2/conv3/Conv",
          PartOfOutputName = "/layer3/layer3.2/conv3/Conv",
          acc_type = f32,
          dilation = array<i64: 1, 1>,
          pad = array<i64: 0, 0, 0, 0>,
          stride = array<i64: 1, 1>} : (tensor<1x2x2x256xbf16>, tensor<1024x1x1x256xbf16>, tensor<1024xbf16>) -> tensor<1x2x2x1024xbf16> loc(#loc127)
        %176 = tosa.transpose %175, %171 : (tensor<1x2x2x1024xbf16>, tensor<4xi32>) -> tensor<1x1024x2x2xbf16> loc(#loc127)
        xten_nn.output %176 : tensor<1x1024x2x2xbf16> loc(#loc127)
      } -> tensor<1x1024x2x2xbf16> loc(#loc127)
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
        %171 = tosa.add %arg5, %arg6 {LayerName = "/layer3/layer3.2/Add", OutputName = "/layer3/layer3.2/Add"} : (tensor<1x1024x2x2xbf16>, tensor<1x1024x2x2xbf16>) -> tensor<1x1024x2x2xbf16> loc(#loc128)
        %172 = tosa.clamp %171 {
          LayerName = "/layer3/layer3.2/relu_2/Relu",
          OutputName = "/layer3/layer3.2/relu_2/Relu",
          max_fp = 3.40282347E+38 : f32,
          max_int = 2147483647 : i64,
          min_fp = 0.000000e+00 : f32,
          min_int = 0 : i64} : (tensor<1x1024x2x2xbf16>) -> tensor<1x1024x2x2xbf16> loc(#loc129)
        xten_nn.output %172 : tensor<1x1024x2x2xbf16> loc(#loc129)
      } -> tensor<1x1024x2x2xbf16> loc(#loc218)
      xten_nn.output %170 : tensor<1x1024x2x2xbf16> loc(#loc218)
    } -> tensor<1x1024x2x2xbf16> loc(#loc217)
    %145 = xten_nn.subgraph (%arg1 = %144: tensor<1x1024x2x2xbf16>, %arg2 = %18: tensor<256x1024x1x1xbf16>, %arg3 = %86: tensor<256xbf16>)  attributes {
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
        %170 = "tosa.const"() <{value = dense<[0, 3, 1, 2]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc)
        %171 = "tosa.const"() <{value = dense<[0, 2, 3, 1]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc)
        %172 = tosa.reshape %arg5 {new_shape = array<i64: 256, 1, 1, 1024>} : (tensor<256x1024x1x1xbf16>) -> tensor<256x1x1x1024xbf16> loc(#loc219)
        %173 = tosa.transpose %arg4, %171 : (tensor<1x1024x2x2xbf16>, tensor<4xi32>) -> tensor<1x2x2x1024xbf16> loc(#loc219)
        %174 = tosa.conv2d %173, %172, %arg6 {
          PartOfLayerName = "/layer3/layer3.3/conv1/Conv",
          PartOfOutputName = "/layer3/layer3.3/conv1/Conv",
          acc_type = f32,
          dilation = array<i64: 1, 1>,
          pad = array<i64: 0, 0, 0, 0>,
          stride = array<i64: 1, 1>} : (tensor<1x2x2x1024xbf16>, tensor<256x1x1x1024xbf16>, tensor<256xbf16>) -> tensor<1x2x2x256xbf16> loc(#loc130)
        %175 = tosa.clamp %174 {
          LayerName = "/layer3/layer3.3/relu/Relu",
          OutputName = "/layer3/layer3.3/relu/Relu",
          max_fp = 3.40282347E+38 : f32,
          max_int = 2147483647 : i64,
          min_fp = 0.000000e+00 : f32,
          min_int = 0 : i64} : (tensor<1x2x2x256xbf16>) -> tensor<1x2x2x256xbf16> loc(#loc131)
        %176 = tosa.transpose %175, %170 : (tensor<1x2x2x256xbf16>, tensor<4xi32>) -> tensor<1x256x2x2xbf16> loc(#loc219)
        xten_nn.output %176 : tensor<1x256x2x2xbf16> loc(#loc131)
      } -> tensor<1x256x2x2xbf16> loc(#loc219)
      xten_nn.output %169 : tensor<1x256x2x2xbf16> loc(#loc219)
    } -> tensor<1x256x2x2xbf16> loc(#loc219)
    %146 = xten_nn.subgraph (%arg1 = %145: tensor<1x256x2x2xbf16>, %arg2 = %17: tensor<256x256x3x3xbf16>, %arg3 = %88: tensor<256xbf16>)  attributes {
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
        %170 = "tosa.const"() <{value = dense<[0, 3, 1, 2]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc)
        %171 = "tosa.const"() <{value = dense<[0, 2, 3, 1]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc)
        %172 = tosa.transpose %arg5, %171 : (tensor<256x256x3x3xbf16>, tensor<4xi32>) -> tensor<256x3x3x256xbf16> loc(#loc220)
        %173 = tosa.transpose %arg4, %171 : (tensor<1x256x2x2xbf16>, tensor<4xi32>) -> tensor<1x2x2x256xbf16> loc(#loc220)
        %174 = tosa.conv2d %173, %172, %arg6 {
          PartOfLayerName = "/layer3/layer3.3/conv2/Conv",
          PartOfOutputName = "/layer3/layer3.3/conv2/Conv",
          acc_type = f32,
          dilation = array<i64: 1, 1>,
          pad = array<i64: 1, 1, 1, 1>,
          stride = array<i64: 1, 1>} : (tensor<1x2x2x256xbf16>, tensor<256x3x3x256xbf16>, tensor<256xbf16>) -> tensor<1x2x2x256xbf16> loc(#loc132)
        %175 = tosa.clamp %174 {
          LayerName = "/layer3/layer3.3/relu_1/Relu",
          OutputName = "/layer3/layer3.3/relu_1/Relu",
          max_fp = 3.40282347E+38 : f32,
          max_int = 2147483647 : i64,
          min_fp = 0.000000e+00 : f32,
          min_int = 0 : i64} : (tensor<1x2x2x256xbf16>) -> tensor<1x2x2x256xbf16> loc(#loc133)
        %176 = tosa.transpose %175, %170 : (tensor<1x2x2x256xbf16>, tensor<4xi32>) -> tensor<1x256x2x2xbf16> loc(#loc220)
        xten_nn.output %176 : tensor<1x256x2x2xbf16> loc(#loc133)
      } -> tensor<1x256x2x2xbf16> loc(#loc220)
      xten_nn.output %169 : tensor<1x256x2x2xbf16> loc(#loc220)
    } -> tensor<1x256x2x2xbf16> loc(#loc220)
    %147 = xten_nn.subgraph (%arg1 = %146: tensor<1x256x2x2xbf16>, %arg2 = %16: tensor<1024x256x1x1xbf16>, %arg3 = %89: tensor<1024xbf16>, %arg4 = %144: tensor<1x1024x2x2xbf16>)  attributes {
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
        %171 = "tosa.const"() <{value = dense<[0, 3, 1, 2]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc)
        %172 = "tosa.const"() <{value = dense<[0, 2, 3, 1]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc)
        %173 = tosa.reshape %arg6 {new_shape = array<i64: 1024, 1, 1, 256>} : (tensor<1024x256x1x1xbf16>) -> tensor<1024x1x1x256xbf16> loc(#loc134)
        %174 = tosa.transpose %arg5, %172 : (tensor<1x256x2x2xbf16>, tensor<4xi32>) -> tensor<1x2x2x256xbf16> loc(#loc134)
        %175 = tosa.conv2d %174, %173, %arg7 {
          PartOfLayerName = "/layer3/layer3.3/conv3/Conv",
          PartOfOutputName = "/layer3/layer3.3/conv3/Conv",
          acc_type = f32,
          dilation = array<i64: 1, 1>,
          pad = array<i64: 0, 0, 0, 0>,
          stride = array<i64: 1, 1>} : (tensor<1x2x2x256xbf16>, tensor<1024x1x1x256xbf16>, tensor<1024xbf16>) -> tensor<1x2x2x1024xbf16> loc(#loc134)
        %176 = tosa.transpose %175, %171 : (tensor<1x2x2x1024xbf16>, tensor<4xi32>) -> tensor<1x1024x2x2xbf16> loc(#loc134)
        xten_nn.output %176 : tensor<1x1024x2x2xbf16> loc(#loc134)
      } -> tensor<1x1024x2x2xbf16> loc(#loc134)
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
        %171 = tosa.add %arg5, %arg6 {LayerName = "/layer3/layer3.3/Add", OutputName = "/layer3/layer3.3/Add"} : (tensor<1x1024x2x2xbf16>, tensor<1x1024x2x2xbf16>) -> tensor<1x1024x2x2xbf16> loc(#loc135)
        %172 = tosa.clamp %171 {
          LayerName = "/layer3/layer3.3/relu_2/Relu",
          OutputName = "/layer3/layer3.3/relu_2/Relu",
          max_fp = 3.40282347E+38 : f32,
          max_int = 2147483647 : i64,
          min_fp = 0.000000e+00 : f32,
          min_int = 0 : i64} : (tensor<1x1024x2x2xbf16>) -> tensor<1x1024x2x2xbf16> loc(#loc136)
        xten_nn.output %172 : tensor<1x1024x2x2xbf16> loc(#loc136)
      } -> tensor<1x1024x2x2xbf16> loc(#loc222)
      xten_nn.output %170 : tensor<1x1024x2x2xbf16> loc(#loc222)
    } -> tensor<1x1024x2x2xbf16> loc(#loc221)
    %148 = xten_nn.subgraph (%arg1 = %147: tensor<1x1024x2x2xbf16>, %arg2 = %15: tensor<256x1024x1x1xbf16>, %arg3 = %92: tensor<256xbf16>)  attributes {
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
        %170 = "tosa.const"() <{value = dense<[0, 3, 1, 2]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc)
        %171 = "tosa.const"() <{value = dense<[0, 2, 3, 1]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc)
        %172 = tosa.reshape %arg5 {new_shape = array<i64: 256, 1, 1, 1024>} : (tensor<256x1024x1x1xbf16>) -> tensor<256x1x1x1024xbf16> loc(#loc223)
        %173 = tosa.transpose %arg4, %171 : (tensor<1x1024x2x2xbf16>, tensor<4xi32>) -> tensor<1x2x2x1024xbf16> loc(#loc223)
        %174 = tosa.conv2d %173, %172, %arg6 {
          PartOfLayerName = "/layer3/layer3.4/conv1/Conv",
          PartOfOutputName = "/layer3/layer3.4/conv1/Conv",
          acc_type = f32,
          dilation = array<i64: 1, 1>,
          pad = array<i64: 0, 0, 0, 0>,
          stride = array<i64: 1, 1>} : (tensor<1x2x2x1024xbf16>, tensor<256x1x1x1024xbf16>, tensor<256xbf16>) -> tensor<1x2x2x256xbf16> loc(#loc137)
        %175 = tosa.clamp %174 {
          LayerName = "/layer3/layer3.4/relu/Relu",
          OutputName = "/layer3/layer3.4/relu/Relu",
          max_fp = 3.40282347E+38 : f32,
          max_int = 2147483647 : i64,
          min_fp = 0.000000e+00 : f32,
          min_int = 0 : i64} : (tensor<1x2x2x256xbf16>) -> tensor<1x2x2x256xbf16> loc(#loc138)
        %176 = tosa.transpose %175, %170 : (tensor<1x2x2x256xbf16>, tensor<4xi32>) -> tensor<1x256x2x2xbf16> loc(#loc223)
        xten_nn.output %176 : tensor<1x256x2x2xbf16> loc(#loc138)
      } -> tensor<1x256x2x2xbf16> loc(#loc223)
      xten_nn.output %169 : tensor<1x256x2x2xbf16> loc(#loc223)
    } -> tensor<1x256x2x2xbf16> loc(#loc223)
    %149 = xten_nn.subgraph (%arg1 = %148: tensor<1x256x2x2xbf16>, %arg2 = %14: tensor<256x256x3x3xbf16>, %arg3 = %66: tensor<256xbf16>)  attributes {
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
        %170 = "tosa.const"() <{value = dense<[0, 3, 1, 2]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc)
        %171 = "tosa.const"() <{value = dense<[0, 2, 3, 1]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc)
        %172 = tosa.transpose %arg5, %171 : (tensor<256x256x3x3xbf16>, tensor<4xi32>) -> tensor<256x3x3x256xbf16> loc(#loc224)
        %173 = tosa.transpose %arg4, %171 : (tensor<1x256x2x2xbf16>, tensor<4xi32>) -> tensor<1x2x2x256xbf16> loc(#loc224)
        %174 = tosa.conv2d %173, %172, %arg6 {
          PartOfLayerName = "/layer3/layer3.4/conv2/Conv",
          PartOfOutputName = "/layer3/layer3.4/conv2/Conv",
          acc_type = f32,
          dilation = array<i64: 1, 1>,
          pad = array<i64: 1, 1, 1, 1>,
          stride = array<i64: 1, 1>} : (tensor<1x2x2x256xbf16>, tensor<256x3x3x256xbf16>, tensor<256xbf16>) -> tensor<1x2x2x256xbf16> loc(#loc139)
        %175 = tosa.clamp %174 {
          LayerName = "/layer3/layer3.4/relu_1/Relu",
          OutputName = "/layer3/layer3.4/relu_1/Relu",
          max_fp = 3.40282347E+38 : f32,
          max_int = 2147483647 : i64,
          min_fp = 0.000000e+00 : f32,
          min_int = 0 : i64} : (tensor<1x2x2x256xbf16>) -> tensor<1x2x2x256xbf16> loc(#loc140)
        %176 = tosa.transpose %175, %170 : (tensor<1x2x2x256xbf16>, tensor<4xi32>) -> tensor<1x256x2x2xbf16> loc(#loc224)
        xten_nn.output %176 : tensor<1x256x2x2xbf16> loc(#loc140)
      } -> tensor<1x256x2x2xbf16> loc(#loc224)
      xten_nn.output %169 : tensor<1x256x2x2xbf16> loc(#loc224)
    } -> tensor<1x256x2x2xbf16> loc(#loc224)
    %150 = xten_nn.subgraph (%arg1 = %149: tensor<1x256x2x2xbf16>, %arg2 = %13: tensor<1024x256x1x1xbf16>, %arg3 = %103: tensor<1024xbf16>, %arg4 = %147: tensor<1x1024x2x2xbf16>)  attributes {
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
        %171 = "tosa.const"() <{value = dense<[0, 3, 1, 2]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc)
        %172 = "tosa.const"() <{value = dense<[0, 2, 3, 1]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc)
        %173 = tosa.reshape %arg6 {new_shape = array<i64: 1024, 1, 1, 256>} : (tensor<1024x256x1x1xbf16>) -> tensor<1024x1x1x256xbf16> loc(#loc141)
        %174 = tosa.transpose %arg5, %172 : (tensor<1x256x2x2xbf16>, tensor<4xi32>) -> tensor<1x2x2x256xbf16> loc(#loc141)
        %175 = tosa.conv2d %174, %173, %arg7 {
          PartOfLayerName = "/layer3/layer3.4/conv3/Conv",
          PartOfOutputName = "/layer3/layer3.4/conv3/Conv",
          acc_type = f32,
          dilation = array<i64: 1, 1>,
          pad = array<i64: 0, 0, 0, 0>,
          stride = array<i64: 1, 1>} : (tensor<1x2x2x256xbf16>, tensor<1024x1x1x256xbf16>, tensor<1024xbf16>) -> tensor<1x2x2x1024xbf16> loc(#loc141)
        %176 = tosa.transpose %175, %171 : (tensor<1x2x2x1024xbf16>, tensor<4xi32>) -> tensor<1x1024x2x2xbf16> loc(#loc141)
        xten_nn.output %176 : tensor<1x1024x2x2xbf16> loc(#loc141)
      } -> tensor<1x1024x2x2xbf16> loc(#loc141)
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
        %171 = tosa.add %arg5, %arg6 {LayerName = "/layer3/layer3.4/Add", OutputName = "/layer3/layer3.4/Add"} : (tensor<1x1024x2x2xbf16>, tensor<1x1024x2x2xbf16>) -> tensor<1x1024x2x2xbf16> loc(#loc142)
        %172 = tosa.clamp %171 {
          LayerName = "/layer3/layer3.4/relu_2/Relu",
          OutputName = "/layer3/layer3.4/relu_2/Relu",
          max_fp = 3.40282347E+38 : f32,
          max_int = 2147483647 : i64,
          min_fp = 0.000000e+00 : f32,
          min_int = 0 : i64} : (tensor<1x1024x2x2xbf16>) -> tensor<1x1024x2x2xbf16> loc(#loc143)
        xten_nn.output %172 : tensor<1x1024x2x2xbf16> loc(#loc143)
      } -> tensor<1x1024x2x2xbf16> loc(#loc226)
      xten_nn.output %170 : tensor<1x1024x2x2xbf16> loc(#loc226)
    } -> tensor<1x1024x2x2xbf16> loc(#loc225)
    %151 = xten_nn.subgraph (%arg1 = %150: tensor<1x1024x2x2xbf16>, %arg2 = %12: tensor<256x1024x1x1xbf16>, %arg3 = %95: tensor<256xbf16>)  attributes {
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
        %170 = "tosa.const"() <{value = dense<[0, 3, 1, 2]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc)
        %171 = "tosa.const"() <{value = dense<[0, 2, 3, 1]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc)
        %172 = tosa.reshape %arg5 {new_shape = array<i64: 256, 1, 1, 1024>} : (tensor<256x1024x1x1xbf16>) -> tensor<256x1x1x1024xbf16> loc(#loc227)
        %173 = tosa.transpose %arg4, %171 : (tensor<1x1024x2x2xbf16>, tensor<4xi32>) -> tensor<1x2x2x1024xbf16> loc(#loc227)
        %174 = tosa.conv2d %173, %172, %arg6 {
          PartOfLayerName = "/layer3/layer3.5/conv1/Conv",
          PartOfOutputName = "/layer3/layer3.5/conv1/Conv",
          acc_type = f32,
          dilation = array<i64: 1, 1>,
          pad = array<i64: 0, 0, 0, 0>,
          stride = array<i64: 1, 1>} : (tensor<1x2x2x1024xbf16>, tensor<256x1x1x1024xbf16>, tensor<256xbf16>) -> tensor<1x2x2x256xbf16> loc(#loc144)
        %175 = tosa.clamp %174 {
          LayerName = "/layer3/layer3.5/relu/Relu",
          OutputName = "/layer3/layer3.5/relu/Relu",
          max_fp = 3.40282347E+38 : f32,
          max_int = 2147483647 : i64,
          min_fp = 0.000000e+00 : f32,
          min_int = 0 : i64} : (tensor<1x2x2x256xbf16>) -> tensor<1x2x2x256xbf16> loc(#loc145)
        %176 = tosa.transpose %175, %170 : (tensor<1x2x2x256xbf16>, tensor<4xi32>) -> tensor<1x256x2x2xbf16> loc(#loc227)
        xten_nn.output %176 : tensor<1x256x2x2xbf16> loc(#loc145)
      } -> tensor<1x256x2x2xbf16> loc(#loc227)
      xten_nn.output %169 : tensor<1x256x2x2xbf16> loc(#loc227)
    } -> tensor<1x256x2x2xbf16> loc(#loc227)
    %152 = xten_nn.subgraph (%arg1 = %151: tensor<1x256x2x2xbf16>, %arg2 = %11: tensor<256x256x3x3xbf16>, %arg3 = %99: tensor<256xbf16>)  attributes {
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
        %170 = "tosa.const"() <{value = dense<[0, 3, 1, 2]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc)
        %171 = "tosa.const"() <{value = dense<[0, 2, 3, 1]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc)
        %172 = tosa.transpose %arg5, %171 : (tensor<256x256x3x3xbf16>, tensor<4xi32>) -> tensor<256x3x3x256xbf16> loc(#loc228)
        %173 = tosa.transpose %arg4, %171 : (tensor<1x256x2x2xbf16>, tensor<4xi32>) -> tensor<1x2x2x256xbf16> loc(#loc228)
        %174 = tosa.conv2d %173, %172, %arg6 {
          PartOfLayerName = "/layer3/layer3.5/conv2/Conv",
          PartOfOutputName = "/layer3/layer3.5/conv2/Conv",
          acc_type = f32,
          dilation = array<i64: 1, 1>,
          pad = array<i64: 1, 1, 1, 1>,
          stride = array<i64: 1, 1>} : (tensor<1x2x2x256xbf16>, tensor<256x3x3x256xbf16>, tensor<256xbf16>) -> tensor<1x2x2x256xbf16> loc(#loc146)
        %175 = tosa.clamp %174 {
          LayerName = "/layer3/layer3.5/relu_1/Relu",
          OutputName = "/layer3/layer3.5/relu_1/Relu",
          max_fp = 3.40282347E+38 : f32,
          max_int = 2147483647 : i64,
          min_fp = 0.000000e+00 : f32,
          min_int = 0 : i64} : (tensor<1x2x2x256xbf16>) -> tensor<1x2x2x256xbf16> loc(#loc147)
        %176 = tosa.transpose %175, %170 : (tensor<1x2x2x256xbf16>, tensor<4xi32>) -> tensor<1x256x2x2xbf16> loc(#loc228)
        xten_nn.output %176 : tensor<1x256x2x2xbf16> loc(#loc147)
      } -> tensor<1x256x2x2xbf16> loc(#loc228)
      xten_nn.output %169 : tensor<1x256x2x2xbf16> loc(#loc228)
    } -> tensor<1x256x2x2xbf16> loc(#loc228)
    %153 = xten_nn.subgraph (%arg1 = %152: tensor<1x256x2x2xbf16>, %arg2 = %10: tensor<1024x256x1x1xbf16>, %arg3 = %101: tensor<1024xbf16>, %arg4 = %150: tensor<1x1024x2x2xbf16>)  attributes {
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
        %171 = "tosa.const"() <{value = dense<[0, 3, 1, 2]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc)
        %172 = "tosa.const"() <{value = dense<[0, 2, 3, 1]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc)
        %173 = tosa.reshape %arg6 {new_shape = array<i64: 1024, 1, 1, 256>} : (tensor<1024x256x1x1xbf16>) -> tensor<1024x1x1x256xbf16> loc(#loc148)
        %174 = tosa.transpose %arg5, %172 : (tensor<1x256x2x2xbf16>, tensor<4xi32>) -> tensor<1x2x2x256xbf16> loc(#loc148)
        %175 = tosa.conv2d %174, %173, %arg7 {
          PartOfLayerName = "/layer3/layer3.5/conv3/Conv",
          PartOfOutputName = "/layer3/layer3.5/conv3/Conv",
          acc_type = f32,
          dilation = array<i64: 1, 1>,
          pad = array<i64: 0, 0, 0, 0>,
          stride = array<i64: 1, 1>} : (tensor<1x2x2x256xbf16>, tensor<1024x1x1x256xbf16>, tensor<1024xbf16>) -> tensor<1x2x2x1024xbf16> loc(#loc148)
        %176 = tosa.transpose %175, %171 : (tensor<1x2x2x1024xbf16>, tensor<4xi32>) -> tensor<1x1024x2x2xbf16> loc(#loc148)
        xten_nn.output %176 : tensor<1x1024x2x2xbf16> loc(#loc148)
      } -> tensor<1x1024x2x2xbf16> loc(#loc148)
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
        %171 = tosa.add %arg5, %arg6 {LayerName = "/layer3/layer3.5/Add", OutputName = "/layer3/layer3.5/Add"} : (tensor<1x1024x2x2xbf16>, tensor<1x1024x2x2xbf16>) -> tensor<1x1024x2x2xbf16> loc(#loc149)
        %172 = tosa.clamp %171 {
          LayerName = "/layer3/layer3.5/relu_2/Relu",
          OutputName = "/layer3/layer3.5/relu_2/Relu",
          max_fp = 3.40282347E+38 : f32,
          max_int = 2147483647 : i64,
          min_fp = 0.000000e+00 : f32,
          min_int = 0 : i64} : (tensor<1x1024x2x2xbf16>) -> tensor<1x1024x2x2xbf16> loc(#loc150)
        xten_nn.output %172 : tensor<1x1024x2x2xbf16> loc(#loc150)
      } -> tensor<1x1024x2x2xbf16> loc(#loc230)
      xten_nn.output %170 : tensor<1x1024x2x2xbf16> loc(#loc230)
    } -> tensor<1x1024x2x2xbf16> loc(#loc229)
    %154 = xten_nn.subgraph (%arg1 = %153: tensor<1x1024x2x2xbf16>, %arg2 = %9: tensor<512x1024x1x1xbf16>, %arg3 = %96: tensor<512xbf16>)  attributes {
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
        %170 = "tosa.const"() <{value = dense<[0, 3, 1, 2]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc)
        %171 = "tosa.const"() <{value = dense<[0, 2, 3, 1]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc)
        %172 = tosa.reshape %arg5 {new_shape = array<i64: 512, 1, 1, 1024>} : (tensor<512x1024x1x1xbf16>) -> tensor<512x1x1x1024xbf16> loc(#loc231)
        %173 = tosa.transpose %arg4, %171 : (tensor<1x1024x2x2xbf16>, tensor<4xi32>) -> tensor<1x2x2x1024xbf16> loc(#loc231)
        %174 = tosa.conv2d %173, %172, %arg6 {
          PartOfLayerName = "/layer4/layer4.0/conv1/Conv",
          PartOfOutputName = "/layer4/layer4.0/conv1/Conv",
          acc_type = f32,
          dilation = array<i64: 1, 1>,
          pad = array<i64: 0, 0, 0, 0>,
          stride = array<i64: 1, 1>} : (tensor<1x2x2x1024xbf16>, tensor<512x1x1x1024xbf16>, tensor<512xbf16>) -> tensor<1x2x2x512xbf16> loc(#loc151)
        %175 = tosa.clamp %174 {
          LayerName = "/layer4/layer4.0/relu/Relu",
          OutputName = "/layer4/layer4.0/relu/Relu",
          max_fp = 3.40282347E+38 : f32,
          max_int = 2147483647 : i64,
          min_fp = 0.000000e+00 : f32,
          min_int = 0 : i64} : (tensor<1x2x2x512xbf16>) -> tensor<1x2x2x512xbf16> loc(#loc152)
        %176 = tosa.transpose %175, %170 : (tensor<1x2x2x512xbf16>, tensor<4xi32>) -> tensor<1x512x2x2xbf16> loc(#loc231)
        xten_nn.output %176 : tensor<1x512x2x2xbf16> loc(#loc152)
      } -> tensor<1x512x2x2xbf16> loc(#loc231)
      xten_nn.output %169 : tensor<1x512x2x2xbf16> loc(#loc231)
    } -> tensor<1x512x2x2xbf16> loc(#loc231)
    %155 = xten_nn.subgraph (%arg1 = %154: tensor<1x512x2x2xbf16>, %arg2 = %8: tensor<512x512x3x3xbf16>, %arg3 = %57: tensor<512xbf16>)  attributes {
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
        %170 = "tosa.const"() <{value = dense<[0, 2, 3, 1]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc)
        %171 = tosa.transpose %arg5, %170 : (tensor<512x512x3x3xbf16>, tensor<4xi32>) -> tensor<512x3x3x512xbf16> loc(#loc232)
        %172 = tosa.transpose %arg4, %170 : (tensor<1x512x2x2xbf16>, tensor<4xi32>) -> tensor<1x2x2x512xbf16> loc(#loc232)
        %173 = tosa.conv2d %172, %171, %arg6 {
          OutputName = "/layer4/layer4.0/conv2/Conv",
          PartOfLayerName = "/layer4/layer4.0/conv2/Conv",
          acc_type = f32,
          dilation = array<i64: 1, 1>,
          pad = array<i64: 1, 0, 1, 0>,
          stride = array<i64: 2, 2>} : (tensor<1x2x2x512xbf16>, tensor<512x3x3x512xbf16>, tensor<512xbf16>) -> tensor<1x1x1x512xbf16> loc(#loc153)
        %174 = tosa.clamp %173 {
          LayerName = "/layer4/layer4.0/relu_1/Relu",
          OutputName = "/layer4/layer4.0/relu_1/Relu",
          max_fp = 3.40282347E+38 : f32,
          max_int = 2147483647 : i64,
          min_fp = 0.000000e+00 : f32,
          min_int = 0 : i64} : (tensor<1x1x1x512xbf16>) -> tensor<1x1x1x512xbf16> loc(#loc154)
        %175 = tosa.reshape %174 {new_shape = array<i64: 1, 512, 1, 1>} : (tensor<1x1x1x512xbf16>) -> tensor<1x512x1x1xbf16> loc(#loc232)
        xten_nn.output %175 : tensor<1x512x1x1xbf16> loc(#loc154)
      } -> tensor<1x512x1x1xbf16> loc(#loc232)
      xten_nn.output %169 : tensor<1x512x1x1xbf16> loc(#loc232)
    } -> tensor<1x512x1x1xbf16> loc(#loc232)
    %156 = xten_nn.subgraph (%arg1 = %153: tensor<1x1024x2x2xbf16>, %arg2 = %6: tensor<2048x1024x1x1xbf16>, %arg3 = %94: tensor<2048xbf16>)  attributes {
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
          start = array<i64: 0, 0, 0, 0>} : (tensor<1x1024x2x2xbf16>) -> tensor<1x1024x1x1xbf16> loc(#loc155)
        %171 = tosa.reshape %arg5 {new_shape = array<i64: 2048, 1, 1, 1024>} : (tensor<2048x1024x1x1xbf16>) -> tensor<2048x1x1x1024xbf16> loc(#loc155)
        %172 = tosa.reshape %170 {new_shape = array<i64: 1, 1, 1, 1024>} : (tensor<1x1024x1x1xbf16>) -> tensor<1x1x1x1024xbf16> loc(#loc155)
        %173 = tosa.conv2d %172, %171, %arg6 {
          OutputName = "/layer4/layer4.0/downsample/downsample.0/Conv",
          PartOfLayerName = "/layer4/layer4.0/downsample/downsample.0/Conv",
          acc_type = f32,
          dilation = array<i64: 1, 1>,
          pad = array<i64: 0, 0, 0, 0>,
          stride = array<i64: 2, 2>} : (tensor<1x1x1x1024xbf16>, tensor<2048x1x1x1024xbf16>, tensor<2048xbf16>) -> tensor<1x1x1x2048xbf16> loc(#loc155)
        %174 = tosa.reshape %173 {new_shape = array<i64: 1, 2048, 1, 1>} : (tensor<1x1x1x2048xbf16>) -> tensor<1x2048x1x1xbf16> loc(#loc155)
        xten_nn.output %174 : tensor<1x2048x1x1xbf16> loc(#loc155)
      } -> tensor<1x2048x1x1xbf16> loc(#loc155)
      xten_nn.output %169 : tensor<1x2048x1x1xbf16> loc(#loc155)
    } -> tensor<1x2048x1x1xbf16> loc(#loc155)
    %157 = xten_nn.subgraph (%arg1 = %155: tensor<1x512x1x1xbf16>, %arg2 = %7: tensor<2048x512x1x1xbf16>, %arg3 = %97: tensor<2048xbf16>, %arg4 = %156: tensor<1x2048x1x1xbf16>)  attributes {
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
        %171 = tosa.reshape %arg6 {new_shape = array<i64: 2048, 1, 1, 512>} : (tensor<2048x512x1x1xbf16>) -> tensor<2048x1x1x512xbf16> loc(#loc156)
        %172 = tosa.reshape %arg5 {new_shape = array<i64: 1, 1, 1, 512>} : (tensor<1x512x1x1xbf16>) -> tensor<1x1x1x512xbf16> loc(#loc156)
        %173 = tosa.conv2d %172, %171, %arg7 {
          LayerName = "/layer4/layer4.0/conv3/Conv",
          OutputName = "/layer4/layer4.0/conv3/Conv",
          acc_type = f32,
          dilation = array<i64: 1, 1>,
          pad = array<i64: 0, 0, 0, 0>,
          stride = array<i64: 1, 1>} : (tensor<1x1x1x512xbf16>, tensor<2048x1x1x512xbf16>, tensor<2048xbf16>) -> tensor<1x1x1x2048xbf16> loc(#loc156)
        %174 = tosa.reshape %173 {new_shape = array<i64: 1, 2048, 1, 1>} : (tensor<1x1x1x2048xbf16>) -> tensor<1x2048x1x1xbf16> loc(#loc156)
        xten_nn.output %174 : tensor<1x2048x1x1xbf16> loc(#loc156)
      } -> tensor<1x2048x1x1xbf16> loc(#loc156)
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
        %171 = tosa.add %arg5, %arg6 {LayerName = "/layer4/layer4.0/Add", OutputName = "/layer4/layer4.0/Add"} : (tensor<1x2048x1x1xbf16>, tensor<1x2048x1x1xbf16>) -> tensor<1x2048x1x1xbf16> loc(#loc157)
        %172 = tosa.clamp %171 {
          LayerName = "/layer4/layer4.0/relu_2/Relu",
          OutputName = "/layer4/layer4.0/relu_2/Relu",
          max_fp = 3.40282347E+38 : f32,
          max_int = 2147483647 : i64,
          min_fp = 0.000000e+00 : f32,
          min_int = 0 : i64} : (tensor<1x2048x1x1xbf16>) -> tensor<1x2048x1x1xbf16> loc(#loc158)
        xten_nn.output %172 : tensor<1x2048x1x1xbf16> loc(#loc158)
      } -> tensor<1x2048x1x1xbf16> loc(#loc234)
      xten_nn.output %170 : tensor<1x2048x1x1xbf16> loc(#loc234)
    } -> tensor<1x2048x1x1xbf16> loc(#loc233)
    %158 = xten_nn.subgraph (%arg1 = %157: tensor<1x2048x1x1xbf16>, %arg2 = %5: tensor<512x2048x1x1xbf16>, %arg3 = %98: tensor<512xbf16>)  attributes {
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
        %170 = tosa.reshape %arg5 {new_shape = array<i64: 512, 1, 1, 2048>} : (tensor<512x2048x1x1xbf16>) -> tensor<512x1x1x2048xbf16> loc(#loc235)
        %171 = tosa.reshape %arg4 {new_shape = array<i64: 1, 1, 1, 2048>} : (tensor<1x2048x1x1xbf16>) -> tensor<1x1x1x2048xbf16> loc(#loc235)
        %172 = tosa.conv2d %171, %170, %arg6 {
          LayerName = "/layer4/layer4.1/conv1/Conv",
          OutputName = "/layer4/layer4.1/conv1/Conv",
          acc_type = f32,
          dilation = array<i64: 1, 1>,
          pad = array<i64: 0, 0, 0, 0>,
          stride = array<i64: 1, 1>} : (tensor<1x1x1x2048xbf16>, tensor<512x1x1x2048xbf16>, tensor<512xbf16>) -> tensor<1x1x1x512xbf16> loc(#loc159)
        %173 = tosa.clamp %172 {
          LayerName = "/layer4/layer4.1/relu/Relu",
          OutputName = "/layer4/layer4.1/relu/Relu",
          max_fp = 3.40282347E+38 : f32,
          max_int = 2147483647 : i64,
          min_fp = 0.000000e+00 : f32,
          min_int = 0 : i64} : (tensor<1x1x1x512xbf16>) -> tensor<1x1x1x512xbf16> loc(#loc160)
        %174 = tosa.reshape %173 {new_shape = array<i64: 1, 512, 1, 1>} : (tensor<1x1x1x512xbf16>) -> tensor<1x512x1x1xbf16> loc(#loc235)
        xten_nn.output %174 : tensor<1x512x1x1xbf16> loc(#loc160)
      } -> tensor<1x512x1x1xbf16> loc(#loc235)
      xten_nn.output %169 : tensor<1x512x1x1xbf16> loc(#loc235)
    } -> tensor<1x512x1x1xbf16> loc(#loc235)
    %159 = xten_nn.subgraph (%arg1 = %158: tensor<1x512x1x1xbf16>, %arg2 = %4: tensor<512x512x3x3xbf16>, %arg3 = %90: tensor<512xbf16>)  attributes {
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
        %170 = "tosa.const"() <{value = dense<[0, 2, 3, 1]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc)
        %171 = tosa.transpose %arg5, %170 : (tensor<512x512x3x3xbf16>, tensor<4xi32>) -> tensor<512x3x3x512xbf16> loc(#loc236)
        %172 = tosa.reshape %arg4 {new_shape = array<i64: 1, 1, 1, 512>} : (tensor<1x512x1x1xbf16>) -> tensor<1x1x1x512xbf16> loc(#loc236)
        %173 = tosa.conv2d %172, %171, %arg6 {
          OutputName = "/layer4/layer4.1/conv2/Conv",
          PartOfLayerName = "/layer4/layer4.1/conv2/Conv",
          acc_type = f32,
          dilation = array<i64: 1, 1>,
          pad = array<i64: 1, 1, 1, 1>,
          stride = array<i64: 1, 1>} : (tensor<1x1x1x512xbf16>, tensor<512x3x3x512xbf16>, tensor<512xbf16>) -> tensor<1x1x1x512xbf16> loc(#loc161)
        %174 = tosa.clamp %173 {
          LayerName = "/layer4/layer4.1/relu_1/Relu",
          OutputName = "/layer4/layer4.1/relu_1/Relu",
          max_fp = 3.40282347E+38 : f32,
          max_int = 2147483647 : i64,
          min_fp = 0.000000e+00 : f32,
          min_int = 0 : i64} : (tensor<1x1x1x512xbf16>) -> tensor<1x1x1x512xbf16> loc(#loc162)
        %175 = tosa.reshape %174 {new_shape = array<i64: 1, 512, 1, 1>} : (tensor<1x1x1x512xbf16>) -> tensor<1x512x1x1xbf16> loc(#loc236)
        xten_nn.output %175 : tensor<1x512x1x1xbf16> loc(#loc162)
      } -> tensor<1x512x1x1xbf16> loc(#loc236)
      xten_nn.output %169 : tensor<1x512x1x1xbf16> loc(#loc236)
    } -> tensor<1x512x1x1xbf16> loc(#loc236)
    %160 = xten_nn.subgraph (%arg1 = %159: tensor<1x512x1x1xbf16>, %arg2 = %3: tensor<2048x512x1x1xbf16>, %arg3 = %93: tensor<2048xbf16>, %arg4 = %157: tensor<1x2048x1x1xbf16>)  attributes {
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
        %171 = tosa.reshape %arg6 {new_shape = array<i64: 2048, 1, 1, 512>} : (tensor<2048x512x1x1xbf16>) -> tensor<2048x1x1x512xbf16> loc(#loc163)
        %172 = tosa.reshape %arg5 {new_shape = array<i64: 1, 1, 1, 512>} : (tensor<1x512x1x1xbf16>) -> tensor<1x1x1x512xbf16> loc(#loc163)
        %173 = tosa.conv2d %172, %171, %arg7 {
          LayerName = "/layer4/layer4.1/conv3/Conv",
          OutputName = "/layer4/layer4.1/conv3/Conv",
          acc_type = f32,
          dilation = array<i64: 1, 1>,
          pad = array<i64: 0, 0, 0, 0>,
          stride = array<i64: 1, 1>} : (tensor<1x1x1x512xbf16>, tensor<2048x1x1x512xbf16>, tensor<2048xbf16>) -> tensor<1x1x1x2048xbf16> loc(#loc163)
        %174 = tosa.reshape %173 {new_shape = array<i64: 1, 2048, 1, 1>} : (tensor<1x1x1x2048xbf16>) -> tensor<1x2048x1x1xbf16> loc(#loc163)
        xten_nn.output %174 : tensor<1x2048x1x1xbf16> loc(#loc163)
      } -> tensor<1x2048x1x1xbf16> loc(#loc163)
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
        %171 = tosa.add %arg5, %arg6 {LayerName = "/layer4/layer4.1/Add", OutputName = "/layer4/layer4.1/Add"} : (tensor<1x2048x1x1xbf16>, tensor<1x2048x1x1xbf16>) -> tensor<1x2048x1x1xbf16> loc(#loc164)
        %172 = tosa.clamp %171 {
          LayerName = "/layer4/layer4.1/relu_2/Relu",
          OutputName = "/layer4/layer4.1/relu_2/Relu",
          max_fp = 3.40282347E+38 : f32,
          max_int = 2147483647 : i64,
          min_fp = 0.000000e+00 : f32,
          min_int = 0 : i64} : (tensor<1x2048x1x1xbf16>) -> tensor<1x2048x1x1xbf16> loc(#loc165)
        xten_nn.output %172 : tensor<1x2048x1x1xbf16> loc(#loc165)
      } -> tensor<1x2048x1x1xbf16> loc(#loc238)
      xten_nn.output %170 : tensor<1x2048x1x1xbf16> loc(#loc238)
    } -> tensor<1x2048x1x1xbf16> loc(#loc237)
    %161 = xten_nn.subgraph (%arg1 = %160: tensor<1x2048x1x1xbf16>, %arg2 = %2: tensor<512x2048x1x1xbf16>, %arg3 = %75: tensor<512xbf16>)  attributes {
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
        %170 = tosa.reshape %arg5 {new_shape = array<i64: 512, 1, 1, 2048>} : (tensor<512x2048x1x1xbf16>) -> tensor<512x1x1x2048xbf16> loc(#loc239)
        %171 = tosa.reshape %arg4 {new_shape = array<i64: 1, 1, 1, 2048>} : (tensor<1x2048x1x1xbf16>) -> tensor<1x1x1x2048xbf16> loc(#loc239)
        %172 = tosa.conv2d %171, %170, %arg6 {
          LayerName = "/layer4/layer4.2/conv1/Conv",
          OutputName = "/layer4/layer4.2/conv1/Conv",
          acc_type = f32,
          dilation = array<i64: 1, 1>,
          pad = array<i64: 0, 0, 0, 0>,
          stride = array<i64: 1, 1>} : (tensor<1x1x1x2048xbf16>, tensor<512x1x1x2048xbf16>, tensor<512xbf16>) -> tensor<1x1x1x512xbf16> loc(#loc166)
        %173 = tosa.clamp %172 {
          LayerName = "/layer4/layer4.2/relu/Relu",
          OutputName = "/layer4/layer4.2/relu/Relu",
          max_fp = 3.40282347E+38 : f32,
          max_int = 2147483647 : i64,
          min_fp = 0.000000e+00 : f32,
          min_int = 0 : i64} : (tensor<1x1x1x512xbf16>) -> tensor<1x1x1x512xbf16> loc(#loc167)
        %174 = tosa.reshape %173 {new_shape = array<i64: 1, 512, 1, 1>} : (tensor<1x1x1x512xbf16>) -> tensor<1x512x1x1xbf16> loc(#loc239)
        xten_nn.output %174 : tensor<1x512x1x1xbf16> loc(#loc167)
      } -> tensor<1x512x1x1xbf16> loc(#loc239)
      xten_nn.output %169 : tensor<1x512x1x1xbf16> loc(#loc239)
    } -> tensor<1x512x1x1xbf16> loc(#loc239)
    %162 = xten_nn.subgraph (%arg1 = %161: tensor<1x512x1x1xbf16>, %arg2 = %1: tensor<512x512x3x3xbf16>, %arg3 = %61: tensor<512xbf16>)  attributes {
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
        %170 = "tosa.const"() <{value = dense<[0, 2, 3, 1]> : tensor<4xi32>}> : () -> tensor<4xi32> loc(#loc)
        %171 = tosa.transpose %arg5, %170 : (tensor<512x512x3x3xbf16>, tensor<4xi32>) -> tensor<512x3x3x512xbf16> loc(#loc240)
        %172 = tosa.reshape %arg4 {new_shape = array<i64: 1, 1, 1, 512>} : (tensor<1x512x1x1xbf16>) -> tensor<1x1x1x512xbf16> loc(#loc240)
        %173 = tosa.conv2d %172, %171, %arg6 {
          OutputName = "/layer4/layer4.2/conv2/Conv",
          PartOfLayerName = "/layer4/layer4.2/conv2/Conv",
          acc_type = f32,
          dilation = array<i64: 1, 1>,
          pad = array<i64: 1, 1, 1, 1>,
          stride = array<i64: 1, 1>} : (tensor<1x1x1x512xbf16>, tensor<512x3x3x512xbf16>, tensor<512xbf16>) -> tensor<1x1x1x512xbf16> loc(#loc168)
        %174 = tosa.clamp %173 {
          LayerName = "/layer4/layer4.2/relu_1/Relu",
          OutputName = "/layer4/layer4.2/relu_1/Relu",
          max_fp = 3.40282347E+38 : f32,
          max_int = 2147483647 : i64,
          min_fp = 0.000000e+00 : f32,
          min_int = 0 : i64} : (tensor<1x1x1x512xbf16>) -> tensor<1x1x1x512xbf16> loc(#loc169)
        %175 = tosa.reshape %174 {new_shape = array<i64: 1, 512, 1, 1>} : (tensor<1x1x1x512xbf16>) -> tensor<1x512x1x1xbf16> loc(#loc240)
        xten_nn.output %175 : tensor<1x512x1x1xbf16> loc(#loc169)
      } -> tensor<1x512x1x1xbf16> loc(#loc240)
      xten_nn.output %169 : tensor<1x512x1x1xbf16> loc(#loc240)
    } -> tensor<1x512x1x1xbf16> loc(#loc240)
    %163 = xten_nn.subgraph (%arg1 = %162: tensor<1x512x1x1xbf16>, %arg2 = %0: tensor<2048x512x1x1xbf16>, %arg3 = %87: tensor<2048xbf16>, %arg4 = %160: tensor<1x2048x1x1xbf16>)  attributes {
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
        %171 = tosa.reshape %arg6 {new_shape = array<i64: 2048, 1, 1, 512>} : (tensor<2048x512x1x1xbf16>) -> tensor<2048x1x1x512xbf16> loc(#loc170)
        %172 = tosa.reshape %arg5 {new_shape = array<i64: 1, 1, 1, 512>} : (tensor<1x512x1x1xbf16>) -> tensor<1x1x1x512xbf16> loc(#loc170)
        %173 = tosa.conv2d %172, %171, %arg7 {
          LayerName = "/layer4/layer4.2/conv3/Conv",
          OutputName = "/layer4/layer4.2/conv3/Conv",
          acc_type = f32,
          dilation = array<i64: 1, 1>,
          pad = array<i64: 0, 0, 0, 0>,
          stride = array<i64: 1, 1>} : (tensor<1x1x1x512xbf16>, tensor<2048x1x1x512xbf16>, tensor<2048xbf16>) -> tensor<1x1x1x2048xbf16> loc(#loc170)
        %174 = tosa.reshape %173 {new_shape = array<i64: 1, 2048, 1, 1>} : (tensor<1x1x1x2048xbf16>) -> tensor<1x2048x1x1xbf16> loc(#loc170)
        xten_nn.output %174 : tensor<1x2048x1x1xbf16> loc(#loc170)
      } -> tensor<1x2048x1x1xbf16> loc(#loc170)
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
        %171 = tosa.add %arg5, %arg6 {LayerName = "/layer4/layer4.2/Add", OutputName = "/layer4/layer4.2/Add"} : (tensor<1x2048x1x1xbf16>, tensor<1x2048x1x1xbf16>) -> tensor<1x2048x1x1xbf16> loc(#loc171)
        %172 = tosa.clamp %171 {
          LayerName = "/layer4/layer4.2/relu_2/Relu",
          OutputName = "/layer4/layer4.2/relu_2/Relu",
          max_fp = 3.40282347E+38 : f32,
          max_int = 2147483647 : i64,
          min_fp = 0.000000e+00 : f32,
          min_int = 0 : i64} : (tensor<1x2048x1x1xbf16>) -> tensor<1x2048x1x1xbf16> loc(#loc172)
        xten_nn.output %172 : tensor<1x2048x1x1xbf16> loc(#loc172)
      } -> tensor<1x2048x1x1xbf16> loc(#loc242)
      xten_nn.output %170 : tensor<1x2048x1x1xbf16> loc(#loc242)
    } -> tensor<1x2048x1x1xbf16> loc(#loc241)
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
        %170 = xten_nn.reduce_mean %arg2 {axes = array<i64: 3>, keepdims = 1 : i64} : (tensor<1x2048x1x1xbf16>) -> tensor<1x2048x1x1xbf16> loc(#loc173)
        xten_nn.output %170 : tensor<1x2048x1x1xbf16> loc(#loc173)
      } -> tensor<1x2048x1x1xbf16> loc(#loc173)
      xten_nn.output %169 : tensor<1x2048x1x1xbf16> loc(#loc173)
    } -> tensor<1x2048x1x1xbf16> loc(#loc173)
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
      %169 = tosa.reshape %arg1 {new_shape = array<i64: 1, 1, 2048>} : (tensor<1x2048x1x1xbf16>) -> tensor<1x1x2048xbf16> loc(#loc243)
      xten_nn.output %169 : tensor<1x1x2048xbf16> loc(#loc243)
    } -> tensor<1x1x2048xbf16> loc(#loc243)
    %166 = xten_nn.subgraph (%arg1 = %165: tensor<1x1x2048xbf16>, %arg2 = %53: tensor<1x2048x64xbf16>, %arg3 = %55: tensor<1x1x64xbf16>)  attributes {
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
        %171 = tosa.matmul %arg4, %arg5 {PartOfLayerName = "/fc/fc.0/Gemm"} : (tensor<1x1x2048xbf16>, tensor<1x2048x64xbf16>) -> tensor<1x1x64xf32> loc(#loc175)
        %172 = tosa.cast %171 : (tensor<1x1x64xf32>) -> tensor<1x1x64xbf16> loc(#loc175)
        %173 = tosa.add %172, %arg6 {OutputName = "/fc/fc.0/Gemm", PartOfLayerName = "/fc/fc.0/Gemm"} : (tensor<1x1x64xbf16>, tensor<1x1x64xbf16>) -> tensor<1x1x64xbf16> loc(#loc175)
        xten_nn.output %173 : tensor<1x1x64xbf16> loc(#loc175)
      } -> tensor<1x1x64xbf16> loc(#loc175)
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
          min_int = 0 : i64} : (tensor<1x1x64xbf16>) -> tensor<1x1x64xbf16> loc(#loc176)
        xten_nn.output %171 : tensor<1x1x64xbf16> loc(#loc176)
      } -> tensor<1x1x64xbf16> loc(#loc176)
      xten_nn.output %170 : tensor<1x1x64xbf16> loc(#loc176)
    } -> tensor<1x1x64xbf16> loc(#loc244)
    %167 = xten_nn.subgraph (%arg1 = %166: tensor<1x1x64xbf16>, %arg2 = %52: tensor<1x64x10xbf16>, %arg3 = %54: tensor<1x1x10xbf16>)  attributes {
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
        %170 = tosa.matmul %arg4, %arg5 {PartOfLayerName = "/fc/fc.2/Gemm"} : (tensor<1x1x64xbf16>, tensor<1x64x10xbf16>) -> tensor<1x1x10xf32> loc(#loc177)
        %171 = tosa.cast %170 : (tensor<1x1x10xf32>) -> tensor<1x1x10xbf16> loc(#loc177)
        %172 = tosa.add %171, %arg6 {OutputName = "/fc/fc.2/Gemm", PartOfLayerName = "/fc/fc.2/Gemm"} : (tensor<1x1x10xbf16>, tensor<1x1x10xbf16>) -> tensor<1x1x10xbf16> loc(#loc177)
        xten_nn.output %172 : tensor<1x1x10xbf16> loc(#loc177)
      } -> tensor<1x1x10xbf16> loc(#loc177)
      xten_nn.output %169 : tensor<1x1x10xbf16> loc(#loc177)
    } -> tensor<1x1x10xbf16> loc(#loc177)
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
      %169 = tosa.reshape %arg1 {new_shape = array<i64: 1, 10>} : (tensor<1x1x10xbf16>) -> tensor<1x10xbf16> loc(#loc177)
      xten_nn.output %169 : tensor<1x10xbf16> loc(#loc177)
    } -> tensor<1x10xbf16> loc(#loc177)
    return %168 : tensor<1x10xbf16> loc(#loc)
  } loc(#loc)
} loc(#loc)
#loc1 = loc("Initializer_onnx::Conv_577")
#loc2 = loc("Initializer_onnx::Conv_634")
#loc3 = loc("Initializer_onnx::Conv_592")
#loc4 = loc("Initializer_onnx::Conv_547")
#loc5 = loc("Initializer_onnx::Conv_568")
#loc6 = loc("Initializer_onnx::Conv_655")
#loc7 = loc("Initializer_onnx::Conv_565")
#loc8 = loc("Initializer_onnx::Conv_580")
#loc9 = loc("Initializer_onnx::Conv_520")
#loc10 = loc("Initializer_onnx::Conv_556")
#loc11 = loc("Initializer_onnx::Conv_616")
#loc12 = loc("Initializer_onnx::Conv_562")
#loc13 = loc("Initializer_onnx::Conv_589")
#loc14 = loc("Initializer_onnx::Conv_559")
#loc15 = loc("Initializer_onnx::Conv_541")
#loc16 = loc("Initializer_onnx::Conv_598")
#loc17 = loc("Initializer_onnx::Conv_544")
#loc18 = loc("Initializer_onnx::Conv_574")
#loc19 = loc("Initializer_onnx::Conv_508")
#loc20 = loc("Initializer_onnx::Conv_652")
#loc21 = loc("Initializer_onnx::Conv_583")
#loc22 = loc("Initializer_onnx::Conv_523")
#loc23 = loc("Initializer_onnx::Conv_532")
#loc24 = loc("Initializer_onnx::Conv_595")
#loc25 = loc("Initializer_onnx::Conv_529")
#loc26 = loc("Initializer_onnx::Conv_550")
#loc27 = loc("Initializer_onnx::Conv_553")
#loc28 = loc("Initializer_onnx::Conv_586")
#loc29 = loc("Initializer_onnx::Conv_538")
#loc30 = loc("Initializer_onnx::Conv_535")
#loc31 = loc("Initializer_onnx::Conv_604")
#loc32 = loc("Initializer_onnx::Conv_658")
#loc33 = loc("Initializer_onnx::Conv_607")
#loc34 = loc("Initializer_onnx::Conv_610")
#loc35 = loc("Initializer_onnx::Conv_646")
#loc36 = loc("Initializer_onnx::Conv_601")
#loc37 = loc("Initializer_onnx::Conv_613")
#loc38 = loc("Initializer_onnx::Conv_649")
#loc39 = loc("Initializer_onnx::Conv_640")
#loc40 = loc("Initializer_onnx::Conv_622")
#loc41 = loc("Initializer_onnx::Conv_631")
#loc42 = loc("Initializer_onnx::Conv_637")
#loc43 = loc("Initializer_onnx::Conv_643")
#loc44 = loc("Initializer_onnx::Conv_625")
#loc45 = loc("Initializer_onnx::Conv_517")
#loc46 = loc("Initializer_onnx::Conv_628")
#loc47 = loc("Initializer_onnx::Conv_571")
#loc48 = loc("Initializer_onnx::Conv_619")
#loc49 = loc("Initializer_onnx::Conv_505")
#loc50 = loc("Initializer_onnx::Conv_502")
#loc51 = loc("Initializer_onnx::Conv_514")
#loc52 = loc("Initializer_onnx::Conv_526")
#loc53 = loc("Initializer_onnx::Conv_511")
#loc54 = loc("/conv1/Conv")
#loc55 = loc("/relu/Relu")
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
#loc178 = loc(fused[#loc54, #loc55])
#loc179 = loc(fused[#loc57, #loc58])
#loc180 = loc(fused[#loc59, #loc60])
#loc181 = loc(fused[#loc62, #loc63, #loc64])
#loc182 = loc(fused[#loc63, #loc64])
#loc183 = loc(fused[#loc65, #loc66])
#loc184 = loc(fused[#loc67, #loc68])
#loc185 = loc(fused[#loc69, #loc70, #loc71])
#loc186 = loc(fused[#loc70, #loc71])
#loc187 = loc(fused[#loc72, #loc73])
#loc188 = loc(fused[#loc74, #loc75])
#loc189 = loc(fused[#loc76, #loc77, #loc78])
#loc190 = loc(fused[#loc77, #loc78])
#loc191 = loc(fused[#loc79, #loc80])
#loc192 = loc(fused[#loc81, #loc82])
#loc193 = loc(fused[#loc84, #loc85, #loc86])
#loc194 = loc(fused[#loc85, #loc86])
#loc195 = loc(fused[#loc87, #loc88])
#loc196 = loc(fused[#loc89, #loc90])
#loc197 = loc(fused[#loc91, #loc92, #loc93])
#loc198 = loc(fused[#loc92, #loc93])
#loc199 = loc(fused[#loc94, #loc95])
#loc200 = loc(fused[#loc96, #loc97])
#loc201 = loc(fused[#loc98, #loc99, #loc100])
#loc202 = loc(fused[#loc99, #loc100])
#loc203 = loc(fused[#loc101, #loc102])
#loc204 = loc(fused[#loc103, #loc104])
#loc205 = loc(fused[#loc105, #loc106, #loc107])
#loc206 = loc(fused[#loc106, #loc107])
#loc207 = loc(fused[#loc108, #loc109])
#loc208 = loc(fused[#loc110, #loc111])
#loc209 = loc(fused[#loc113, #loc114, #loc115])
#loc210 = loc(fused[#loc114, #loc115])
#loc211 = loc(fused[#loc116, #loc117])
#loc212 = loc(fused[#loc118, #loc119])
#loc213 = loc(fused[#loc120, #loc121, #loc122])
#loc214 = loc(fused[#loc121, #loc122])
#loc215 = loc(fused[#loc123, #loc124])
#loc216 = loc(fused[#loc125, #loc126])
#loc217 = loc(fused[#loc127, #loc128, #loc129])
#loc218 = loc(fused[#loc128, #loc129])
#loc219 = loc(fused[#loc130, #loc131])
#loc220 = loc(fused[#loc132, #loc133])
#loc221 = loc(fused[#loc134, #loc135, #loc136])
#loc222 = loc(fused[#loc135, #loc136])
#loc223 = loc(fused[#loc137, #loc138])
#loc224 = loc(fused[#loc139, #loc140])
#loc225 = loc(fused[#loc141, #loc142, #loc143])
#loc226 = loc(fused[#loc142, #loc143])
#loc227 = loc(fused[#loc144, #loc145])
#loc228 = loc(fused[#loc146, #loc147])
#loc229 = loc(fused[#loc148, #loc149, #loc150])
#loc230 = loc(fused[#loc149, #loc150])
#loc231 = loc(fused[#loc151, #loc152])
#loc232 = loc(fused[#loc153, #loc154])
#loc233 = loc(fused[#loc156, #loc157, #loc158])
#loc234 = loc(fused[#loc157, #loc158])
#loc235 = loc(fused[#loc159, #loc160])
#loc236 = loc(fused[#loc161, #loc162])
#loc237 = loc(fused[#loc163, #loc164, #loc165])
#loc238 = loc(fused[#loc164, #loc165])
#loc239 = loc(fused[#loc166, #loc167])
#loc240 = loc(fused[#loc168, #loc169])
#loc241 = loc(fused[#loc170, #loc171, #loc172])
#loc242 = loc(fused[#loc171, #loc172])
#loc243 = loc(fused[#loc173, #loc174, #loc175])
#loc244 = loc(fused[#loc175, #loc176])
