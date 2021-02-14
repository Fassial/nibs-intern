# Amira Script
remove -all
remove physics.icol brain.surf 190117_3_reg.am 190117_5_reg.am 190117_VTA_candidate1_reg.am 190117_hyx_01_reg.am 190117_hyx_02_reg.am 190117_hyx_04_reg.am 190117_pab_1_reg.am 190117_yzw_01_adjusted_reg.am 190117_yzw_05_reg.am 190117_yzw_07_2_reg.am 190117_yzw_candidate2_reg.am 194160_20200425_ipsilateral_BLA_01_reg.am 194160_20200508_ventral_02_reg.am 194160_20200508_ventral_03_reg.am 194160_BLA_01_reg.am 194160_BLA_02_reg.am 194160_CIBR_01_reg.am 194160_CIBR_04_reg.am 194160_CIBR_05_reg.am 194160_CIBR_06_reg.am 194161_20200430_CLA_reg.am 194161_20200501_right_ventral_layer2_reg.am 194161_20200522_BLA_right_layer2_reg.am 194161_20200526_right_layer2_anterior_reg.am 194161_BLA_01_merge_reg.am 194161_TH_001_reg.am 194161_right_wgl_003_02_reg.am 194161_yzw20200420_left_03_reg.am 194161_yzw20200421_right_02_reg.am 194161_yzw20200421_right_BLA_01_reg.am 194161_yzw20200421_right_BLA_01_related_03_reg.am 194161_yzw20200519_MS_01_reg.am 194161_yzw20200528_left_layer3_reg.am 194161_yzw20200603_right_ventral_01_reg.am 200002_20200623_left_01_reg.am 200003_20200602_right_layer6_reg.am 200003_20200609_OFC_reg.am 200003_20200609_left_03_reg.am 200003_20200614_01_reg.am 200003_20200618_right_01_reg.am CameraPath.civ moive.amov SurfaceView Light-Back Light-Front Light-Top Light-Bottom Light-Right Light-Left Class1.1-190117_3_reg Class1.1-190117_5_reg Class1.1-190117_hyx_04_reg Class1.1-190117_pab_1_reg Class1.1-190117_VTA_candidate1_reg Class1.1-190117_yzw_07_2_reg Class1.1-194160_20200508_ventral_02_reg Class1.1-194160_20200508_ventral_03_reg Class1.1-194160_CIBR_01_reg Class1.1-194160_CIBR_04_reg Class1.1-194160_CIBR_05_reg Class1.1-194160_CIBR_06_reg Class1.1-194161_20200501_right_ventral_layer2_reg Class1.1-194161_right_wgl_003_02_reg Class1.1-194161_TH_001_reg Class1.1-194161_yzw20200421_right_02_reg Class1.1-194161_yzw20200421_right_BLA_01_related_03_reg Class1.1-194161_yzw20200603_right_ventral_01_reg Class1.1-200002_20200623_left_01_reg Class1.1-200003_20200609_left_03_reg Class1.1-200003_20200614_01_reg Class1.1-200003_20200618_right_01_reg Class1.2-194160_20200425_ipsilateral_BLA_01_reg Class1.2-194160_BLA_01_reg Class1.2-194161_BLA_01_merge_reg Class1.2-194161_yzw20200421_right_BLA_01_reg Class1.3-194161_20200526_right_layer2_anterior_reg Class2-190117_yzw_01_adjusted_reg Class1.2-194161_20200522_BLA_right_layer2_reg Class2-194161_yzw20200420_left_03_reg Class2-194161_yzw20200519_MS_01_reg Class2-200003_20200602_right_layer6_reg Class3-190117_hyx_01_reg Class3-190117_hyx_02_reg Class3-190117_yzw_05_reg Class3-190117_yzw_candidate2_reg Class3-194160_BLA_02_reg Class3-194161_20200430_CLA_reg Class3-194161_yzw20200528_left_layer3_reg Class3-200003_20200609_OFC_reg MovieMaker

# Create viewers
viewer setVertical 0

viewer 0 setBackgroundMode 0
viewer 0 setBackgroundColor 0 0 0
viewer 0 setBackgroundColor2 0.0133333 0.0133333 0.0133333
viewer 0 setTransparencyType 5
viewer 0 setAutoRedraw 0
viewer 0 show
mainWindow show

set hideNewModules 1
[ load ${AMIRA_ROOT}/data/colormaps/physics.icol ] setLabel physics.icol
physics.icol setIconPosition 0 0
physics.icol setNoRemoveAll 1
physics.icol fire
{physics.icol} setMinMax 0 1
physics.icol flags setValue 1
physics.icol shift setMinMax -1 1
physics.icol shift setButtons 0
physics.icol shift setIncrement 0.133333
physics.icol shift setValue 0
physics.icol shift setSubMinMax -1 1
physics.icol scale setMinMax 0 1
physics.icol scale setButtons 0
physics.icol scale setIncrement 0.1
physics.icol scale setValue 1
physics.icol scale setSubMinMax 0 1
physics.icol fire
physics.icol setViewerMask 16383

set hideNewModules 0
[ load ${SCRIPTDIR}/brain.surf ] setLabel brain.surf
brain.surf setIconPosition 20 1866
brain.surf fire
brain.surf LevelOfDetail setMinMax -1 -1
brain.surf LevelOfDetail setButtons 1
brain.surf LevelOfDetail setIncrement 1
brain.surf LevelOfDetail setValue -1
brain.surf LevelOfDetail setSubMinMax -1 -1
brain.surf fire
brain.surf setViewerMask 16383

set hideNewModules 0
[ load ${SCRIPTDIR}/../data/am/190117_3_reg.am ] setLabel 190117_3_reg.am
190117_3_reg.am setIconPosition 20 1896
190117_3_reg.am fire
190117_3_reg.am setViewerMask 16383

set hideNewModules 0
[ load ${SCRIPTDIR}/../data/am/190117_5_reg.am ] setLabel 190117_5_reg.am
190117_5_reg.am setIconPosition 20 1926
190117_5_reg.am fire
190117_5_reg.am setViewerMask 16383

set hideNewModules 0
[ load ${SCRIPTDIR}/../data/am/190117_VTA_candidate1_reg.am ] setLabel 190117_VTA_candidate1_reg.am
190117_VTA_candidate1_reg.am setIconPosition 20 2016
190117_VTA_candidate1_reg.am fire
190117_VTA_candidate1_reg.am setViewerMask 16383

set hideNewModules 0
[ load ${SCRIPTDIR}/../data/am/190117_hyx_01_reg.am ] setLabel 190117_hyx_01_reg.am
190117_hyx_01_reg.am setIconPosition 20 2856
190117_hyx_01_reg.am fire
190117_hyx_01_reg.am setViewerMask 16383

set hideNewModules 0
[ load ${SCRIPTDIR}/../data/am/190117_hyx_02_reg.am ] setLabel 190117_hyx_02_reg.am
190117_hyx_02_reg.am setIconPosition 20 2886
190117_hyx_02_reg.am fire
190117_hyx_02_reg.am setViewerMask 16383

set hideNewModules 0
[ load ${SCRIPTDIR}/../data/am/190117_hyx_04_reg.am ] setLabel 190117_hyx_04_reg.am
190117_hyx_04_reg.am setIconPosition 20 1956
190117_hyx_04_reg.am fire
190117_hyx_04_reg.am setViewerMask 16383

set hideNewModules 0
[ load ${SCRIPTDIR}/../data/am/190117_pab_1_reg.am ] setLabel 190117_pab_1_reg.am
190117_pab_1_reg.am setIconPosition 20 1986
190117_pab_1_reg.am fire
190117_pab_1_reg.am setViewerMask 16383

set hideNewModules 0
[ load ${SCRIPTDIR}/../data/am/190117_yzw_01_adjusted_reg.am ] setLabel 190117_yzw_01_adjusted_reg.am
190117_yzw_01_adjusted_reg.am setIconPosition 20 2736
190117_yzw_01_adjusted_reg.am fire
190117_yzw_01_adjusted_reg.am setViewerMask 16383

set hideNewModules 0
[ load ${SCRIPTDIR}/../data/am/190117_yzw_05_reg.am ] setLabel 190117_yzw_05_reg.am
190117_yzw_05_reg.am setIconPosition 20 2916
190117_yzw_05_reg.am fire
190117_yzw_05_reg.am setViewerMask 16383

set hideNewModules 0
[ load ${SCRIPTDIR}/../data/am/190117_yzw_07_2_reg.am ] setLabel 190117_yzw_07_2_reg.am
190117_yzw_07_2_reg.am setIconPosition 20 2046
190117_yzw_07_2_reg.am fire
190117_yzw_07_2_reg.am setViewerMask 16383

set hideNewModules 0
[ load ${SCRIPTDIR}/../data/am/190117_yzw_candidate2_reg.am ] setLabel 190117_yzw_candidate2_reg.am
190117_yzw_candidate2_reg.am setIconPosition 20 2946
190117_yzw_candidate2_reg.am fire
190117_yzw_candidate2_reg.am setViewerMask 16383

set hideNewModules 0
[ load ${SCRIPTDIR}/../data/am/194160_20200425_ipsilateral_BLA_01_reg.am ] setLabel 194160_20200425_ipsilateral_BLA_01_reg.am
194160_20200425_ipsilateral_BLA_01_reg.am setIconPosition 20 2556
194160_20200425_ipsilateral_BLA_01_reg.am fire
194160_20200425_ipsilateral_BLA_01_reg.am setViewerMask 16383

set hideNewModules 0
[ load ${SCRIPTDIR}/../data/am/194160_20200508_ventral_02_reg.am ] setLabel 194160_20200508_ventral_02_reg.am
194160_20200508_ventral_02_reg.am setIconPosition 20 2076
194160_20200508_ventral_02_reg.am fire
194160_20200508_ventral_02_reg.am setViewerMask 16383

set hideNewModules 0
[ load ${SCRIPTDIR}/../data/am/194160_20200508_ventral_03_reg.am ] setLabel 194160_20200508_ventral_03_reg.am
194160_20200508_ventral_03_reg.am setIconPosition 20 2106
194160_20200508_ventral_03_reg.am fire
194160_20200508_ventral_03_reg.am setViewerMask 16383

set hideNewModules 0
[ load ${SCRIPTDIR}/../data/am/194160_BLA_01_reg.am ] setLabel 194160_BLA_01_reg.am
194160_BLA_01_reg.am setIconPosition 20 2586
194160_BLA_01_reg.am fire
194160_BLA_01_reg.am setViewerMask 16383

set hideNewModules 0
[ load ${SCRIPTDIR}/../data/am/194160_BLA_02_reg.am ] setLabel 194160_BLA_02_reg.am
194160_BLA_02_reg.am setIconPosition 20 2976
194160_BLA_02_reg.am fire
194160_BLA_02_reg.am setViewerMask 16383

set hideNewModules 0
[ load ${SCRIPTDIR}/../data/am/194160_CIBR_01_reg.am ] setLabel 194160_CIBR_01_reg.am
194160_CIBR_01_reg.am setIconPosition 20 2136
194160_CIBR_01_reg.am fire
194160_CIBR_01_reg.am setViewerMask 16383

set hideNewModules 0
[ load ${SCRIPTDIR}/../data/am/194160_CIBR_04_reg.am ] setLabel 194160_CIBR_04_reg.am
194160_CIBR_04_reg.am setIconPosition 20 2166
194160_CIBR_04_reg.am fire
194160_CIBR_04_reg.am setViewerMask 16383

set hideNewModules 0
[ load ${SCRIPTDIR}/../data/am/194160_CIBR_05_reg.am ] setLabel 194160_CIBR_05_reg.am
194160_CIBR_05_reg.am setIconPosition 20 2196
194160_CIBR_05_reg.am fire
194160_CIBR_05_reg.am setViewerMask 16383

set hideNewModules 0
[ load ${SCRIPTDIR}/../data/am/194160_CIBR_06_reg.am ] setLabel 194160_CIBR_06_reg.am
194160_CIBR_06_reg.am setIconPosition 20 2226
194160_CIBR_06_reg.am fire
194160_CIBR_06_reg.am setViewerMask 16383

set hideNewModules 0
[ load ${SCRIPTDIR}/../data/am/194161_20200430_CLA_reg.am ] setLabel 194161_20200430_CLA_reg.am
194161_20200430_CLA_reg.am setIconPosition 20 3006
194161_20200430_CLA_reg.am fire
194161_20200430_CLA_reg.am setViewerMask 16383

set hideNewModules 0
[ load ${SCRIPTDIR}/../data/am/194161_20200501_right_ventral_layer2_reg.am ] setLabel 194161_20200501_right_ventral_layer2_reg.am
194161_20200501_right_ventral_layer2_reg.am setIconPosition 20 2256
194161_20200501_right_ventral_layer2_reg.am fire
194161_20200501_right_ventral_layer2_reg.am setViewerMask 16383

set hideNewModules 0
[ load ${SCRIPTDIR}/../data/am/194161_20200522_BLA_right_layer2_reg.am ] setLabel 194161_20200522_BLA_right_layer2_reg.am
194161_20200522_BLA_right_layer2_reg.am setIconPosition 20 2616
194161_20200522_BLA_right_layer2_reg.am fire
194161_20200522_BLA_right_layer2_reg.am setViewerMask 16383

set hideNewModules 0
[ load ${SCRIPTDIR}/../data/am/194161_20200526_right_layer2_anterior_reg.am ] setLabel 194161_20200526_right_layer2_anterior_reg.am
194161_20200526_right_layer2_anterior_reg.am setIconPosition 20 2706
194161_20200526_right_layer2_anterior_reg.am fire
194161_20200526_right_layer2_anterior_reg.am setViewerMask 16383

set hideNewModules 0
[ load ${SCRIPTDIR}/../data/am/194161_BLA_01_merge_reg.am ] setLabel 194161_BLA_01_merge_reg.am
194161_BLA_01_merge_reg.am setIconPosition 20 2646
194161_BLA_01_merge_reg.am fire
194161_BLA_01_merge_reg.am setViewerMask 16383

set hideNewModules 0
[ load ${SCRIPTDIR}/../data/am/194161_TH_001_reg.am ] setLabel 194161_TH_001_reg.am
194161_TH_001_reg.am setIconPosition 20 2316
194161_TH_001_reg.am fire
194161_TH_001_reg.am setViewerMask 16383

set hideNewModules 0
[ load ${SCRIPTDIR}/../data/am/194161_right_wgl_003_02_reg.am ] setLabel 194161_right_wgl_003_02_reg.am
194161_right_wgl_003_02_reg.am setIconPosition 20 2286
194161_right_wgl_003_02_reg.am fire
194161_right_wgl_003_02_reg.am setViewerMask 16383

set hideNewModules 0
[ load ${SCRIPTDIR}/../data/am/194161_yzw20200420_left_03_reg.am ] setLabel 194161_yzw20200420_left_03_reg.am
194161_yzw20200420_left_03_reg.am setIconPosition 20 2766
194161_yzw20200420_left_03_reg.am fire
194161_yzw20200420_left_03_reg.am setViewerMask 16383

set hideNewModules 0
[ load ${SCRIPTDIR}/../data/am/194161_yzw20200421_right_02_reg.am ] setLabel 194161_yzw20200421_right_02_reg.am
194161_yzw20200421_right_02_reg.am setIconPosition 20 2346
194161_yzw20200421_right_02_reg.am fire
194161_yzw20200421_right_02_reg.am setViewerMask 16383

set hideNewModules 0
[ load ${SCRIPTDIR}/../data/am/194161_yzw20200421_right_BLA_01_reg.am ] setLabel 194161_yzw20200421_right_BLA_01_reg.am
194161_yzw20200421_right_BLA_01_reg.am setIconPosition 20 2676
194161_yzw20200421_right_BLA_01_reg.am fire
194161_yzw20200421_right_BLA_01_reg.am setViewerMask 16383

set hideNewModules 0
[ load ${SCRIPTDIR}/../data/am/194161_yzw20200421_right_BLA_01_related_03_reg.am ] setLabel 194161_yzw20200421_right_BLA_01_related_03_reg.am
194161_yzw20200421_right_BLA_01_related_03_reg.am setIconPosition 20 2376
194161_yzw20200421_right_BLA_01_related_03_reg.am fire
194161_yzw20200421_right_BLA_01_related_03_reg.am setViewerMask 16383

set hideNewModules 0
[ load ${SCRIPTDIR}/../data/am/194161_yzw20200519_MS_01_reg.am ] setLabel 194161_yzw20200519_MS_01_reg.am
194161_yzw20200519_MS_01_reg.am setIconPosition 20 2796
194161_yzw20200519_MS_01_reg.am fire
194161_yzw20200519_MS_01_reg.am setViewerMask 16383

set hideNewModules 0
[ load ${SCRIPTDIR}/../data/am/194161_yzw20200528_left_layer3_reg.am ] setLabel 194161_yzw20200528_left_layer3_reg.am
194161_yzw20200528_left_layer3_reg.am setIconPosition 20 3036
194161_yzw20200528_left_layer3_reg.am fire
194161_yzw20200528_left_layer3_reg.am setViewerMask 16383

set hideNewModules 0
[ load ${SCRIPTDIR}/../data/am/194161_yzw20200603_right_ventral_01_reg.am ] setLabel 194161_yzw20200603_right_ventral_01_reg.am
194161_yzw20200603_right_ventral_01_reg.am setIconPosition 20 2406
194161_yzw20200603_right_ventral_01_reg.am fire
194161_yzw20200603_right_ventral_01_reg.am setViewerMask 16383

set hideNewModules 0
[ load ${SCRIPTDIR}/../data/am/200002_20200623_left_01_reg.am ] setLabel 200002_20200623_left_01_reg.am
200002_20200623_left_01_reg.am setIconPosition 20 2436
200002_20200623_left_01_reg.am fire
200002_20200623_left_01_reg.am setViewerMask 16383

set hideNewModules 0
[ load ${SCRIPTDIR}/../data/am/200003_20200602_right_layer6_reg.am ] setLabel 200003_20200602_right_layer6_reg.am
200003_20200602_right_layer6_reg.am setIconPosition 20 2826
200003_20200602_right_layer6_reg.am fire
200003_20200602_right_layer6_reg.am setViewerMask 16383

set hideNewModules 0
[ load ${SCRIPTDIR}/../data/am/200003_20200609_OFC_reg.am ] setLabel 200003_20200609_OFC_reg.am
200003_20200609_OFC_reg.am setIconPosition 20 3066
200003_20200609_OFC_reg.am fire
200003_20200609_OFC_reg.am setViewerMask 16383

set hideNewModules 0
[ load ${SCRIPTDIR}/../data/am/200003_20200609_left_03_reg.am ] setLabel 200003_20200609_left_03_reg.am
200003_20200609_left_03_reg.am setIconPosition 20 2466
200003_20200609_left_03_reg.am fire
200003_20200609_left_03_reg.am setViewerMask 16383

set hideNewModules 0
[ load ${SCRIPTDIR}/../data/am/200003_20200614_01_reg.am ] setLabel 200003_20200614_01_reg.am
200003_20200614_01_reg.am setIconPosition 20 2496
200003_20200614_01_reg.am fire
200003_20200614_01_reg.am setViewerMask 16383

set hideNewModules 0
[ load ${SCRIPTDIR}/../data/am/200003_20200618_right_01_reg.am ] setLabel 200003_20200618_right_01_reg.am
200003_20200618_right_01_reg.am setIconPosition 20 2526
200003_20200618_right_01_reg.am fire
200003_20200618_right_01_reg.am setViewerMask 16383

set hideNewModules 0
[ load ${SCRIPTDIR}/CameraPath.civ ] setLabel CameraPath.civ
CameraPath.civ setIconPosition 20 3096
CameraPath.civ time setMinMax 0 109.416
CameraPath.civ time setSubMinMax 0 109.416
CameraPath.civ time setValue 109.416
CameraPath.civ time setDiscrete 0
CameraPath.civ time setIncrement 0.5
CameraPath.civ time animationMode -once
CameraPath.civ fire
CameraPath.civ setViewerMask 65535

set hideNewModules 0
create HxDisplaySurface {SurfaceView}
SurfaceView setIconPosition 738 1866
SurfaceView data connect brain.surf
SurfaceView colormap setDefaultColor 0.332998 0.332998 0.332998
SurfaceView colormap setDefaultAlpha 1.000000
SurfaceView colormap setLocalRange 0
SurfaceView fire
SurfaceView drawStyle setValue 4
SurfaceView fire
SurfaceView drawStyle setSpecularLighting 1
SurfaceView drawStyle setTexture 1
SurfaceView drawStyle setAlphaMode 3
SurfaceView drawStyle setNormalBinding 0
SurfaceView drawStyle setSortingMode 1
SurfaceView drawStyle setLineWidth 0.000000
SurfaceView drawStyle setOutlineColor 0 0 0.2
SurfaceView textureWrap setIndex 0 1
SurfaceView cullingMode setValue 0
SurfaceView selectionMode setIndex 0 0
SurfaceView Patch setMinMax 0 2
SurfaceView Patch setButtons 1
SurfaceView Patch setIncrement 1
SurfaceView Patch setValue 0
SurfaceView Patch setSubMinMax 0 2
SurfaceView BoundaryId setIndex 0 -1
SurfaceView materials setIndex 0 0
SurfaceView materials setIndex 1 0
SurfaceView colorMode setIndex 0 5
SurfaceView baseTrans setMinMax 0 1
SurfaceView baseTrans setButtons 0
SurfaceView baseTrans setIncrement 0.1
SurfaceView baseTrans setValue 0.05
SurfaceView baseTrans setSubMinMax 0 1
SurfaceView VRMode setIndex 0 0
SurfaceView fire
SurfaceView hideBox 1
{SurfaceView} selectTriangles zab HIJMONMBDBABAAAAAMMDKAPKDHJNKJNIAHBEAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAANPLGDKGKIHEACP
SurfaceView fire
SurfaceView setViewerMask 16383
SurfaceView setShadowStyle 0
SurfaceView setPickable 1

set hideNewModules 0
create HxLight {Light-Back}
Light-Back setIconPosition 744 3096
Light-Back setNoRemoveAll 1
Light-Back setType 2
Light-Back setColor 1 1 1
Light-Back setSlave 0
Light-Back edit 0
Light-Back setDirection 0 0 -1
Light-Back setLocation 5695 4345 20000
Light-Back setIntensity 1
Light-Back setCutOffAngle 1.5708
Light-Back setDropOffRate 0
Light-Back fire
Light-Back setViewerMask 16383

set hideNewModules 0
create HxLight {Light-Front}
Light-Front setIconPosition 738 3126
Light-Front setNoRemoveAll 1
Light-Front setType 2
Light-Front setColor 1 1 1
Light-Front setSlave 0
Light-Front edit 0
Light-Front setDirection 0 0 1
Light-Front setLocation 5695 4345 -6000
Light-Front setIntensity 1
Light-Front setCutOffAngle 1.5708
Light-Front setDropOffRate 0
Light-Front fire
Light-Front setViewerMask 16383

set hideNewModules 0
create HxLight {Light-Top}
Light-Top setIconPosition 750 3156
Light-Top setNoRemoveAll 1
Light-Top setType 2
Light-Top setColor 1 1 1
Light-Top setSlave 0
Light-Top edit 0
Light-Top setDirection 0 1 0
Light-Top setLocation 5695 -7000 7000
Light-Top setIntensity 1
Light-Top setCutOffAngle 1.5708
Light-Top setDropOffRate 0
Light-Top fire
Light-Top setViewerMask 16383

set hideNewModules 0
create HxLight {Light-Bottom}
Light-Bottom setIconPosition 732 3186
Light-Bottom setNoRemoveAll 1
Light-Bottom setType 2
Light-Bottom setColor 1 1 1
Light-Bottom setSlave 0
Light-Bottom edit 0
Light-Bottom setDirection 0 -1 0
Light-Bottom setLocation 5695 15000 7000
Light-Bottom setIntensity 1
Light-Bottom setCutOffAngle 1.5708
Light-Bottom setDropOffRate 0
Light-Bottom fire
Light-Bottom setViewerMask 16383

set hideNewModules 0
create HxLight {Light-Right}
Light-Right setIconPosition 738 3216
Light-Right setNoRemoveAll 1
Light-Right setType 2
Light-Right setColor 1 1 1
Light-Right setSlave 0
Light-Right edit 0
Light-Right setDirection 1 0 0
Light-Right setLocation -7000 4345 7000
Light-Right setIntensity 1
Light-Right setCutOffAngle 1.5708
Light-Right setDropOffRate 0
Light-Right fire
Light-Right setViewerMask 16383

set hideNewModules 0
create HxLight {Light-Left}
Light-Left setIconPosition 744 3246
Light-Left setNoRemoveAll 1
Light-Left setType 2
Light-Left setColor 1 1 1
Light-Left setSlave 0
Light-Left edit 0
Light-Left setDirection -1 0 0
Light-Left setLocation 18000 4345 7000
Light-Left setIntensity 1
Light-Left setCutOffAngle 1.5708
Light-Left setDropOffRate 0
Light-Left fire
Light-Left setViewerMask 16383

set hideNewModules 0
create HxSpatialGraphView {Class1.1-190117_3_reg}
Class1.1-190117_3_reg setIconPosition 677 1896
Class1.1-190117_3_reg data connect 190117_3_reg.am
Class1.1-190117_3_reg nodeColormap setDefaultColor 1 0.8 0.5
Class1.1-190117_3_reg nodeColormap setDefaultAlpha 0.500000
Class1.1-190117_3_reg nodeColormap setLocalRange 0
Class1.1-190117_3_reg nodeColormap connect physics.icol
Class1.1-190117_3_reg segmentColormap setDefaultColor 1 0.8 0.5
Class1.1-190117_3_reg segmentColormap setDefaultAlpha 0.500000
Class1.1-190117_3_reg segmentColormap setLocalRange 0
Class1.1-190117_3_reg segmentColormap connect physics.icol
Class1.1-190117_3_reg fire
Class1.1-190117_3_reg itemsToShow setValue 0 1
Class1.1-190117_3_reg itemsToShow setToggleVisible 0 1
Class1.1-190117_3_reg itemsToShow setValue 1 1
Class1.1-190117_3_reg itemsToShow setToggleVisible 1 1
Class1.1-190117_3_reg nodeScale setIndex 0 0
Class1.1-190117_3_reg nodeScaleFactor setMinMax 0 611
Class1.1-190117_3_reg nodeScaleFactor setButtons 0
Class1.1-190117_3_reg nodeScaleFactor setIncrement 40.7333
Class1.1-190117_3_reg nodeScaleFactor setValue 10
Class1.1-190117_3_reg nodeScaleFactor setSubMinMax 0 611
Class1.1-190117_3_reg nodeColoring setIndex 0 0
Class1.1-190117_3_reg nodeLabelColoringOptions setValue 0
Class1.1-190117_3_reg nodeColor setColor 0 0.5 0.5 0.5
Class1.1-190117_3_reg segmentStyle setValue 0 1
Class1.1-190117_3_reg segmentStyle setToggleVisible 0 1
Class1.1-190117_3_reg segmentStyle setValue 1 0
Class1.1-190117_3_reg segmentStyle setToggleVisible 1 1
Class1.1-190117_3_reg segmentStyle setValue 2 0
Class1.1-190117_3_reg segmentStyle setToggleVisible 2 1
Class1.1-190117_3_reg tubeScale setIndex 0 1
Class1.1-190117_3_reg tubeScaleFactor setMinMax 0 10
Class1.1-190117_3_reg tubeScaleFactor setButtons 0
Class1.1-190117_3_reg tubeScaleFactor setIncrement 0.666667
Class1.1-190117_3_reg tubeScaleFactor setValue 1
Class1.1-190117_3_reg tubeScaleFactor setSubMinMax 0 10
Class1.1-190117_3_reg segmentWidth setMinMax 0 10
Class1.1-190117_3_reg segmentWidth setButtons 0
Class1.1-190117_3_reg segmentWidth setIncrement 0.666667
Class1.1-190117_3_reg segmentWidth setValue 2
Class1.1-190117_3_reg segmentWidth setSubMinMax 0 10
Class1.1-190117_3_reg segmentColoring setIndex 0 0
Class1.1-190117_3_reg segmentLabelColoringOptions setValue 0
Class1.1-190117_3_reg segmentColor setColor 0 1 0.347 0.554654
{Class1.1-190117_3_reg} setVisibility HIJMPLPPBPABAAENLOALPF HIJMPLPPBPABAAENLOALPF
Class1.1-190117_3_reg fire
Class1.1-190117_3_reg setViewerMask 16383
Class1.1-190117_3_reg setPickable 1

set hideNewModules 0
create HxSpatialGraphView {Class1.1-190117_5_reg}
Class1.1-190117_5_reg setIconPosition 677 1926
Class1.1-190117_5_reg data connect 190117_5_reg.am
Class1.1-190117_5_reg nodeColormap setDefaultColor 1 0.8 0.5
Class1.1-190117_5_reg nodeColormap setDefaultAlpha 0.500000
Class1.1-190117_5_reg nodeColormap setLocalRange 0
Class1.1-190117_5_reg nodeColormap connect physics.icol
Class1.1-190117_5_reg segmentColormap setDefaultColor 1 0.8 0.5
Class1.1-190117_5_reg segmentColormap setDefaultAlpha 0.500000
Class1.1-190117_5_reg segmentColormap setLocalRange 0
Class1.1-190117_5_reg segmentColormap connect physics.icol
Class1.1-190117_5_reg fire
Class1.1-190117_5_reg itemsToShow setValue 0 1
Class1.1-190117_5_reg itemsToShow setToggleVisible 0 1
Class1.1-190117_5_reg itemsToShow setValue 1 1
Class1.1-190117_5_reg itemsToShow setToggleVisible 1 1
Class1.1-190117_5_reg nodeScale setIndex 0 0
Class1.1-190117_5_reg nodeScaleFactor setMinMax 0 698
Class1.1-190117_5_reg nodeScaleFactor setButtons 0
Class1.1-190117_5_reg nodeScaleFactor setIncrement 46.5333
Class1.1-190117_5_reg nodeScaleFactor setValue 10
Class1.1-190117_5_reg nodeScaleFactor setSubMinMax 0 698
Class1.1-190117_5_reg nodeColoring setIndex 0 0
Class1.1-190117_5_reg nodeLabelColoringOptions setValue 0
Class1.1-190117_5_reg nodeColor setColor 0 0.5 0.5 0.5
Class1.1-190117_5_reg segmentStyle setValue 0 1
Class1.1-190117_5_reg segmentStyle setToggleVisible 0 1
Class1.1-190117_5_reg segmentStyle setValue 1 0
Class1.1-190117_5_reg segmentStyle setToggleVisible 1 1
Class1.1-190117_5_reg segmentStyle setValue 2 0
Class1.1-190117_5_reg segmentStyle setToggleVisible 2 1
Class1.1-190117_5_reg tubeScale setIndex 0 0
Class1.1-190117_5_reg tubeScaleFactor setMinMax 0 10
Class1.1-190117_5_reg tubeScaleFactor setButtons 0
Class1.1-190117_5_reg tubeScaleFactor setIncrement 0.666667
Class1.1-190117_5_reg tubeScaleFactor setValue 0.2
Class1.1-190117_5_reg tubeScaleFactor setSubMinMax 0 10
Class1.1-190117_5_reg segmentWidth setMinMax 0 10
Class1.1-190117_5_reg segmentWidth setButtons 0
Class1.1-190117_5_reg segmentWidth setIncrement 0.666667
Class1.1-190117_5_reg segmentWidth setValue 2
Class1.1-190117_5_reg segmentWidth setSubMinMax 0 10
Class1.1-190117_5_reg segmentColoring setIndex 0 0
Class1.1-190117_5_reg segmentLabelColoringOptions setValue 0
Class1.1-190117_5_reg segmentColor setColor 0 1 0.327 0.783294
{Class1.1-190117_5_reg} setVisibility HIJMPLPPBPABAAENLOALPF HIJMPLPPBPABAAENLOALPF
Class1.1-190117_5_reg fire
Class1.1-190117_5_reg setViewerMask 16383
Class1.1-190117_5_reg setPickable 1

set hideNewModules 0
create HxSpatialGraphView {Class1.1-190117_hyx_04_reg}
Class1.1-190117_hyx_04_reg setIconPosition 647 1956
Class1.1-190117_hyx_04_reg data connect 190117_hyx_04_reg.am
Class1.1-190117_hyx_04_reg nodeColormap setDefaultColor 1 0.8 0.5
Class1.1-190117_hyx_04_reg nodeColormap setDefaultAlpha 0.500000
Class1.1-190117_hyx_04_reg nodeColormap setLocalRange 0
Class1.1-190117_hyx_04_reg nodeColormap connect physics.icol
Class1.1-190117_hyx_04_reg segmentColormap setDefaultColor 1 0.8 0.5
Class1.1-190117_hyx_04_reg segmentColormap setDefaultAlpha 0.500000
Class1.1-190117_hyx_04_reg segmentColormap setLocalRange 0
Class1.1-190117_hyx_04_reg segmentColormap connect physics.icol
Class1.1-190117_hyx_04_reg fire
Class1.1-190117_hyx_04_reg itemsToShow setValue 0 1
Class1.1-190117_hyx_04_reg itemsToShow setToggleVisible 0 1
Class1.1-190117_hyx_04_reg itemsToShow setValue 1 1
Class1.1-190117_hyx_04_reg itemsToShow setToggleVisible 1 1
Class1.1-190117_hyx_04_reg nodeScale setIndex 0 0
Class1.1-190117_hyx_04_reg nodeScaleFactor setMinMax 0 634
Class1.1-190117_hyx_04_reg nodeScaleFactor setButtons 0
Class1.1-190117_hyx_04_reg nodeScaleFactor setIncrement 42.2667
Class1.1-190117_hyx_04_reg nodeScaleFactor setValue 10
Class1.1-190117_hyx_04_reg nodeScaleFactor setSubMinMax 0 634
Class1.1-190117_hyx_04_reg nodeColoring setIndex 0 0
Class1.1-190117_hyx_04_reg nodeLabelColoringOptions setValue 0
Class1.1-190117_hyx_04_reg nodeColor setColor 0 0.5 0.5 0.5
Class1.1-190117_hyx_04_reg segmentStyle setValue 0 1
Class1.1-190117_hyx_04_reg segmentStyle setToggleVisible 0 1
Class1.1-190117_hyx_04_reg segmentStyle setValue 1 0
Class1.1-190117_hyx_04_reg segmentStyle setToggleVisible 1 1
Class1.1-190117_hyx_04_reg segmentStyle setValue 2 0
Class1.1-190117_hyx_04_reg segmentStyle setToggleVisible 2 1
Class1.1-190117_hyx_04_reg tubeScale setIndex 0 0
Class1.1-190117_hyx_04_reg tubeScaleFactor setMinMax 0 10
Class1.1-190117_hyx_04_reg tubeScaleFactor setButtons 0
Class1.1-190117_hyx_04_reg tubeScaleFactor setIncrement 0.666667
Class1.1-190117_hyx_04_reg tubeScaleFactor setValue 0.2
Class1.1-190117_hyx_04_reg tubeScaleFactor setSubMinMax 0 10
Class1.1-190117_hyx_04_reg segmentWidth setMinMax 0 10
Class1.1-190117_hyx_04_reg segmentWidth setButtons 0
Class1.1-190117_hyx_04_reg segmentWidth setIncrement 0.666667
Class1.1-190117_hyx_04_reg segmentWidth setValue 2
Class1.1-190117_hyx_04_reg segmentWidth setSubMinMax 0 10
Class1.1-190117_hyx_04_reg segmentColoring setIndex 0 0
Class1.1-190117_hyx_04_reg segmentLabelColoringOptions setValue 0
Class1.1-190117_hyx_04_reg segmentColor setColor 0 0.929 0.451778 0.359523
{Class1.1-190117_hyx_04_reg} setVisibility HIJMPLPPBPACAACDOEAHPJ HIJMPLPPBPACAACDOEAHPJ
Class1.1-190117_hyx_04_reg fire
Class1.1-190117_hyx_04_reg setViewerMask 16383
Class1.1-190117_hyx_04_reg setPickable 1

set hideNewModules 0
create HxSpatialGraphView {Class1.1-190117_pab_1_reg}
Class1.1-190117_pab_1_reg setIconPosition 653 1986
Class1.1-190117_pab_1_reg data connect 190117_pab_1_reg.am
Class1.1-190117_pab_1_reg nodeColormap setDefaultColor 1 0.8 0.5
Class1.1-190117_pab_1_reg nodeColormap setDefaultAlpha 0.500000
Class1.1-190117_pab_1_reg nodeColormap setLocalRange 0
Class1.1-190117_pab_1_reg nodeColormap connect physics.icol
Class1.1-190117_pab_1_reg segmentColormap setDefaultColor 1 0.8 0.5
Class1.1-190117_pab_1_reg segmentColormap setDefaultAlpha 0.500000
Class1.1-190117_pab_1_reg segmentColormap setLocalRange 0
Class1.1-190117_pab_1_reg segmentColormap connect physics.icol
Class1.1-190117_pab_1_reg fire
Class1.1-190117_pab_1_reg itemsToShow setValue 0 1
Class1.1-190117_pab_1_reg itemsToShow setToggleVisible 0 1
Class1.1-190117_pab_1_reg itemsToShow setValue 1 1
Class1.1-190117_pab_1_reg itemsToShow setToggleVisible 1 1
Class1.1-190117_pab_1_reg nodeScale setIndex 0 0
Class1.1-190117_pab_1_reg nodeScaleFactor setMinMax 0 530
Class1.1-190117_pab_1_reg nodeScaleFactor setButtons 0
Class1.1-190117_pab_1_reg nodeScaleFactor setIncrement 35.3333
Class1.1-190117_pab_1_reg nodeScaleFactor setValue 10
Class1.1-190117_pab_1_reg nodeScaleFactor setSubMinMax 0 530
Class1.1-190117_pab_1_reg nodeColoring setIndex 0 0
Class1.1-190117_pab_1_reg nodeLabelColoringOptions setValue 0
Class1.1-190117_pab_1_reg nodeColor setColor 0 0.5 0.5 0.5
Class1.1-190117_pab_1_reg segmentStyle setValue 0 1
Class1.1-190117_pab_1_reg segmentStyle setToggleVisible 0 1
Class1.1-190117_pab_1_reg segmentStyle setValue 1 0
Class1.1-190117_pab_1_reg segmentStyle setToggleVisible 1 1
Class1.1-190117_pab_1_reg segmentStyle setValue 2 0
Class1.1-190117_pab_1_reg segmentStyle setToggleVisible 2 1
Class1.1-190117_pab_1_reg tubeScale setIndex 0 0
Class1.1-190117_pab_1_reg tubeScaleFactor setMinMax 0 10
Class1.1-190117_pab_1_reg tubeScaleFactor setButtons 0
Class1.1-190117_pab_1_reg tubeScaleFactor setIncrement 0.666667
Class1.1-190117_pab_1_reg tubeScaleFactor setValue 0.2
Class1.1-190117_pab_1_reg tubeScaleFactor setSubMinMax 0 10
Class1.1-190117_pab_1_reg segmentWidth setMinMax 0 10
Class1.1-190117_pab_1_reg segmentWidth setButtons 0
Class1.1-190117_pab_1_reg segmentWidth setIncrement 0.666667
Class1.1-190117_pab_1_reg segmentWidth setValue 2
Class1.1-190117_pab_1_reg segmentWidth setSubMinMax 0 10
Class1.1-190117_pab_1_reg segmentColoring setIndex 0 0
Class1.1-190117_pab_1_reg segmentLabelColoringOptions setValue 0
Class1.1-190117_pab_1_reg segmentColor setColor 0 0.993 0.231369 0.564963
{Class1.1-190117_pab_1_reg} setVisibility HIJMPLPPBPABAAENLOALPF HIJMPLPPBPABAAENLOALPF
Class1.1-190117_pab_1_reg fire
Class1.1-190117_pab_1_reg setViewerMask 16383
Class1.1-190117_pab_1_reg setPickable 1

set hideNewModules 0
create HxSpatialGraphView {Class1.1-190117_VTA_candidate1_reg}
Class1.1-190117_VTA_candidate1_reg setIconPosition 599 2016
Class1.1-190117_VTA_candidate1_reg data connect 190117_VTA_candidate1_reg.am
Class1.1-190117_VTA_candidate1_reg nodeColormap setDefaultColor 1 0.8 0.5
Class1.1-190117_VTA_candidate1_reg nodeColormap setDefaultAlpha 0.500000
Class1.1-190117_VTA_candidate1_reg nodeColormap setLocalRange 0
Class1.1-190117_VTA_candidate1_reg nodeColormap connect physics.icol
Class1.1-190117_VTA_candidate1_reg segmentColormap setDefaultColor 1 0.8 0.5
Class1.1-190117_VTA_candidate1_reg segmentColormap setDefaultAlpha 0.500000
Class1.1-190117_VTA_candidate1_reg segmentColormap setLocalRange 0
Class1.1-190117_VTA_candidate1_reg segmentColormap connect physics.icol
Class1.1-190117_VTA_candidate1_reg fire
Class1.1-190117_VTA_candidate1_reg itemsToShow setValue 0 1
Class1.1-190117_VTA_candidate1_reg itemsToShow setToggleVisible 0 1
Class1.1-190117_VTA_candidate1_reg itemsToShow setValue 1 1
Class1.1-190117_VTA_candidate1_reg itemsToShow setToggleVisible 1 1
Class1.1-190117_VTA_candidate1_reg nodeScale setIndex 0 0
Class1.1-190117_VTA_candidate1_reg nodeScaleFactor setMinMax 0 518
Class1.1-190117_VTA_candidate1_reg nodeScaleFactor setButtons 0
Class1.1-190117_VTA_candidate1_reg nodeScaleFactor setIncrement 34.5333
Class1.1-190117_VTA_candidate1_reg nodeScaleFactor setValue 10
Class1.1-190117_VTA_candidate1_reg nodeScaleFactor setSubMinMax 0 518
Class1.1-190117_VTA_candidate1_reg nodeColoring setIndex 0 0
Class1.1-190117_VTA_candidate1_reg nodeLabelColoringOptions setValue 0
Class1.1-190117_VTA_candidate1_reg nodeColor setColor 0 0.5 0.5 0.5
Class1.1-190117_VTA_candidate1_reg segmentStyle setValue 0 1
Class1.1-190117_VTA_candidate1_reg segmentStyle setToggleVisible 0 1
Class1.1-190117_VTA_candidate1_reg segmentStyle setValue 1 0
Class1.1-190117_VTA_candidate1_reg segmentStyle setToggleVisible 1 1
Class1.1-190117_VTA_candidate1_reg segmentStyle setValue 2 0
Class1.1-190117_VTA_candidate1_reg segmentStyle setToggleVisible 2 1
Class1.1-190117_VTA_candidate1_reg tubeScale setIndex 0 0
Class1.1-190117_VTA_candidate1_reg tubeScaleFactor setMinMax 0 10
Class1.1-190117_VTA_candidate1_reg tubeScaleFactor setButtons 0
Class1.1-190117_VTA_candidate1_reg tubeScaleFactor setIncrement 0.666667
Class1.1-190117_VTA_candidate1_reg tubeScaleFactor setValue 0.2
Class1.1-190117_VTA_candidate1_reg tubeScaleFactor setSubMinMax 0 10
Class1.1-190117_VTA_candidate1_reg segmentWidth setMinMax 0 10
Class1.1-190117_VTA_candidate1_reg segmentWidth setButtons 0
Class1.1-190117_VTA_candidate1_reg segmentWidth setIncrement 0.666667
Class1.1-190117_VTA_candidate1_reg segmentWidth setValue 2
Class1.1-190117_VTA_candidate1_reg segmentWidth setSubMinMax 0 10
Class1.1-190117_VTA_candidate1_reg segmentColoring setIndex 0 0
Class1.1-190117_VTA_candidate1_reg segmentLabelColoringOptions setValue 0
Class1.1-190117_VTA_candidate1_reg segmentColor setColor 0 0.933 0.151146 0
{Class1.1-190117_VTA_candidate1_reg} setVisibility HIJMPLPPBPBFAAAAIHIIAPPB HIJMPLPPBPBFAAAAIHIIAPPB
Class1.1-190117_VTA_candidate1_reg fire
Class1.1-190117_VTA_candidate1_reg setViewerMask 16383
Class1.1-190117_VTA_candidate1_reg setPickable 1

set hideNewModules 0
create HxSpatialGraphView {Class1.1-190117_yzw_07_2_reg}
Class1.1-190117_yzw_07_2_reg setIconPosition 635 2046
Class1.1-190117_yzw_07_2_reg data connect 190117_yzw_07_2_reg.am
Class1.1-190117_yzw_07_2_reg nodeColormap setDefaultColor 1 0.8 0.5
Class1.1-190117_yzw_07_2_reg nodeColormap setDefaultAlpha 0.500000
Class1.1-190117_yzw_07_2_reg nodeColormap setLocalRange 0
Class1.1-190117_yzw_07_2_reg nodeColormap connect physics.icol
Class1.1-190117_yzw_07_2_reg segmentColormap setDefaultColor 1 0.8 0.5
Class1.1-190117_yzw_07_2_reg segmentColormap setDefaultAlpha 0.500000
Class1.1-190117_yzw_07_2_reg segmentColormap setLocalRange 0
Class1.1-190117_yzw_07_2_reg segmentColormap connect physics.icol
Class1.1-190117_yzw_07_2_reg fire
Class1.1-190117_yzw_07_2_reg itemsToShow setValue 0 1
Class1.1-190117_yzw_07_2_reg itemsToShow setToggleVisible 0 1
Class1.1-190117_yzw_07_2_reg itemsToShow setValue 1 1
Class1.1-190117_yzw_07_2_reg itemsToShow setToggleVisible 1 1
Class1.1-190117_yzw_07_2_reg nodeScale setIndex 0 0
Class1.1-190117_yzw_07_2_reg nodeScaleFactor setMinMax 0 597
Class1.1-190117_yzw_07_2_reg nodeScaleFactor setButtons 0
Class1.1-190117_yzw_07_2_reg nodeScaleFactor setIncrement 39.8
Class1.1-190117_yzw_07_2_reg nodeScaleFactor setValue 10
Class1.1-190117_yzw_07_2_reg nodeScaleFactor setSubMinMax 0 597
Class1.1-190117_yzw_07_2_reg nodeColoring setIndex 0 0
Class1.1-190117_yzw_07_2_reg nodeLabelColoringOptions setValue 0
Class1.1-190117_yzw_07_2_reg nodeColor setColor 0 0.5 0.5 0.5
Class1.1-190117_yzw_07_2_reg segmentStyle setValue 0 1
Class1.1-190117_yzw_07_2_reg segmentStyle setToggleVisible 0 1
Class1.1-190117_yzw_07_2_reg segmentStyle setValue 1 0
Class1.1-190117_yzw_07_2_reg segmentStyle setToggleVisible 1 1
Class1.1-190117_yzw_07_2_reg segmentStyle setValue 2 0
Class1.1-190117_yzw_07_2_reg segmentStyle setToggleVisible 2 1
Class1.1-190117_yzw_07_2_reg tubeScale setIndex 0 0
Class1.1-190117_yzw_07_2_reg tubeScaleFactor setMinMax 0 10
Class1.1-190117_yzw_07_2_reg tubeScaleFactor setButtons 0
Class1.1-190117_yzw_07_2_reg tubeScaleFactor setIncrement 0.666667
Class1.1-190117_yzw_07_2_reg tubeScaleFactor setValue 0.2
Class1.1-190117_yzw_07_2_reg tubeScaleFactor setSubMinMax 0 10
Class1.1-190117_yzw_07_2_reg segmentWidth setMinMax 0 10
Class1.1-190117_yzw_07_2_reg segmentWidth setButtons 0
Class1.1-190117_yzw_07_2_reg segmentWidth setIncrement 0.666667
Class1.1-190117_yzw_07_2_reg segmentWidth setValue 2
Class1.1-190117_yzw_07_2_reg segmentWidth setSubMinMax 0 10
Class1.1-190117_yzw_07_2_reg segmentColoring setIndex 0 0
Class1.1-190117_yzw_07_2_reg segmentLabelColoringOptions setValue 0
Class1.1-190117_yzw_07_2_reg segmentColor setColor 0 0.913 0.408111 0.408111
{Class1.1-190117_yzw_07_2_reg} setVisibility HIJMPLPPBPBFAAAAIHIIAPPB HIJMPLPPBPBFAAAAIHIIAPPB
Class1.1-190117_yzw_07_2_reg fire
Class1.1-190117_yzw_07_2_reg setViewerMask 16383
Class1.1-190117_yzw_07_2_reg setPickable 1

set hideNewModules 0
create HxSpatialGraphView {Class1.1-194160_20200508_ventral_02_reg}
Class1.1-194160_20200508_ventral_02_reg setIconPosition 569 2076
Class1.1-194160_20200508_ventral_02_reg data connect 194160_20200508_ventral_02_reg.am
Class1.1-194160_20200508_ventral_02_reg nodeColormap setDefaultColor 1 0.8 0.5
Class1.1-194160_20200508_ventral_02_reg nodeColormap setDefaultAlpha 0.500000
Class1.1-194160_20200508_ventral_02_reg nodeColormap setLocalRange 0
Class1.1-194160_20200508_ventral_02_reg nodeColormap connect physics.icol
Class1.1-194160_20200508_ventral_02_reg segmentColormap setDefaultColor 1 0.8 0.5
Class1.1-194160_20200508_ventral_02_reg segmentColormap setDefaultAlpha 0.500000
Class1.1-194160_20200508_ventral_02_reg segmentColormap setLocalRange 0
Class1.1-194160_20200508_ventral_02_reg segmentColormap connect physics.icol
Class1.1-194160_20200508_ventral_02_reg fire
Class1.1-194160_20200508_ventral_02_reg itemsToShow setValue 0 1
Class1.1-194160_20200508_ventral_02_reg itemsToShow setToggleVisible 0 1
Class1.1-194160_20200508_ventral_02_reg itemsToShow setValue 1 1
Class1.1-194160_20200508_ventral_02_reg itemsToShow setToggleVisible 1 1
Class1.1-194160_20200508_ventral_02_reg nodeScale setIndex 0 0
Class1.1-194160_20200508_ventral_02_reg nodeScaleFactor setMinMax 0 692
Class1.1-194160_20200508_ventral_02_reg nodeScaleFactor setButtons 0
Class1.1-194160_20200508_ventral_02_reg nodeScaleFactor setIncrement 46.1333
Class1.1-194160_20200508_ventral_02_reg nodeScaleFactor setValue 10
Class1.1-194160_20200508_ventral_02_reg nodeScaleFactor setSubMinMax 0 692
Class1.1-194160_20200508_ventral_02_reg nodeColoring setIndex 0 0
Class1.1-194160_20200508_ventral_02_reg nodeLabelColoringOptions setValue 0
Class1.1-194160_20200508_ventral_02_reg nodeColor setColor 0 0.5 0.5 0.5
Class1.1-194160_20200508_ventral_02_reg segmentStyle setValue 0 1
Class1.1-194160_20200508_ventral_02_reg segmentStyle setToggleVisible 0 1
Class1.1-194160_20200508_ventral_02_reg segmentStyle setValue 1 0
Class1.1-194160_20200508_ventral_02_reg segmentStyle setToggleVisible 1 1
Class1.1-194160_20200508_ventral_02_reg segmentStyle setValue 2 0
Class1.1-194160_20200508_ventral_02_reg segmentStyle setToggleVisible 2 1
Class1.1-194160_20200508_ventral_02_reg tubeScale setIndex 0 0
Class1.1-194160_20200508_ventral_02_reg tubeScaleFactor setMinMax 0 10
Class1.1-194160_20200508_ventral_02_reg tubeScaleFactor setButtons 0
Class1.1-194160_20200508_ventral_02_reg tubeScaleFactor setIncrement 0.666667
Class1.1-194160_20200508_ventral_02_reg tubeScaleFactor setValue 10
Class1.1-194160_20200508_ventral_02_reg tubeScaleFactor setSubMinMax 0 10
Class1.1-194160_20200508_ventral_02_reg segmentWidth setMinMax 0 10
Class1.1-194160_20200508_ventral_02_reg segmentWidth setButtons 0
Class1.1-194160_20200508_ventral_02_reg segmentWidth setIncrement 0.666667
Class1.1-194160_20200508_ventral_02_reg segmentWidth setValue 2
Class1.1-194160_20200508_ventral_02_reg segmentWidth setSubMinMax 0 10
Class1.1-194160_20200508_ventral_02_reg segmentColoring setIndex 0 0
Class1.1-194160_20200508_ventral_02_reg segmentLabelColoringOptions setValue 0
Class1.1-194160_20200508_ventral_02_reg segmentColor setColor 0 0.139 1 0.912178
{Class1.1-194160_20200508_ventral_02_reg} setVisibility HIJMPLPPJPHIAAAANKHLCLNF HIJMPLPPJPHIAAAANKHLCLNF
Class1.1-194160_20200508_ventral_02_reg fire
Class1.1-194160_20200508_ventral_02_reg setViewerMask 16383
Class1.1-194160_20200508_ventral_02_reg setPickable 1

set hideNewModules 0
create HxSpatialGraphView {Class1.1-194160_20200508_ventral_03_reg}
Class1.1-194160_20200508_ventral_03_reg setIconPosition 569 2106
Class1.1-194160_20200508_ventral_03_reg data connect 194160_20200508_ventral_03_reg.am
Class1.1-194160_20200508_ventral_03_reg nodeColormap setDefaultColor 1 0.8 0.5
Class1.1-194160_20200508_ventral_03_reg nodeColormap setDefaultAlpha 0.500000
Class1.1-194160_20200508_ventral_03_reg nodeColormap setLocalRange 0
Class1.1-194160_20200508_ventral_03_reg nodeColormap connect physics.icol
Class1.1-194160_20200508_ventral_03_reg segmentColormap setDefaultColor 1 0.8 0.5
Class1.1-194160_20200508_ventral_03_reg segmentColormap setDefaultAlpha 0.500000
Class1.1-194160_20200508_ventral_03_reg segmentColormap setLocalRange 0
Class1.1-194160_20200508_ventral_03_reg segmentColormap connect physics.icol
Class1.1-194160_20200508_ventral_03_reg fire
Class1.1-194160_20200508_ventral_03_reg itemsToShow setValue 0 1
Class1.1-194160_20200508_ventral_03_reg itemsToShow setToggleVisible 0 1
Class1.1-194160_20200508_ventral_03_reg itemsToShow setValue 1 1
Class1.1-194160_20200508_ventral_03_reg itemsToShow setToggleVisible 1 1
Class1.1-194160_20200508_ventral_03_reg nodeScale setIndex 0 0
Class1.1-194160_20200508_ventral_03_reg nodeScaleFactor setMinMax 0 673
Class1.1-194160_20200508_ventral_03_reg nodeScaleFactor setButtons 0
Class1.1-194160_20200508_ventral_03_reg nodeScaleFactor setIncrement 44.8667
Class1.1-194160_20200508_ventral_03_reg nodeScaleFactor setValue 10
Class1.1-194160_20200508_ventral_03_reg nodeScaleFactor setSubMinMax 0 673
Class1.1-194160_20200508_ventral_03_reg nodeColoring setIndex 0 0
Class1.1-194160_20200508_ventral_03_reg nodeLabelColoringOptions setValue 0
Class1.1-194160_20200508_ventral_03_reg nodeColor setColor 0 0.5 0.5 0.5
Class1.1-194160_20200508_ventral_03_reg segmentStyle setValue 0 1
Class1.1-194160_20200508_ventral_03_reg segmentStyle setToggleVisible 0 1
Class1.1-194160_20200508_ventral_03_reg segmentStyle setValue 1 0
Class1.1-194160_20200508_ventral_03_reg segmentStyle setToggleVisible 1 1
Class1.1-194160_20200508_ventral_03_reg segmentStyle setValue 2 0
Class1.1-194160_20200508_ventral_03_reg segmentStyle setToggleVisible 2 1
Class1.1-194160_20200508_ventral_03_reg tubeScale setIndex 0 0
Class1.1-194160_20200508_ventral_03_reg tubeScaleFactor setMinMax 0 10
Class1.1-194160_20200508_ventral_03_reg tubeScaleFactor setButtons 0
Class1.1-194160_20200508_ventral_03_reg tubeScaleFactor setIncrement 0.666667
Class1.1-194160_20200508_ventral_03_reg tubeScaleFactor setValue 0.2
Class1.1-194160_20200508_ventral_03_reg tubeScaleFactor setSubMinMax 0 10
Class1.1-194160_20200508_ventral_03_reg segmentWidth setMinMax 0 10
Class1.1-194160_20200508_ventral_03_reg segmentWidth setButtons 0
Class1.1-194160_20200508_ventral_03_reg segmentWidth setIncrement 0.666667
Class1.1-194160_20200508_ventral_03_reg segmentWidth setValue 2
Class1.1-194160_20200508_ventral_03_reg segmentWidth setSubMinMax 0 10
Class1.1-194160_20200508_ventral_03_reg segmentColoring setIndex 0 0
Class1.1-194160_20200508_ventral_03_reg segmentLabelColoringOptions setValue 0
Class1.1-194160_20200508_ventral_03_reg segmentColor setColor 0 0.987 0.45402 0.687465
{Class1.1-194160_20200508_ventral_03_reg} setVisibility HIJMPLPPJPHKAAAAGDIDELLF HIJMPLPPJPHKAAAAGDIDELLF
Class1.1-194160_20200508_ventral_03_reg fire
Class1.1-194160_20200508_ventral_03_reg setViewerMask 16383
Class1.1-194160_20200508_ventral_03_reg setPickable 1

set hideNewModules 0
create HxSpatialGraphView {Class1.1-194160_CIBR_01_reg}
Class1.1-194160_CIBR_01_reg setIconPosition 641 2136
Class1.1-194160_CIBR_01_reg data connect 194160_CIBR_01_reg.am
Class1.1-194160_CIBR_01_reg nodeColormap setDefaultColor 1 0.8 0.5
Class1.1-194160_CIBR_01_reg nodeColormap setDefaultAlpha 0.500000
Class1.1-194160_CIBR_01_reg nodeColormap setLocalRange 0
Class1.1-194160_CIBR_01_reg nodeColormap connect physics.icol
Class1.1-194160_CIBR_01_reg segmentColormap setDefaultColor 1 0.8 0.5
Class1.1-194160_CIBR_01_reg segmentColormap setDefaultAlpha 0.500000
Class1.1-194160_CIBR_01_reg segmentColormap setLocalRange 0
Class1.1-194160_CIBR_01_reg segmentColormap connect physics.icol
Class1.1-194160_CIBR_01_reg fire
Class1.1-194160_CIBR_01_reg itemsToShow setValue 0 1
Class1.1-194160_CIBR_01_reg itemsToShow setToggleVisible 0 1
Class1.1-194160_CIBR_01_reg itemsToShow setValue 1 1
Class1.1-194160_CIBR_01_reg itemsToShow setToggleVisible 1 1
Class1.1-194160_CIBR_01_reg nodeScale setIndex 0 0
Class1.1-194160_CIBR_01_reg nodeScaleFactor setMinMax 0 629
Class1.1-194160_CIBR_01_reg nodeScaleFactor setButtons 0
Class1.1-194160_CIBR_01_reg nodeScaleFactor setIncrement 41.9333
Class1.1-194160_CIBR_01_reg nodeScaleFactor setValue 10
Class1.1-194160_CIBR_01_reg nodeScaleFactor setSubMinMax 0 629
Class1.1-194160_CIBR_01_reg nodeColoring setIndex 0 0
Class1.1-194160_CIBR_01_reg nodeLabelColoringOptions setValue 0
Class1.1-194160_CIBR_01_reg nodeColor setColor 0 0.5 0.5 0.5
Class1.1-194160_CIBR_01_reg segmentStyle setValue 0 1
Class1.1-194160_CIBR_01_reg segmentStyle setToggleVisible 0 1
Class1.1-194160_CIBR_01_reg segmentStyle setValue 1 0
Class1.1-194160_CIBR_01_reg segmentStyle setToggleVisible 1 1
Class1.1-194160_CIBR_01_reg segmentStyle setValue 2 0
Class1.1-194160_CIBR_01_reg segmentStyle setToggleVisible 2 1
Class1.1-194160_CIBR_01_reg tubeScale setIndex 0 0
Class1.1-194160_CIBR_01_reg tubeScaleFactor setMinMax 0 10
Class1.1-194160_CIBR_01_reg tubeScaleFactor setButtons 0
Class1.1-194160_CIBR_01_reg tubeScaleFactor setIncrement 0.666667
Class1.1-194160_CIBR_01_reg tubeScaleFactor setValue 0.2
Class1.1-194160_CIBR_01_reg tubeScaleFactor setSubMinMax 0 10
Class1.1-194160_CIBR_01_reg segmentWidth setMinMax 0 10
Class1.1-194160_CIBR_01_reg segmentWidth setButtons 0
Class1.1-194160_CIBR_01_reg segmentWidth setIncrement 0.666667
Class1.1-194160_CIBR_01_reg segmentWidth setValue 2
Class1.1-194160_CIBR_01_reg segmentWidth setSubMinMax 0 10
Class1.1-194160_CIBR_01_reg segmentColoring setIndex 0 0
Class1.1-194160_CIBR_01_reg segmentLabelColoringOptions setValue 0
Class1.1-194160_CIBR_01_reg segmentColor setColor 0 0 0.626496 0.753
{Class1.1-194160_CIBR_01_reg} setVisibility HIJMPLPPJPDIAAAADBCBCHNJ HIJMPLPPJPDIAAAADBCBCHNJ
Class1.1-194160_CIBR_01_reg fire
Class1.1-194160_CIBR_01_reg setViewerMask 16383
Class1.1-194160_CIBR_01_reg setPickable 1

set hideNewModules 0
create HxSpatialGraphView {Class1.1-194160_CIBR_04_reg}
Class1.1-194160_CIBR_04_reg setIconPosition 641 2166
Class1.1-194160_CIBR_04_reg data connect 194160_CIBR_04_reg.am
Class1.1-194160_CIBR_04_reg nodeColormap setDefaultColor 1 0.8 0.5
Class1.1-194160_CIBR_04_reg nodeColormap setDefaultAlpha 0.500000
Class1.1-194160_CIBR_04_reg nodeColormap setLocalRange 0
Class1.1-194160_CIBR_04_reg nodeColormap connect physics.icol
Class1.1-194160_CIBR_04_reg segmentColormap setDefaultColor 1 0.8 0.5
Class1.1-194160_CIBR_04_reg segmentColormap setDefaultAlpha 0.500000
Class1.1-194160_CIBR_04_reg segmentColormap setLocalRange 0
Class1.1-194160_CIBR_04_reg segmentColormap connect physics.icol
Class1.1-194160_CIBR_04_reg fire
Class1.1-194160_CIBR_04_reg itemsToShow setValue 0 1
Class1.1-194160_CIBR_04_reg itemsToShow setToggleVisible 0 1
Class1.1-194160_CIBR_04_reg itemsToShow setValue 1 1
Class1.1-194160_CIBR_04_reg itemsToShow setToggleVisible 1 1
Class1.1-194160_CIBR_04_reg nodeScale setIndex 0 0
Class1.1-194160_CIBR_04_reg nodeScaleFactor setMinMax 0 717
Class1.1-194160_CIBR_04_reg nodeScaleFactor setButtons 0
Class1.1-194160_CIBR_04_reg nodeScaleFactor setIncrement 47.8
Class1.1-194160_CIBR_04_reg nodeScaleFactor setValue 10
Class1.1-194160_CIBR_04_reg nodeScaleFactor setSubMinMax 0 717
Class1.1-194160_CIBR_04_reg nodeColoring setIndex 0 0
Class1.1-194160_CIBR_04_reg nodeLabelColoringOptions setValue 0
Class1.1-194160_CIBR_04_reg nodeColor setColor 0 0.5 0.5 0.5
Class1.1-194160_CIBR_04_reg segmentStyle setValue 0 1
Class1.1-194160_CIBR_04_reg segmentStyle setToggleVisible 0 1
Class1.1-194160_CIBR_04_reg segmentStyle setValue 1 0
Class1.1-194160_CIBR_04_reg segmentStyle setToggleVisible 1 1
Class1.1-194160_CIBR_04_reg segmentStyle setValue 2 0
Class1.1-194160_CIBR_04_reg segmentStyle setToggleVisible 2 1
Class1.1-194160_CIBR_04_reg tubeScale setIndex 0 0
Class1.1-194160_CIBR_04_reg tubeScaleFactor setMinMax 0 10
Class1.1-194160_CIBR_04_reg tubeScaleFactor setButtons 0
Class1.1-194160_CIBR_04_reg tubeScaleFactor setIncrement 0.666667
Class1.1-194160_CIBR_04_reg tubeScaleFactor setValue 0.2
Class1.1-194160_CIBR_04_reg tubeScaleFactor setSubMinMax 0 10
Class1.1-194160_CIBR_04_reg segmentWidth setMinMax 0 10
Class1.1-194160_CIBR_04_reg segmentWidth setButtons 0
Class1.1-194160_CIBR_04_reg segmentWidth setIncrement 0.666667
Class1.1-194160_CIBR_04_reg segmentWidth setValue 2
Class1.1-194160_CIBR_04_reg segmentWidth setSubMinMax 0 10
Class1.1-194160_CIBR_04_reg segmentColoring setIndex 0 0
Class1.1-194160_CIBR_04_reg segmentLabelColoringOptions setValue 0
Class1.1-194160_CIBR_04_reg segmentColor setColor 0 1 0.760906 0.667
{Class1.1-194160_CIBR_04_reg} setVisibility HIJMPLPPJPDMAAAADGFGDHMJ HIJMPLPPJPDMAAAADGFGDHMJ
Class1.1-194160_CIBR_04_reg fire
Class1.1-194160_CIBR_04_reg setViewerMask 16383
Class1.1-194160_CIBR_04_reg setPickable 1

set hideNewModules 0
create HxSpatialGraphView {Class1.1-194160_CIBR_05_reg}
Class1.1-194160_CIBR_05_reg setIconPosition 641 2196
Class1.1-194160_CIBR_05_reg data connect 194160_CIBR_05_reg.am
Class1.1-194160_CIBR_05_reg nodeColormap setDefaultColor 1 0.8 0.5
Class1.1-194160_CIBR_05_reg nodeColormap setDefaultAlpha 0.500000
Class1.1-194160_CIBR_05_reg nodeColormap setLocalRange 0
Class1.1-194160_CIBR_05_reg nodeColormap connect physics.icol
Class1.1-194160_CIBR_05_reg segmentColormap setDefaultColor 1 0.8 0.5
Class1.1-194160_CIBR_05_reg segmentColormap setDefaultAlpha 0.500000
Class1.1-194160_CIBR_05_reg segmentColormap setLocalRange 0
Class1.1-194160_CIBR_05_reg segmentColormap connect physics.icol
Class1.1-194160_CIBR_05_reg fire
Class1.1-194160_CIBR_05_reg itemsToShow setValue 0 1
Class1.1-194160_CIBR_05_reg itemsToShow setToggleVisible 0 1
Class1.1-194160_CIBR_05_reg itemsToShow setValue 1 1
Class1.1-194160_CIBR_05_reg itemsToShow setToggleVisible 1 1
Class1.1-194160_CIBR_05_reg nodeScale setIndex 0 0
Class1.1-194160_CIBR_05_reg nodeScaleFactor setMinMax 0 845
Class1.1-194160_CIBR_05_reg nodeScaleFactor setButtons 0
Class1.1-194160_CIBR_05_reg nodeScaleFactor setIncrement 56.3333
Class1.1-194160_CIBR_05_reg nodeScaleFactor setValue 10
Class1.1-194160_CIBR_05_reg nodeScaleFactor setSubMinMax 0 845
Class1.1-194160_CIBR_05_reg nodeColoring setIndex 0 0
Class1.1-194160_CIBR_05_reg nodeLabelColoringOptions setValue 0
Class1.1-194160_CIBR_05_reg nodeColor setColor 0 0.5 0.5 0.5
Class1.1-194160_CIBR_05_reg segmentStyle setValue 0 1
Class1.1-194160_CIBR_05_reg segmentStyle setToggleVisible 0 1
Class1.1-194160_CIBR_05_reg segmentStyle setValue 1 0
Class1.1-194160_CIBR_05_reg segmentStyle setToggleVisible 1 1
Class1.1-194160_CIBR_05_reg segmentStyle setValue 2 0
Class1.1-194160_CIBR_05_reg segmentStyle setToggleVisible 2 1
Class1.1-194160_CIBR_05_reg tubeScale setIndex 0 0
Class1.1-194160_CIBR_05_reg tubeScaleFactor setMinMax 0 10
Class1.1-194160_CIBR_05_reg tubeScaleFactor setButtons 0
Class1.1-194160_CIBR_05_reg tubeScaleFactor setIncrement 0.666667
Class1.1-194160_CIBR_05_reg tubeScaleFactor setValue 0.2
Class1.1-194160_CIBR_05_reg tubeScaleFactor setSubMinMax 0 10
Class1.1-194160_CIBR_05_reg segmentWidth setMinMax 0 10
Class1.1-194160_CIBR_05_reg segmentWidth setButtons 0
Class1.1-194160_CIBR_05_reg segmentWidth setIncrement 0.666667
Class1.1-194160_CIBR_05_reg segmentWidth setValue 2
Class1.1-194160_CIBR_05_reg segmentWidth setSubMinMax 0 10
Class1.1-194160_CIBR_05_reg segmentColoring setIndex 0 0
Class1.1-194160_CIBR_05_reg segmentLabelColoringOptions setValue 0
Class1.1-194160_CIBR_05_reg segmentColor setColor 0 1 0.3616 0.16
{Class1.1-194160_CIBR_05_reg} setVisibility HIJMPLPPJPDAAAAAJHKICDNN HIJMPLPPJPDAAAAAJHKICDNN
Class1.1-194160_CIBR_05_reg fire
Class1.1-194160_CIBR_05_reg setViewerMask 16383
Class1.1-194160_CIBR_05_reg setPickable 1

set hideNewModules 0
create HxSpatialGraphView {Class1.1-194160_CIBR_06_reg}
Class1.1-194160_CIBR_06_reg setIconPosition 641 2226
Class1.1-194160_CIBR_06_reg data connect 194160_CIBR_06_reg.am
Class1.1-194160_CIBR_06_reg nodeColormap setDefaultColor 1 0.8 0.5
Class1.1-194160_CIBR_06_reg nodeColormap setDefaultAlpha 0.500000
Class1.1-194160_CIBR_06_reg nodeColormap setLocalRange 0
Class1.1-194160_CIBR_06_reg nodeColormap connect physics.icol
Class1.1-194160_CIBR_06_reg segmentColormap setDefaultColor 1 0.8 0.5
Class1.1-194160_CIBR_06_reg segmentColormap setDefaultAlpha 0.500000
Class1.1-194160_CIBR_06_reg segmentColormap setLocalRange 0
Class1.1-194160_CIBR_06_reg segmentColormap connect physics.icol
Class1.1-194160_CIBR_06_reg fire
Class1.1-194160_CIBR_06_reg itemsToShow setValue 0 1
Class1.1-194160_CIBR_06_reg itemsToShow setToggleVisible 0 1
Class1.1-194160_CIBR_06_reg itemsToShow setValue 1 1
Class1.1-194160_CIBR_06_reg itemsToShow setToggleVisible 1 1
Class1.1-194160_CIBR_06_reg nodeScale setIndex 0 0
Class1.1-194160_CIBR_06_reg nodeScaleFactor setMinMax 0 740
Class1.1-194160_CIBR_06_reg nodeScaleFactor setButtons 0
Class1.1-194160_CIBR_06_reg nodeScaleFactor setIncrement 49.3333
Class1.1-194160_CIBR_06_reg nodeScaleFactor setValue 10
Class1.1-194160_CIBR_06_reg nodeScaleFactor setSubMinMax 0 740
Class1.1-194160_CIBR_06_reg nodeColoring setIndex 0 0
Class1.1-194160_CIBR_06_reg nodeLabelColoringOptions setValue 0
Class1.1-194160_CIBR_06_reg nodeColor setColor 0 0.5 0.5 0.5
Class1.1-194160_CIBR_06_reg segmentStyle setValue 0 1
Class1.1-194160_CIBR_06_reg segmentStyle setToggleVisible 0 1
Class1.1-194160_CIBR_06_reg segmentStyle setValue 1 0
Class1.1-194160_CIBR_06_reg segmentStyle setToggleVisible 1 1
Class1.1-194160_CIBR_06_reg segmentStyle setValue 2 0
Class1.1-194160_CIBR_06_reg segmentStyle setToggleVisible 2 1
Class1.1-194160_CIBR_06_reg tubeScale setIndex 0 1
Class1.1-194160_CIBR_06_reg tubeScaleFactor setMinMax 0 10
Class1.1-194160_CIBR_06_reg tubeScaleFactor setButtons 0
Class1.1-194160_CIBR_06_reg tubeScaleFactor setIncrement 0.666667
Class1.1-194160_CIBR_06_reg tubeScaleFactor setValue 10
Class1.1-194160_CIBR_06_reg tubeScaleFactor setSubMinMax 0 10
Class1.1-194160_CIBR_06_reg segmentWidth setMinMax 0 10
Class1.1-194160_CIBR_06_reg segmentWidth setButtons 0
Class1.1-194160_CIBR_06_reg segmentWidth setIncrement 0.666667
Class1.1-194160_CIBR_06_reg segmentWidth setValue 2
Class1.1-194160_CIBR_06_reg segmentWidth setSubMinMax 0 10
Class1.1-194160_CIBR_06_reg segmentColoring setIndex 0 0
Class1.1-194160_CIBR_06_reg segmentLabelColoringOptions setValue 0
Class1.1-194160_CIBR_06_reg segmentColor setColor 0 1 0.267 0.267
{Class1.1-194160_CIBR_06_reg} setVisibility HIJMPLPPJPHIAAAANKHLCLNF HIJMPLPPJPHIAAAANKHLCLNF
Class1.1-194160_CIBR_06_reg fire
Class1.1-194160_CIBR_06_reg setViewerMask 16383
Class1.1-194160_CIBR_06_reg setPickable 1

set hideNewModules 0
create HxSpatialGraphView {Class1.1-194161_20200501_right_ventral_layer2_reg}
Class1.1-194161_20200501_right_ventral_layer2_reg setIconPosition 509 2256
Class1.1-194161_20200501_right_ventral_layer2_reg data connect 194161_20200501_right_ventral_layer2_reg.am
Class1.1-194161_20200501_right_ventral_layer2_reg nodeColormap setDefaultColor 1 0.8 0.5
Class1.1-194161_20200501_right_ventral_layer2_reg nodeColormap setDefaultAlpha 0.500000
Class1.1-194161_20200501_right_ventral_layer2_reg nodeColormap setLocalRange 0
Class1.1-194161_20200501_right_ventral_layer2_reg nodeColormap connect physics.icol
Class1.1-194161_20200501_right_ventral_layer2_reg segmentColormap setDefaultColor 1 0.8 0.5
Class1.1-194161_20200501_right_ventral_layer2_reg segmentColormap setDefaultAlpha 0.500000
Class1.1-194161_20200501_right_ventral_layer2_reg segmentColormap setLocalRange 0
Class1.1-194161_20200501_right_ventral_layer2_reg segmentColormap connect physics.icol
Class1.1-194161_20200501_right_ventral_layer2_reg fire
Class1.1-194161_20200501_right_ventral_layer2_reg itemsToShow setValue 0 1
Class1.1-194161_20200501_right_ventral_layer2_reg itemsToShow setToggleVisible 0 1
Class1.1-194161_20200501_right_ventral_layer2_reg itemsToShow setValue 1 1
Class1.1-194161_20200501_right_ventral_layer2_reg itemsToShow setToggleVisible 1 1
Class1.1-194161_20200501_right_ventral_layer2_reg nodeScale setIndex 0 0
Class1.1-194161_20200501_right_ventral_layer2_reg nodeScaleFactor setMinMax 0 592
Class1.1-194161_20200501_right_ventral_layer2_reg nodeScaleFactor setButtons 0
Class1.1-194161_20200501_right_ventral_layer2_reg nodeScaleFactor setIncrement 39.4667
Class1.1-194161_20200501_right_ventral_layer2_reg nodeScaleFactor setValue 10
Class1.1-194161_20200501_right_ventral_layer2_reg nodeScaleFactor setSubMinMax 0 592
Class1.1-194161_20200501_right_ventral_layer2_reg nodeColoring setIndex 0 0
Class1.1-194161_20200501_right_ventral_layer2_reg nodeLabelColoringOptions setValue 0
Class1.1-194161_20200501_right_ventral_layer2_reg nodeColor setColor 0 0.5 0.5 0.5
Class1.1-194161_20200501_right_ventral_layer2_reg segmentStyle setValue 0 1
Class1.1-194161_20200501_right_ventral_layer2_reg segmentStyle setToggleVisible 0 1
Class1.1-194161_20200501_right_ventral_layer2_reg segmentStyle setValue 1 0
Class1.1-194161_20200501_right_ventral_layer2_reg segmentStyle setToggleVisible 1 1
Class1.1-194161_20200501_right_ventral_layer2_reg segmentStyle setValue 2 0
Class1.1-194161_20200501_right_ventral_layer2_reg segmentStyle setToggleVisible 2 1
Class1.1-194161_20200501_right_ventral_layer2_reg tubeScale setIndex 0 0
Class1.1-194161_20200501_right_ventral_layer2_reg tubeScaleFactor setMinMax 0 10
Class1.1-194161_20200501_right_ventral_layer2_reg tubeScaleFactor setButtons 0
Class1.1-194161_20200501_right_ventral_layer2_reg tubeScaleFactor setIncrement 0.666667
Class1.1-194161_20200501_right_ventral_layer2_reg tubeScaleFactor setValue 10
Class1.1-194161_20200501_right_ventral_layer2_reg tubeScaleFactor setSubMinMax 0 10
Class1.1-194161_20200501_right_ventral_layer2_reg segmentWidth setMinMax 0 10
Class1.1-194161_20200501_right_ventral_layer2_reg segmentWidth setButtons 0
Class1.1-194161_20200501_right_ventral_layer2_reg segmentWidth setIncrement 0.666667
Class1.1-194161_20200501_right_ventral_layer2_reg segmentWidth setValue 2
Class1.1-194161_20200501_right_ventral_layer2_reg segmentWidth setSubMinMax 0 10
Class1.1-194161_20200501_right_ventral_layer2_reg segmentColoring setIndex 0 0
Class1.1-194161_20200501_right_ventral_layer2_reg segmentLabelColoringOptions setValue 0
Class1.1-194161_20200501_right_ventral_layer2_reg segmentColor setColor 0 1 0.447 0.57972
{Class1.1-194161_20200501_right_ventral_layer2_reg} setVisibility HIJMPLPPBPBDAAAANBECBDON HIJMPLPPBPBDAAAANBECBDON
Class1.1-194161_20200501_right_ventral_layer2_reg fire
Class1.1-194161_20200501_right_ventral_layer2_reg setViewerMask 16383
Class1.1-194161_20200501_right_ventral_layer2_reg setPickable 1

set hideNewModules 0
create HxSpatialGraphView {Class1.1-194161_right_wgl_003_02_reg}
Class1.1-194161_right_wgl_003_02_reg setIconPosition 587 2286
Class1.1-194161_right_wgl_003_02_reg data connect 194161_right_wgl_003_02_reg.am
Class1.1-194161_right_wgl_003_02_reg nodeColormap setDefaultColor 1 0.8 0.5
Class1.1-194161_right_wgl_003_02_reg nodeColormap setDefaultAlpha 0.500000
Class1.1-194161_right_wgl_003_02_reg nodeColormap setLocalRange 0
Class1.1-194161_right_wgl_003_02_reg nodeColormap connect physics.icol
Class1.1-194161_right_wgl_003_02_reg segmentColormap setDefaultColor 1 0.8 0.5
Class1.1-194161_right_wgl_003_02_reg segmentColormap setDefaultAlpha 0.500000
Class1.1-194161_right_wgl_003_02_reg segmentColormap setLocalRange 0
Class1.1-194161_right_wgl_003_02_reg segmentColormap connect physics.icol
Class1.1-194161_right_wgl_003_02_reg fire
Class1.1-194161_right_wgl_003_02_reg itemsToShow setValue 0 1
Class1.1-194161_right_wgl_003_02_reg itemsToShow setToggleVisible 0 1
Class1.1-194161_right_wgl_003_02_reg itemsToShow setValue 1 1
Class1.1-194161_right_wgl_003_02_reg itemsToShow setToggleVisible 1 1
Class1.1-194161_right_wgl_003_02_reg nodeScale setIndex 0 0
Class1.1-194161_right_wgl_003_02_reg nodeScaleFactor setMinMax 0 474
Class1.1-194161_right_wgl_003_02_reg nodeScaleFactor setButtons 0
Class1.1-194161_right_wgl_003_02_reg nodeScaleFactor setIncrement 31.6
Class1.1-194161_right_wgl_003_02_reg nodeScaleFactor setValue 10
Class1.1-194161_right_wgl_003_02_reg nodeScaleFactor setSubMinMax 0 474
Class1.1-194161_right_wgl_003_02_reg nodeColoring setIndex 0 0
Class1.1-194161_right_wgl_003_02_reg nodeLabelColoringOptions setValue 0
Class1.1-194161_right_wgl_003_02_reg nodeColor setColor 0 0.5 0.5 0.5
Class1.1-194161_right_wgl_003_02_reg segmentStyle setValue 0 1
Class1.1-194161_right_wgl_003_02_reg segmentStyle setToggleVisible 0 1
Class1.1-194161_right_wgl_003_02_reg segmentStyle setValue 1 0
Class1.1-194161_right_wgl_003_02_reg segmentStyle setToggleVisible 1 1
Class1.1-194161_right_wgl_003_02_reg segmentStyle setValue 2 0
Class1.1-194161_right_wgl_003_02_reg segmentStyle setToggleVisible 2 1
Class1.1-194161_right_wgl_003_02_reg tubeScale setIndex 0 0
Class1.1-194161_right_wgl_003_02_reg tubeScaleFactor setMinMax 0 10
Class1.1-194161_right_wgl_003_02_reg tubeScaleFactor setButtons 0
Class1.1-194161_right_wgl_003_02_reg tubeScaleFactor setIncrement 0.666667
Class1.1-194161_right_wgl_003_02_reg tubeScaleFactor setValue 0.2
Class1.1-194161_right_wgl_003_02_reg tubeScaleFactor setSubMinMax 0 10
Class1.1-194161_right_wgl_003_02_reg segmentWidth setMinMax 0 10
Class1.1-194161_right_wgl_003_02_reg segmentWidth setButtons 0
Class1.1-194161_right_wgl_003_02_reg segmentWidth setIncrement 0.666667
Class1.1-194161_right_wgl_003_02_reg segmentWidth setValue 2
Class1.1-194161_right_wgl_003_02_reg segmentWidth setSubMinMax 0 10
Class1.1-194161_right_wgl_003_02_reg segmentColoring setIndex 0 0
Class1.1-194161_right_wgl_003_02_reg segmentLabelColoringOptions setValue 0
Class1.1-194161_right_wgl_003_02_reg segmentColor setColor 0 0.254 0.879148 1
{Class1.1-194161_right_wgl_003_02_reg} setVisibility HIJMPLPPBPDLAAAACKPLBHOJ HIJMPLPPBPDHAAAAJEJFBLOF
Class1.1-194161_right_wgl_003_02_reg fire
Class1.1-194161_right_wgl_003_02_reg setViewerMask 16383
Class1.1-194161_right_wgl_003_02_reg setPickable 1

set hideNewModules 0
create HxSpatialGraphView {Class1.1-194161_TH_001_reg}
Class1.1-194161_TH_001_reg setIconPosition 647 2316
Class1.1-194161_TH_001_reg data connect 194161_TH_001_reg.am
Class1.1-194161_TH_001_reg nodeColormap setDefaultColor 1 0.8 0.5
Class1.1-194161_TH_001_reg nodeColormap setDefaultAlpha 0.500000
Class1.1-194161_TH_001_reg nodeColormap setLocalRange 0
Class1.1-194161_TH_001_reg nodeColormap connect physics.icol
Class1.1-194161_TH_001_reg segmentColormap setDefaultColor 1 0.8 0.5
Class1.1-194161_TH_001_reg segmentColormap setDefaultAlpha 0.500000
Class1.1-194161_TH_001_reg segmentColormap setLocalRange 0
Class1.1-194161_TH_001_reg segmentColormap connect physics.icol
Class1.1-194161_TH_001_reg fire
Class1.1-194161_TH_001_reg itemsToShow setValue 0 1
Class1.1-194161_TH_001_reg itemsToShow setToggleVisible 0 1
Class1.1-194161_TH_001_reg itemsToShow setValue 1 1
Class1.1-194161_TH_001_reg itemsToShow setToggleVisible 1 1
Class1.1-194161_TH_001_reg nodeScale setIndex 0 0
Class1.1-194161_TH_001_reg nodeScaleFactor setMinMax 0 664
Class1.1-194161_TH_001_reg nodeScaleFactor setButtons 0
Class1.1-194161_TH_001_reg nodeScaleFactor setIncrement 44.2667
Class1.1-194161_TH_001_reg nodeScaleFactor setValue 10
Class1.1-194161_TH_001_reg nodeScaleFactor setSubMinMax 0 664
Class1.1-194161_TH_001_reg nodeColoring setIndex 0 0
Class1.1-194161_TH_001_reg nodeLabelColoringOptions setValue 0
Class1.1-194161_TH_001_reg nodeColor setColor 0 0.5 0.5 0.5
Class1.1-194161_TH_001_reg segmentStyle setValue 0 1
Class1.1-194161_TH_001_reg segmentStyle setToggleVisible 0 1
Class1.1-194161_TH_001_reg segmentStyle setValue 1 0
Class1.1-194161_TH_001_reg segmentStyle setToggleVisible 1 1
Class1.1-194161_TH_001_reg segmentStyle setValue 2 0
Class1.1-194161_TH_001_reg segmentStyle setToggleVisible 2 1
Class1.1-194161_TH_001_reg tubeScale setIndex 0 0
Class1.1-194161_TH_001_reg tubeScaleFactor setMinMax 0 10
Class1.1-194161_TH_001_reg tubeScaleFactor setButtons 0
Class1.1-194161_TH_001_reg tubeScaleFactor setIncrement 0.666667
Class1.1-194161_TH_001_reg tubeScaleFactor setValue 0.2
Class1.1-194161_TH_001_reg tubeScaleFactor setSubMinMax 0 10
Class1.1-194161_TH_001_reg segmentWidth setMinMax 0 10
Class1.1-194161_TH_001_reg segmentWidth setButtons 0
Class1.1-194161_TH_001_reg segmentWidth setIncrement 0.666667
Class1.1-194161_TH_001_reg segmentWidth setValue 2
Class1.1-194161_TH_001_reg segmentWidth setSubMinMax 0 10
Class1.1-194161_TH_001_reg segmentColoring setIndex 0 0
Class1.1-194161_TH_001_reg segmentLabelColoringOptions setValue 0
Class1.1-194161_TH_001_reg segmentColor setColor 0 0.572959 0.159248 0.592
{Class1.1-194161_TH_001_reg} setVisibility HIJMPLPPBPABAAENLOALPF HIJMPLPPBPABAAENLOALPF
Class1.1-194161_TH_001_reg fire
Class1.1-194161_TH_001_reg setViewerMask 16383
Class1.1-194161_TH_001_reg setPickable 1

set hideNewModules 0
create HxSpatialGraphView {Class1.1-194161_yzw20200421_right_02_reg}
Class1.1-194161_yzw20200421_right_02_reg setIconPosition 563 2346
Class1.1-194161_yzw20200421_right_02_reg data connect 194161_yzw20200421_right_02_reg.am
Class1.1-194161_yzw20200421_right_02_reg nodeColormap setDefaultColor 1 0.8 0.5
Class1.1-194161_yzw20200421_right_02_reg nodeColormap setDefaultAlpha 0.500000
Class1.1-194161_yzw20200421_right_02_reg nodeColormap setLocalRange 0
Class1.1-194161_yzw20200421_right_02_reg nodeColormap connect physics.icol
Class1.1-194161_yzw20200421_right_02_reg segmentColormap setDefaultColor 1 0.8 0.5
Class1.1-194161_yzw20200421_right_02_reg segmentColormap setDefaultAlpha 0.500000
Class1.1-194161_yzw20200421_right_02_reg segmentColormap setLocalRange 0
Class1.1-194161_yzw20200421_right_02_reg segmentColormap connect physics.icol
Class1.1-194161_yzw20200421_right_02_reg fire
Class1.1-194161_yzw20200421_right_02_reg itemsToShow setValue 0 1
Class1.1-194161_yzw20200421_right_02_reg itemsToShow setToggleVisible 0 1
Class1.1-194161_yzw20200421_right_02_reg itemsToShow setValue 1 1
Class1.1-194161_yzw20200421_right_02_reg itemsToShow setToggleVisible 1 1
Class1.1-194161_yzw20200421_right_02_reg nodeScale setIndex 0 0
Class1.1-194161_yzw20200421_right_02_reg nodeScaleFactor setMinMax 0 830
Class1.1-194161_yzw20200421_right_02_reg nodeScaleFactor setButtons 0
Class1.1-194161_yzw20200421_right_02_reg nodeScaleFactor setIncrement 55.3333
Class1.1-194161_yzw20200421_right_02_reg nodeScaleFactor setValue 10
Class1.1-194161_yzw20200421_right_02_reg nodeScaleFactor setSubMinMax 0 830
Class1.1-194161_yzw20200421_right_02_reg nodeColoring setIndex 0 0
Class1.1-194161_yzw20200421_right_02_reg nodeLabelColoringOptions setValue 0
Class1.1-194161_yzw20200421_right_02_reg nodeColor setColor 0 0.5 0.5 0.5
Class1.1-194161_yzw20200421_right_02_reg segmentStyle setValue 0 1
Class1.1-194161_yzw20200421_right_02_reg segmentStyle setToggleVisible 0 1
Class1.1-194161_yzw20200421_right_02_reg segmentStyle setValue 1 0
Class1.1-194161_yzw20200421_right_02_reg segmentStyle setToggleVisible 1 1
Class1.1-194161_yzw20200421_right_02_reg segmentStyle setValue 2 0
Class1.1-194161_yzw20200421_right_02_reg segmentStyle setToggleVisible 2 1
Class1.1-194161_yzw20200421_right_02_reg tubeScale setIndex 0 0
Class1.1-194161_yzw20200421_right_02_reg tubeScaleFactor setMinMax 0 10
Class1.1-194161_yzw20200421_right_02_reg tubeScaleFactor setButtons 0
Class1.1-194161_yzw20200421_right_02_reg tubeScaleFactor setIncrement 0.666667
Class1.1-194161_yzw20200421_right_02_reg tubeScaleFactor setValue 0.2
Class1.1-194161_yzw20200421_right_02_reg tubeScaleFactor setSubMinMax 0 10
Class1.1-194161_yzw20200421_right_02_reg segmentWidth setMinMax 0 10
Class1.1-194161_yzw20200421_right_02_reg segmentWidth setButtons 0
Class1.1-194161_yzw20200421_right_02_reg segmentWidth setIncrement 0.666667
Class1.1-194161_yzw20200421_right_02_reg segmentWidth setValue 2
Class1.1-194161_yzw20200421_right_02_reg segmentWidth setSubMinMax 0 10
Class1.1-194161_yzw20200421_right_02_reg segmentColoring setIndex 0 0
Class1.1-194161_yzw20200421_right_02_reg segmentLabelColoringOptions setValue 0
Class1.1-194161_yzw20200421_right_02_reg segmentColor setColor 0 1 0.49308 0.333
{Class1.1-194161_yzw20200421_right_02_reg} setVisibility HIJMPLPPBPDHAAAAJEJFBLOF HIJMPLPPBPDHAAAAJEJFBLOF
Class1.1-194161_yzw20200421_right_02_reg fire
Class1.1-194161_yzw20200421_right_02_reg setViewerMask 16383
Class1.1-194161_yzw20200421_right_02_reg setPickable 1

set hideNewModules 0
create HxSpatialGraphView {Class1.1-194161_yzw20200421_right_BLA_01_related_03_reg}
Class1.1-194161_yzw20200421_right_BLA_01_related_03_reg setIconPosition 473 2376
Class1.1-194161_yzw20200421_right_BLA_01_related_03_reg data connect 194161_yzw20200421_right_BLA_01_related_03_reg.am
Class1.1-194161_yzw20200421_right_BLA_01_related_03_reg nodeColormap setDefaultColor 1 0.8 0.5
Class1.1-194161_yzw20200421_right_BLA_01_related_03_reg nodeColormap setDefaultAlpha 0.500000
Class1.1-194161_yzw20200421_right_BLA_01_related_03_reg nodeColormap setLocalRange 0
Class1.1-194161_yzw20200421_right_BLA_01_related_03_reg nodeColormap connect physics.icol
Class1.1-194161_yzw20200421_right_BLA_01_related_03_reg segmentColormap setDefaultColor 1 0.8 0.5
Class1.1-194161_yzw20200421_right_BLA_01_related_03_reg segmentColormap setDefaultAlpha 0.500000
Class1.1-194161_yzw20200421_right_BLA_01_related_03_reg segmentColormap setLocalRange 0
Class1.1-194161_yzw20200421_right_BLA_01_related_03_reg segmentColormap connect physics.icol
Class1.1-194161_yzw20200421_right_BLA_01_related_03_reg fire
Class1.1-194161_yzw20200421_right_BLA_01_related_03_reg itemsToShow setValue 0 1
Class1.1-194161_yzw20200421_right_BLA_01_related_03_reg itemsToShow setToggleVisible 0 1
Class1.1-194161_yzw20200421_right_BLA_01_related_03_reg itemsToShow setValue 1 1
Class1.1-194161_yzw20200421_right_BLA_01_related_03_reg itemsToShow setToggleVisible 1 1
Class1.1-194161_yzw20200421_right_BLA_01_related_03_reg nodeScale setIndex 0 0
Class1.1-194161_yzw20200421_right_BLA_01_related_03_reg nodeScaleFactor setMinMax 0 584
Class1.1-194161_yzw20200421_right_BLA_01_related_03_reg nodeScaleFactor setButtons 0
Class1.1-194161_yzw20200421_right_BLA_01_related_03_reg nodeScaleFactor setIncrement 38.9333
Class1.1-194161_yzw20200421_right_BLA_01_related_03_reg nodeScaleFactor setValue 10
Class1.1-194161_yzw20200421_right_BLA_01_related_03_reg nodeScaleFactor setSubMinMax 0 584
Class1.1-194161_yzw20200421_right_BLA_01_related_03_reg nodeColoring setIndex 0 0
Class1.1-194161_yzw20200421_right_BLA_01_related_03_reg nodeLabelColoringOptions setValue 0
Class1.1-194161_yzw20200421_right_BLA_01_related_03_reg nodeColor setColor 0 0.5 0.5 0.5
Class1.1-194161_yzw20200421_right_BLA_01_related_03_reg segmentStyle setValue 0 1
Class1.1-194161_yzw20200421_right_BLA_01_related_03_reg segmentStyle setToggleVisible 0 1
Class1.1-194161_yzw20200421_right_BLA_01_related_03_reg segmentStyle setValue 1 0
Class1.1-194161_yzw20200421_right_BLA_01_related_03_reg segmentStyle setToggleVisible 1 1
Class1.1-194161_yzw20200421_right_BLA_01_related_03_reg segmentStyle setValue 2 0
Class1.1-194161_yzw20200421_right_BLA_01_related_03_reg segmentStyle setToggleVisible 2 1
Class1.1-194161_yzw20200421_right_BLA_01_related_03_reg tubeScale setIndex 0 0
Class1.1-194161_yzw20200421_right_BLA_01_related_03_reg tubeScaleFactor setMinMax 0 10
Class1.1-194161_yzw20200421_right_BLA_01_related_03_reg tubeScaleFactor setButtons 0
Class1.1-194161_yzw20200421_right_BLA_01_related_03_reg tubeScaleFactor setIncrement 0.666667
Class1.1-194161_yzw20200421_right_BLA_01_related_03_reg tubeScaleFactor setValue 0.2
Class1.1-194161_yzw20200421_right_BLA_01_related_03_reg tubeScaleFactor setSubMinMax 0 10
Class1.1-194161_yzw20200421_right_BLA_01_related_03_reg segmentWidth setMinMax 0 10
Class1.1-194161_yzw20200421_right_BLA_01_related_03_reg segmentWidth setButtons 0
Class1.1-194161_yzw20200421_right_BLA_01_related_03_reg segmentWidth setIncrement 0.666667
Class1.1-194161_yzw20200421_right_BLA_01_related_03_reg segmentWidth setValue 2
Class1.1-194161_yzw20200421_right_BLA_01_related_03_reg segmentWidth setSubMinMax 0 10
Class1.1-194161_yzw20200421_right_BLA_01_related_03_reg segmentColoring setIndex 0 0
Class1.1-194161_yzw20200421_right_BLA_01_related_03_reg segmentLabelColoringOptions setValue 0
Class1.1-194161_yzw20200421_right_BLA_01_related_03_reg segmentColor setColor 0 0.993 0.211509 0.680404
{Class1.1-194161_yzw20200421_right_BLA_01_related_03_reg} setVisibility HIJMPLPPBPBFAAAAIHIIAPPB HIJMPLPPBPBFAAAAIHIIAPPB
Class1.1-194161_yzw20200421_right_BLA_01_related_03_reg fire
Class1.1-194161_yzw20200421_right_BLA_01_related_03_reg setViewerMask 16383
Class1.1-194161_yzw20200421_right_BLA_01_related_03_reg setPickable 1

set hideNewModules 0
create HxSpatialGraphView {Class1.1-194161_yzw20200603_right_ventral_01_reg}
Class1.1-194161_yzw20200603_right_ventral_01_reg setIconPosition 515 2406
Class1.1-194161_yzw20200603_right_ventral_01_reg data connect 194161_yzw20200603_right_ventral_01_reg.am
Class1.1-194161_yzw20200603_right_ventral_01_reg nodeColormap setDefaultColor 1 0.8 0.5
Class1.1-194161_yzw20200603_right_ventral_01_reg nodeColormap setDefaultAlpha 0.500000
Class1.1-194161_yzw20200603_right_ventral_01_reg nodeColormap setLocalRange 0
Class1.1-194161_yzw20200603_right_ventral_01_reg nodeColormap connect physics.icol
Class1.1-194161_yzw20200603_right_ventral_01_reg segmentColormap setDefaultColor 1 0.8 0.5
Class1.1-194161_yzw20200603_right_ventral_01_reg segmentColormap setDefaultAlpha 0.500000
Class1.1-194161_yzw20200603_right_ventral_01_reg segmentColormap setLocalRange 0
Class1.1-194161_yzw20200603_right_ventral_01_reg segmentColormap connect physics.icol
Class1.1-194161_yzw20200603_right_ventral_01_reg fire
Class1.1-194161_yzw20200603_right_ventral_01_reg itemsToShow setValue 0 1
Class1.1-194161_yzw20200603_right_ventral_01_reg itemsToShow setToggleVisible 0 1
Class1.1-194161_yzw20200603_right_ventral_01_reg itemsToShow setValue 1 1
Class1.1-194161_yzw20200603_right_ventral_01_reg itemsToShow setToggleVisible 1 1
Class1.1-194161_yzw20200603_right_ventral_01_reg nodeScale setIndex 0 0
Class1.1-194161_yzw20200603_right_ventral_01_reg nodeScaleFactor setMinMax 0 637
Class1.1-194161_yzw20200603_right_ventral_01_reg nodeScaleFactor setButtons 0
Class1.1-194161_yzw20200603_right_ventral_01_reg nodeScaleFactor setIncrement 42.4667
Class1.1-194161_yzw20200603_right_ventral_01_reg nodeScaleFactor setValue 10
Class1.1-194161_yzw20200603_right_ventral_01_reg nodeScaleFactor setSubMinMax 0 637
Class1.1-194161_yzw20200603_right_ventral_01_reg nodeColoring setIndex 0 0
Class1.1-194161_yzw20200603_right_ventral_01_reg nodeLabelColoringOptions setValue 0
Class1.1-194161_yzw20200603_right_ventral_01_reg nodeColor setColor 0 0.5 0.5 0.5
Class1.1-194161_yzw20200603_right_ventral_01_reg segmentStyle setValue 0 1
Class1.1-194161_yzw20200603_right_ventral_01_reg segmentStyle setToggleVisible 0 1
Class1.1-194161_yzw20200603_right_ventral_01_reg segmentStyle setValue 1 0
Class1.1-194161_yzw20200603_right_ventral_01_reg segmentStyle setToggleVisible 1 1
Class1.1-194161_yzw20200603_right_ventral_01_reg segmentStyle setValue 2 0
Class1.1-194161_yzw20200603_right_ventral_01_reg segmentStyle setToggleVisible 2 1
Class1.1-194161_yzw20200603_right_ventral_01_reg tubeScale setIndex 0 0
Class1.1-194161_yzw20200603_right_ventral_01_reg tubeScaleFactor setMinMax 0 10
Class1.1-194161_yzw20200603_right_ventral_01_reg tubeScaleFactor setButtons 0
Class1.1-194161_yzw20200603_right_ventral_01_reg tubeScaleFactor setIncrement 0.666667
Class1.1-194161_yzw20200603_right_ventral_01_reg tubeScaleFactor setValue 0.2
Class1.1-194161_yzw20200603_right_ventral_01_reg tubeScaleFactor setSubMinMax 0 10
Class1.1-194161_yzw20200603_right_ventral_01_reg segmentWidth setMinMax 0 10
Class1.1-194161_yzw20200603_right_ventral_01_reg segmentWidth setButtons 0
Class1.1-194161_yzw20200603_right_ventral_01_reg segmentWidth setIncrement 0.666667
Class1.1-194161_yzw20200603_right_ventral_01_reg segmentWidth setValue 2
Class1.1-194161_yzw20200603_right_ventral_01_reg segmentWidth setSubMinMax 0 10
Class1.1-194161_yzw20200603_right_ventral_01_reg segmentColoring setIndex 0 0
Class1.1-194161_yzw20200603_right_ventral_01_reg segmentLabelColoringOptions setValue 0
Class1.1-194161_yzw20200603_right_ventral_01_reg segmentColor setColor 0 1 0.524854 0.433
{Class1.1-194161_yzw20200603_right_ventral_01_reg} setVisibility HIJMPLPPBPDLAAAACKPLBHOJ HIJMPLPPBPDLAAAACKPLBHOJ
Class1.1-194161_yzw20200603_right_ventral_01_reg fire
Class1.1-194161_yzw20200603_right_ventral_01_reg setViewerMask 16383
Class1.1-194161_yzw20200603_right_ventral_01_reg setPickable 1

set hideNewModules 0
create HxSpatialGraphView {Class1.1-200002_20200623_left_01_reg}
Class1.1-200002_20200623_left_01_reg setIconPosition 587 2436
Class1.1-200002_20200623_left_01_reg data connect 200002_20200623_left_01_reg.am
Class1.1-200002_20200623_left_01_reg nodeColormap setDefaultColor 1 0.8 0.5
Class1.1-200002_20200623_left_01_reg nodeColormap setDefaultAlpha 0.500000
Class1.1-200002_20200623_left_01_reg nodeColormap setLocalRange 0
Class1.1-200002_20200623_left_01_reg nodeColormap connect physics.icol
Class1.1-200002_20200623_left_01_reg segmentColormap setDefaultColor 1 0.8 0.5
Class1.1-200002_20200623_left_01_reg segmentColormap setDefaultAlpha 0.500000
Class1.1-200002_20200623_left_01_reg segmentColormap setLocalRange 0
Class1.1-200002_20200623_left_01_reg segmentColormap connect physics.icol
Class1.1-200002_20200623_left_01_reg fire
Class1.1-200002_20200623_left_01_reg itemsToShow setValue 0 1
Class1.1-200002_20200623_left_01_reg itemsToShow setToggleVisible 0 1
Class1.1-200002_20200623_left_01_reg itemsToShow setValue 1 1
Class1.1-200002_20200623_left_01_reg itemsToShow setToggleVisible 1 1
Class1.1-200002_20200623_left_01_reg nodeScale setIndex 0 0
Class1.1-200002_20200623_left_01_reg nodeScaleFactor setMinMax 0 837
Class1.1-200002_20200623_left_01_reg nodeScaleFactor setButtons 0
Class1.1-200002_20200623_left_01_reg nodeScaleFactor setIncrement 55.8
Class1.1-200002_20200623_left_01_reg nodeScaleFactor setValue 10
Class1.1-200002_20200623_left_01_reg nodeScaleFactor setSubMinMax 0 837
Class1.1-200002_20200623_left_01_reg nodeColoring setIndex 0 0
Class1.1-200002_20200623_left_01_reg nodeLabelColoringOptions setValue 0
Class1.1-200002_20200623_left_01_reg nodeColor setColor 0 0.5 0.5 0.5
Class1.1-200002_20200623_left_01_reg segmentStyle setValue 0 1
Class1.1-200002_20200623_left_01_reg segmentStyle setToggleVisible 0 1
Class1.1-200002_20200623_left_01_reg segmentStyle setValue 1 0
Class1.1-200002_20200623_left_01_reg segmentStyle setToggleVisible 1 1
Class1.1-200002_20200623_left_01_reg segmentStyle setValue 2 0
Class1.1-200002_20200623_left_01_reg segmentStyle setToggleVisible 2 1
Class1.1-200002_20200623_left_01_reg tubeScale setIndex 0 0
Class1.1-200002_20200623_left_01_reg tubeScaleFactor setMinMax 0 10
Class1.1-200002_20200623_left_01_reg tubeScaleFactor setButtons 0
Class1.1-200002_20200623_left_01_reg tubeScaleFactor setIncrement 0.666667
Class1.1-200002_20200623_left_01_reg tubeScaleFactor setValue 0.2
Class1.1-200002_20200623_left_01_reg tubeScaleFactor setSubMinMax 0 10
Class1.1-200002_20200623_left_01_reg segmentWidth setMinMax 0 10
Class1.1-200002_20200623_left_01_reg segmentWidth setButtons 0
Class1.1-200002_20200623_left_01_reg segmentWidth setIncrement 0.666667
Class1.1-200002_20200623_left_01_reg segmentWidth setValue 2
Class1.1-200002_20200623_left_01_reg segmentWidth setSubMinMax 0 10
Class1.1-200002_20200623_left_01_reg segmentColoring setIndex 0 0
Class1.1-200002_20200623_left_01_reg segmentLabelColoringOptions setValue 0
Class1.1-200002_20200623_left_01_reg segmentColor setColor 0 1 0.04 0.04
{Class1.1-200002_20200623_left_01_reg} setVisibility HIJMPLPPJPDAAAAAJHKICDNN HIJMPLPPJPDAAAAAJHKICDNN
Class1.1-200002_20200623_left_01_reg fire
Class1.1-200002_20200623_left_01_reg setViewerMask 16383
Class1.1-200002_20200623_left_01_reg setPickable 1

set hideNewModules 0
create HxSpatialGraphView {Class1.1-200003_20200609_left_03_reg}
Class1.1-200003_20200609_left_03_reg setIconPosition 587 2466
Class1.1-200003_20200609_left_03_reg data connect 200003_20200609_left_03_reg.am
Class1.1-200003_20200609_left_03_reg nodeColormap setDefaultColor 1 0.8 0.5
Class1.1-200003_20200609_left_03_reg nodeColormap setDefaultAlpha 0.500000
Class1.1-200003_20200609_left_03_reg nodeColormap setLocalRange 0
Class1.1-200003_20200609_left_03_reg nodeColormap connect physics.icol
Class1.1-200003_20200609_left_03_reg segmentColormap setDefaultColor 1 0.8 0.5
Class1.1-200003_20200609_left_03_reg segmentColormap setDefaultAlpha 0.500000
Class1.1-200003_20200609_left_03_reg segmentColormap setLocalRange 0
Class1.1-200003_20200609_left_03_reg segmentColormap connect physics.icol
Class1.1-200003_20200609_left_03_reg fire
Class1.1-200003_20200609_left_03_reg itemsToShow setValue 0 1
Class1.1-200003_20200609_left_03_reg itemsToShow setToggleVisible 0 1
Class1.1-200003_20200609_left_03_reg itemsToShow setValue 1 1
Class1.1-200003_20200609_left_03_reg itemsToShow setToggleVisible 1 1
Class1.1-200003_20200609_left_03_reg nodeScale setIndex 0 0
Class1.1-200003_20200609_left_03_reg nodeScaleFactor setMinMax 0 519
Class1.1-200003_20200609_left_03_reg nodeScaleFactor setButtons 0
Class1.1-200003_20200609_left_03_reg nodeScaleFactor setIncrement 34.6
Class1.1-200003_20200609_left_03_reg nodeScaleFactor setValue 10
Class1.1-200003_20200609_left_03_reg nodeScaleFactor setSubMinMax 0 519
Class1.1-200003_20200609_left_03_reg nodeColoring setIndex 0 0
Class1.1-200003_20200609_left_03_reg nodeLabelColoringOptions setValue 0
Class1.1-200003_20200609_left_03_reg nodeColor setColor 0 0.5 0.5 0.5
Class1.1-200003_20200609_left_03_reg segmentStyle setValue 0 1
Class1.1-200003_20200609_left_03_reg segmentStyle setToggleVisible 0 1
Class1.1-200003_20200609_left_03_reg segmentStyle setValue 1 0
Class1.1-200003_20200609_left_03_reg segmentStyle setToggleVisible 1 1
Class1.1-200003_20200609_left_03_reg segmentStyle setValue 2 0
Class1.1-200003_20200609_left_03_reg segmentStyle setToggleVisible 2 1
Class1.1-200003_20200609_left_03_reg tubeScale setIndex 0 0
Class1.1-200003_20200609_left_03_reg tubeScaleFactor setMinMax 0 10
Class1.1-200003_20200609_left_03_reg tubeScaleFactor setButtons 0
Class1.1-200003_20200609_left_03_reg tubeScaleFactor setIncrement 0.666667
Class1.1-200003_20200609_left_03_reg tubeScaleFactor setValue 0.2
Class1.1-200003_20200609_left_03_reg tubeScaleFactor setSubMinMax 0 10
Class1.1-200003_20200609_left_03_reg segmentWidth setMinMax 0 10
Class1.1-200003_20200609_left_03_reg segmentWidth setButtons 0
Class1.1-200003_20200609_left_03_reg segmentWidth setIncrement 0.666667
Class1.1-200003_20200609_left_03_reg segmentWidth setValue 2
Class1.1-200003_20200609_left_03_reg segmentWidth setSubMinMax 0 10
Class1.1-200003_20200609_left_03_reg segmentColoring setIndex 0 0
Class1.1-200003_20200609_left_03_reg segmentLabelColoringOptions setValue 0
Class1.1-200003_20200609_left_03_reg segmentColor setColor 0 0.993 0.165831 0.696874
{Class1.1-200003_20200609_left_03_reg} setVisibility HIJMPLPPBPDPAAAAAOCOBPOB HIJMPLPPBPDPAAAAAOCOBPOB
Class1.1-200003_20200609_left_03_reg fire
Class1.1-200003_20200609_left_03_reg setViewerMask 16383
Class1.1-200003_20200609_left_03_reg setPickable 1

set hideNewModules 0
create HxSpatialGraphView {Class1.1-200003_20200614_01_reg}
Class1.1-200003_20200614_01_reg setIconPosition 617 2496
Class1.1-200003_20200614_01_reg data connect 200003_20200614_01_reg.am
Class1.1-200003_20200614_01_reg nodeColormap setDefaultColor 1 0.8 0.5
Class1.1-200003_20200614_01_reg nodeColormap setDefaultAlpha 0.500000
Class1.1-200003_20200614_01_reg nodeColormap setLocalRange 0
Class1.1-200003_20200614_01_reg nodeColormap connect physics.icol
Class1.1-200003_20200614_01_reg segmentColormap setDefaultColor 1 0.8 0.5
Class1.1-200003_20200614_01_reg segmentColormap setDefaultAlpha 0.500000
Class1.1-200003_20200614_01_reg segmentColormap setLocalRange 0
Class1.1-200003_20200614_01_reg segmentColormap connect physics.icol
Class1.1-200003_20200614_01_reg fire
Class1.1-200003_20200614_01_reg itemsToShow setValue 0 1
Class1.1-200003_20200614_01_reg itemsToShow setToggleVisible 0 1
Class1.1-200003_20200614_01_reg itemsToShow setValue 1 1
Class1.1-200003_20200614_01_reg itemsToShow setToggleVisible 1 1
Class1.1-200003_20200614_01_reg nodeScale setIndex 0 0
Class1.1-200003_20200614_01_reg nodeScaleFactor setMinMax 0 768
Class1.1-200003_20200614_01_reg nodeScaleFactor setButtons 0
Class1.1-200003_20200614_01_reg nodeScaleFactor setIncrement 51.2
Class1.1-200003_20200614_01_reg nodeScaleFactor setValue 10
Class1.1-200003_20200614_01_reg nodeScaleFactor setSubMinMax 0 768
Class1.1-200003_20200614_01_reg nodeColoring setIndex 0 0
Class1.1-200003_20200614_01_reg nodeLabelColoringOptions setValue 0
Class1.1-200003_20200614_01_reg nodeColor setColor 0 0.5 0.5 0.5
Class1.1-200003_20200614_01_reg segmentStyle setValue 0 1
Class1.1-200003_20200614_01_reg segmentStyle setToggleVisible 0 1
Class1.1-200003_20200614_01_reg segmentStyle setValue 1 0
Class1.1-200003_20200614_01_reg segmentStyle setToggleVisible 1 1
Class1.1-200003_20200614_01_reg segmentStyle setValue 2 0
Class1.1-200003_20200614_01_reg segmentStyle setToggleVisible 2 1
Class1.1-200003_20200614_01_reg tubeScale setIndex 0 0
Class1.1-200003_20200614_01_reg tubeScaleFactor setMinMax 0 10
Class1.1-200003_20200614_01_reg tubeScaleFactor setButtons 0
Class1.1-200003_20200614_01_reg tubeScaleFactor setIncrement 0.666667
Class1.1-200003_20200614_01_reg tubeScaleFactor setValue 0.2
Class1.1-200003_20200614_01_reg tubeScaleFactor setSubMinMax 0 10
Class1.1-200003_20200614_01_reg segmentWidth setMinMax 0 10
Class1.1-200003_20200614_01_reg segmentWidth setButtons 0
Class1.1-200003_20200614_01_reg segmentWidth setIncrement 0.666667
Class1.1-200003_20200614_01_reg segmentWidth setValue 2
Class1.1-200003_20200614_01_reg segmentWidth setSubMinMax 0 10
Class1.1-200003_20200614_01_reg segmentColoring setIndex 0 0
Class1.1-200003_20200614_01_reg segmentLabelColoringOptions setValue 0
Class1.1-200003_20200614_01_reg segmentColor setColor 0 0.94 0.466014 0.40138
{Class1.1-200003_20200614_01_reg} setVisibility HIJMPLPPJPDIAAAADBCBCHNJ HIJMPLPPJPDIAAAADBCBCHNJ
Class1.1-200003_20200614_01_reg fire
Class1.1-200003_20200614_01_reg setViewerMask 16383
Class1.1-200003_20200614_01_reg setPickable 1

set hideNewModules 0
create HxSpatialGraphView {Class1.1-200003_20200618_right_01_reg}
Class1.1-200003_20200618_right_01_reg setIconPosition 581 2526
Class1.1-200003_20200618_right_01_reg data connect 200003_20200618_right_01_reg.am
Class1.1-200003_20200618_right_01_reg nodeColormap setDefaultColor 1 0.8 0.5
Class1.1-200003_20200618_right_01_reg nodeColormap setDefaultAlpha 0.500000
Class1.1-200003_20200618_right_01_reg nodeColormap setLocalRange 0
Class1.1-200003_20200618_right_01_reg nodeColormap connect physics.icol
Class1.1-200003_20200618_right_01_reg segmentColormap setDefaultColor 1 0.8 0.5
Class1.1-200003_20200618_right_01_reg segmentColormap setDefaultAlpha 0.500000
Class1.1-200003_20200618_right_01_reg segmentColormap setLocalRange 0
Class1.1-200003_20200618_right_01_reg segmentColormap connect physics.icol
Class1.1-200003_20200618_right_01_reg fire
Class1.1-200003_20200618_right_01_reg itemsToShow setValue 0 1
Class1.1-200003_20200618_right_01_reg itemsToShow setToggleVisible 0 1
Class1.1-200003_20200618_right_01_reg itemsToShow setValue 1 1
Class1.1-200003_20200618_right_01_reg itemsToShow setToggleVisible 1 1
Class1.1-200003_20200618_right_01_reg nodeScale setIndex 0 0
Class1.1-200003_20200618_right_01_reg nodeScaleFactor setMinMax 0 549
Class1.1-200003_20200618_right_01_reg nodeScaleFactor setButtons 0
Class1.1-200003_20200618_right_01_reg nodeScaleFactor setIncrement 36.6
Class1.1-200003_20200618_right_01_reg nodeScaleFactor setValue 10
Class1.1-200003_20200618_right_01_reg nodeScaleFactor setSubMinMax 0 549
Class1.1-200003_20200618_right_01_reg nodeColoring setIndex 0 0
Class1.1-200003_20200618_right_01_reg nodeLabelColoringOptions setValue 0
Class1.1-200003_20200618_right_01_reg nodeColor setColor 0 0.5 0.5 0.5
Class1.1-200003_20200618_right_01_reg segmentStyle setValue 0 1
Class1.1-200003_20200618_right_01_reg segmentStyle setToggleVisible 0 1
Class1.1-200003_20200618_right_01_reg segmentStyle setValue 1 0
Class1.1-200003_20200618_right_01_reg segmentStyle setToggleVisible 1 1
Class1.1-200003_20200618_right_01_reg segmentStyle setValue 2 0
Class1.1-200003_20200618_right_01_reg segmentStyle setToggleVisible 2 1
Class1.1-200003_20200618_right_01_reg tubeScale setIndex 0 0
Class1.1-200003_20200618_right_01_reg tubeScaleFactor setMinMax 0 10
Class1.1-200003_20200618_right_01_reg tubeScaleFactor setButtons 0
Class1.1-200003_20200618_right_01_reg tubeScaleFactor setIncrement 0.666667
Class1.1-200003_20200618_right_01_reg tubeScaleFactor setValue 0.2
Class1.1-200003_20200618_right_01_reg tubeScaleFactor setSubMinMax 0 10
Class1.1-200003_20200618_right_01_reg segmentWidth setMinMax 0 10
Class1.1-200003_20200618_right_01_reg segmentWidth setButtons 0
Class1.1-200003_20200618_right_01_reg segmentWidth setIncrement 0.666667
Class1.1-200003_20200618_right_01_reg segmentWidth setValue 2
Class1.1-200003_20200618_right_01_reg segmentWidth setSubMinMax 0 10
Class1.1-200003_20200618_right_01_reg segmentColoring setIndex 0 0
Class1.1-200003_20200618_right_01_reg segmentLabelColoringOptions setValue 0
Class1.1-200003_20200618_right_01_reg segmentColor setColor 0 0.893 0.083049 0.374631
{Class1.1-200003_20200618_right_01_reg} setVisibility HIJMPLPPBPBDAAAANBECBDON HIJMPLPPBPBDAAAANBECBDON
Class1.1-200003_20200618_right_01_reg fire
Class1.1-200003_20200618_right_01_reg setViewerMask 16383
Class1.1-200003_20200618_right_01_reg setPickable 1

set hideNewModules 0
create HxSpatialGraphView {Class1.2-194160_20200425_ipsilateral_BLA_01_reg}
Class1.2-194160_20200425_ipsilateral_BLA_01_reg setIconPosition 521 2556
Class1.2-194160_20200425_ipsilateral_BLA_01_reg data connect 194160_20200425_ipsilateral_BLA_01_reg.am
Class1.2-194160_20200425_ipsilateral_BLA_01_reg nodeColormap setDefaultColor 1 0.8 0.5
Class1.2-194160_20200425_ipsilateral_BLA_01_reg nodeColormap setDefaultAlpha 0.500000
Class1.2-194160_20200425_ipsilateral_BLA_01_reg nodeColormap setLocalRange 0
Class1.2-194160_20200425_ipsilateral_BLA_01_reg nodeColormap connect physics.icol
Class1.2-194160_20200425_ipsilateral_BLA_01_reg segmentColormap setDefaultColor 1 0.8 0.5
Class1.2-194160_20200425_ipsilateral_BLA_01_reg segmentColormap setDefaultAlpha 0.500000
Class1.2-194160_20200425_ipsilateral_BLA_01_reg segmentColormap setLocalRange 0
Class1.2-194160_20200425_ipsilateral_BLA_01_reg segmentColormap connect physics.icol
Class1.2-194160_20200425_ipsilateral_BLA_01_reg fire
Class1.2-194160_20200425_ipsilateral_BLA_01_reg itemsToShow setValue 0 1
Class1.2-194160_20200425_ipsilateral_BLA_01_reg itemsToShow setToggleVisible 0 1
Class1.2-194160_20200425_ipsilateral_BLA_01_reg itemsToShow setValue 1 1
Class1.2-194160_20200425_ipsilateral_BLA_01_reg itemsToShow setToggleVisible 1 1
Class1.2-194160_20200425_ipsilateral_BLA_01_reg nodeScale setIndex 0 0
Class1.2-194160_20200425_ipsilateral_BLA_01_reg nodeScaleFactor setMinMax 0 566
Class1.2-194160_20200425_ipsilateral_BLA_01_reg nodeScaleFactor setButtons 0
Class1.2-194160_20200425_ipsilateral_BLA_01_reg nodeScaleFactor setIncrement 37.7333
Class1.2-194160_20200425_ipsilateral_BLA_01_reg nodeScaleFactor setValue 10
Class1.2-194160_20200425_ipsilateral_BLA_01_reg nodeScaleFactor setSubMinMax 0 566
Class1.2-194160_20200425_ipsilateral_BLA_01_reg nodeColoring setIndex 0 0
Class1.2-194160_20200425_ipsilateral_BLA_01_reg nodeLabelColoringOptions setValue 0
Class1.2-194160_20200425_ipsilateral_BLA_01_reg nodeColor setColor 0 0.5 0.5 0.5
Class1.2-194160_20200425_ipsilateral_BLA_01_reg segmentStyle setValue 0 1
Class1.2-194160_20200425_ipsilateral_BLA_01_reg segmentStyle setToggleVisible 0 1
Class1.2-194160_20200425_ipsilateral_BLA_01_reg segmentStyle setValue 1 0
Class1.2-194160_20200425_ipsilateral_BLA_01_reg segmentStyle setToggleVisible 1 1
Class1.2-194160_20200425_ipsilateral_BLA_01_reg segmentStyle setValue 2 0
Class1.2-194160_20200425_ipsilateral_BLA_01_reg segmentStyle setToggleVisible 2 1
Class1.2-194160_20200425_ipsilateral_BLA_01_reg tubeScale setIndex 0 0
Class1.2-194160_20200425_ipsilateral_BLA_01_reg tubeScaleFactor setMinMax 0 10
Class1.2-194160_20200425_ipsilateral_BLA_01_reg tubeScaleFactor setButtons 0
Class1.2-194160_20200425_ipsilateral_BLA_01_reg tubeScaleFactor setIncrement 0.666667
Class1.2-194160_20200425_ipsilateral_BLA_01_reg tubeScaleFactor setValue 0.2
Class1.2-194160_20200425_ipsilateral_BLA_01_reg tubeScaleFactor setSubMinMax 0 10
Class1.2-194160_20200425_ipsilateral_BLA_01_reg segmentWidth setMinMax 0 10
Class1.2-194160_20200425_ipsilateral_BLA_01_reg segmentWidth setButtons 0
Class1.2-194160_20200425_ipsilateral_BLA_01_reg segmentWidth setIncrement 0.666667
Class1.2-194160_20200425_ipsilateral_BLA_01_reg segmentWidth setValue 2
Class1.2-194160_20200425_ipsilateral_BLA_01_reg segmentWidth setSubMinMax 0 10
Class1.2-194160_20200425_ipsilateral_BLA_01_reg segmentColoring setIndex 0 0
Class1.2-194160_20200425_ipsilateral_BLA_01_reg segmentLabelColoringOptions setValue 0
Class1.2-194160_20200425_ipsilateral_BLA_01_reg segmentColor setColor 0 0.0329999 0.263146 1
{Class1.2-194160_20200425_ipsilateral_BLA_01_reg} setVisibility HIJMPLPPBPBFAAAAIHIIAPPB HIJMPLPPBPBDAAAANBECBDON
Class1.2-194160_20200425_ipsilateral_BLA_01_reg fire
Class1.2-194160_20200425_ipsilateral_BLA_01_reg setViewerMask 16383
Class1.2-194160_20200425_ipsilateral_BLA_01_reg setPickable 1

set hideNewModules 0
create HxSpatialGraphView {Class1.2-194160_BLA_01_reg}
Class1.2-194160_BLA_01_reg setIconPosition 647 2586
Class1.2-194160_BLA_01_reg data connect 194160_BLA_01_reg.am
Class1.2-194160_BLA_01_reg nodeColormap setDefaultColor 1 0.8 0.5
Class1.2-194160_BLA_01_reg nodeColormap setDefaultAlpha 0.500000
Class1.2-194160_BLA_01_reg nodeColormap setLocalRange 0
Class1.2-194160_BLA_01_reg nodeColormap connect physics.icol
Class1.2-194160_BLA_01_reg segmentColormap setDefaultColor 1 0.8 0.5
Class1.2-194160_BLA_01_reg segmentColormap setDefaultAlpha 0.500000
Class1.2-194160_BLA_01_reg segmentColormap setLocalRange 0
Class1.2-194160_BLA_01_reg segmentColormap connect physics.icol
Class1.2-194160_BLA_01_reg fire
Class1.2-194160_BLA_01_reg itemsToShow setValue 0 1
Class1.2-194160_BLA_01_reg itemsToShow setToggleVisible 0 1
Class1.2-194160_BLA_01_reg itemsToShow setValue 1 1
Class1.2-194160_BLA_01_reg itemsToShow setToggleVisible 1 1
Class1.2-194160_BLA_01_reg nodeScale setIndex 0 0
Class1.2-194160_BLA_01_reg nodeScaleFactor setMinMax 0 450
Class1.2-194160_BLA_01_reg nodeScaleFactor setButtons 0
Class1.2-194160_BLA_01_reg nodeScaleFactor setIncrement 30
Class1.2-194160_BLA_01_reg nodeScaleFactor setValue 10
Class1.2-194160_BLA_01_reg nodeScaleFactor setSubMinMax 0 450
Class1.2-194160_BLA_01_reg nodeColoring setIndex 0 0
Class1.2-194160_BLA_01_reg nodeLabelColoringOptions setValue 0
Class1.2-194160_BLA_01_reg nodeColor setColor 0 0.5 0.5 0.5
Class1.2-194160_BLA_01_reg segmentStyle setValue 0 1
Class1.2-194160_BLA_01_reg segmentStyle setToggleVisible 0 1
Class1.2-194160_BLA_01_reg segmentStyle setValue 1 0
Class1.2-194160_BLA_01_reg segmentStyle setToggleVisible 1 1
Class1.2-194160_BLA_01_reg segmentStyle setValue 2 0
Class1.2-194160_BLA_01_reg segmentStyle setToggleVisible 2 1
Class1.2-194160_BLA_01_reg tubeScale setIndex 0 0
Class1.2-194160_BLA_01_reg tubeScaleFactor setMinMax 0 10
Class1.2-194160_BLA_01_reg tubeScaleFactor setButtons 0
Class1.2-194160_BLA_01_reg tubeScaleFactor setIncrement 0.666667
Class1.2-194160_BLA_01_reg tubeScaleFactor setValue 0.2
Class1.2-194160_BLA_01_reg tubeScaleFactor setSubMinMax 0 10
Class1.2-194160_BLA_01_reg segmentWidth setMinMax 0 10
Class1.2-194160_BLA_01_reg segmentWidth setButtons 0
Class1.2-194160_BLA_01_reg segmentWidth setIncrement 0.666667
Class1.2-194160_BLA_01_reg segmentWidth setValue 2
Class1.2-194160_BLA_01_reg segmentWidth setSubMinMax 0 10
Class1.2-194160_BLA_01_reg segmentColoring setIndex 0 0
Class1.2-194160_BLA_01_reg segmentLabelColoringOptions setValue 0
Class1.2-194160_BLA_01_reg segmentColor setColor 0 0.106251 0.423707 0.993
{Class1.2-194160_BLA_01_reg} setVisibility HIJMPLPPBPDHAAAAJEJFBLOF HIJMPLPPBPDHAAAAJEJFBLOF
Class1.2-194160_BLA_01_reg fire
Class1.2-194160_BLA_01_reg setViewerMask 16383
Class1.2-194160_BLA_01_reg setPickable 1

set hideNewModules 0
create HxSpatialGraphView {Class1.2-194161_BLA_01_merge_reg}
Class1.2-194161_BLA_01_merge_reg setIconPosition 611 2646
Class1.2-194161_BLA_01_merge_reg data connect 194161_BLA_01_merge_reg.am
Class1.2-194161_BLA_01_merge_reg nodeColormap setDefaultColor 1 0.8 0.5
Class1.2-194161_BLA_01_merge_reg nodeColormap setDefaultAlpha 0.500000
Class1.2-194161_BLA_01_merge_reg nodeColormap setLocalRange 0
Class1.2-194161_BLA_01_merge_reg nodeColormap connect physics.icol
Class1.2-194161_BLA_01_merge_reg segmentColormap setDefaultColor 1 0.8 0.5
Class1.2-194161_BLA_01_merge_reg segmentColormap setDefaultAlpha 0.500000
Class1.2-194161_BLA_01_merge_reg segmentColormap setLocalRange 0
Class1.2-194161_BLA_01_merge_reg segmentColormap connect physics.icol
Class1.2-194161_BLA_01_merge_reg fire
Class1.2-194161_BLA_01_merge_reg itemsToShow setValue 0 1
Class1.2-194161_BLA_01_merge_reg itemsToShow setToggleVisible 0 1
Class1.2-194161_BLA_01_merge_reg itemsToShow setValue 1 1
Class1.2-194161_BLA_01_merge_reg itemsToShow setToggleVisible 1 1
Class1.2-194161_BLA_01_merge_reg nodeScale setIndex 0 0
Class1.2-194161_BLA_01_merge_reg nodeScaleFactor setMinMax 0 634
Class1.2-194161_BLA_01_merge_reg nodeScaleFactor setButtons 0
Class1.2-194161_BLA_01_merge_reg nodeScaleFactor setIncrement 42.2667
Class1.2-194161_BLA_01_merge_reg nodeScaleFactor setValue 10
Class1.2-194161_BLA_01_merge_reg nodeScaleFactor setSubMinMax 0 634
Class1.2-194161_BLA_01_merge_reg nodeColoring setIndex 0 0
Class1.2-194161_BLA_01_merge_reg nodeLabelColoringOptions setValue 0
Class1.2-194161_BLA_01_merge_reg nodeColor setColor 0 0.5 0.5 0.5
Class1.2-194161_BLA_01_merge_reg segmentStyle setValue 0 1
Class1.2-194161_BLA_01_merge_reg segmentStyle setToggleVisible 0 1
Class1.2-194161_BLA_01_merge_reg segmentStyle setValue 1 0
Class1.2-194161_BLA_01_merge_reg segmentStyle setToggleVisible 1 1
Class1.2-194161_BLA_01_merge_reg segmentStyle setValue 2 0
Class1.2-194161_BLA_01_merge_reg segmentStyle setToggleVisible 2 1
Class1.2-194161_BLA_01_merge_reg tubeScale setIndex 0 0
Class1.2-194161_BLA_01_merge_reg tubeScaleFactor setMinMax 0 10
Class1.2-194161_BLA_01_merge_reg tubeScaleFactor setButtons 0
Class1.2-194161_BLA_01_merge_reg tubeScaleFactor setIncrement 0.666667
Class1.2-194161_BLA_01_merge_reg tubeScaleFactor setValue 0.2
Class1.2-194161_BLA_01_merge_reg tubeScaleFactor setSubMinMax 0 10
Class1.2-194161_BLA_01_merge_reg segmentWidth setMinMax 0 10
Class1.2-194161_BLA_01_merge_reg segmentWidth setButtons 0
Class1.2-194161_BLA_01_merge_reg segmentWidth setIncrement 0.666667
Class1.2-194161_BLA_01_merge_reg segmentWidth setValue 2
Class1.2-194161_BLA_01_merge_reg segmentWidth setSubMinMax 0 10
Class1.2-194161_BLA_01_merge_reg segmentColoring setIndex 0 0
Class1.2-194161_BLA_01_merge_reg segmentLabelColoringOptions setValue 0
Class1.2-194161_BLA_01_merge_reg segmentColor setColor 0 0.06975 0.739024 0.93
{Class1.2-194161_BLA_01_merge_reg} setVisibility HIJMPLPPBPDPAAAAAOCOBPOB HIJMPLPPBPDPAAAAAOCOBPOB
Class1.2-194161_BLA_01_merge_reg fire
Class1.2-194161_BLA_01_merge_reg setViewerMask 16383
Class1.2-194161_BLA_01_merge_reg setPickable 1

set hideNewModules 0
create HxSpatialGraphView {Class1.2-194161_yzw20200421_right_BLA_01_reg}
Class1.2-194161_yzw20200421_right_BLA_01_reg setIconPosition 539 2676
Class1.2-194161_yzw20200421_right_BLA_01_reg data connect 194161_yzw20200421_right_BLA_01_reg.am
Class1.2-194161_yzw20200421_right_BLA_01_reg nodeColormap setDefaultColor 1 0.8 0.5
Class1.2-194161_yzw20200421_right_BLA_01_reg nodeColormap setDefaultAlpha 0.500000
Class1.2-194161_yzw20200421_right_BLA_01_reg nodeColormap setLocalRange 0
Class1.2-194161_yzw20200421_right_BLA_01_reg nodeColormap connect physics.icol
Class1.2-194161_yzw20200421_right_BLA_01_reg segmentColormap setDefaultColor 1 0.8 0.5
Class1.2-194161_yzw20200421_right_BLA_01_reg segmentColormap setDefaultAlpha 0.500000
Class1.2-194161_yzw20200421_right_BLA_01_reg segmentColormap setLocalRange 0
Class1.2-194161_yzw20200421_right_BLA_01_reg segmentColormap connect physics.icol
Class1.2-194161_yzw20200421_right_BLA_01_reg fire
Class1.2-194161_yzw20200421_right_BLA_01_reg itemsToShow setValue 0 1
Class1.2-194161_yzw20200421_right_BLA_01_reg itemsToShow setToggleVisible 0 1
Class1.2-194161_yzw20200421_right_BLA_01_reg itemsToShow setValue 1 1
Class1.2-194161_yzw20200421_right_BLA_01_reg itemsToShow setToggleVisible 1 1
Class1.2-194161_yzw20200421_right_BLA_01_reg nodeScale setIndex 0 0
Class1.2-194161_yzw20200421_right_BLA_01_reg nodeScaleFactor setMinMax 0 381
Class1.2-194161_yzw20200421_right_BLA_01_reg nodeScaleFactor setButtons 0
Class1.2-194161_yzw20200421_right_BLA_01_reg nodeScaleFactor setIncrement 25.4
Class1.2-194161_yzw20200421_right_BLA_01_reg nodeScaleFactor setValue 10
Class1.2-194161_yzw20200421_right_BLA_01_reg nodeScaleFactor setSubMinMax 0 381
Class1.2-194161_yzw20200421_right_BLA_01_reg nodeColoring setIndex 0 0
Class1.2-194161_yzw20200421_right_BLA_01_reg nodeLabelColoringOptions setValue 0
Class1.2-194161_yzw20200421_right_BLA_01_reg nodeColor setColor 0 0.5 0.5 0.5
Class1.2-194161_yzw20200421_right_BLA_01_reg segmentStyle setValue 0 1
Class1.2-194161_yzw20200421_right_BLA_01_reg segmentStyle setToggleVisible 0 1
Class1.2-194161_yzw20200421_right_BLA_01_reg segmentStyle setValue 1 0
Class1.2-194161_yzw20200421_right_BLA_01_reg segmentStyle setToggleVisible 1 1
Class1.2-194161_yzw20200421_right_BLA_01_reg segmentStyle setValue 2 0
Class1.2-194161_yzw20200421_right_BLA_01_reg segmentStyle setToggleVisible 2 1
Class1.2-194161_yzw20200421_right_BLA_01_reg tubeScale setIndex 0 0
Class1.2-194161_yzw20200421_right_BLA_01_reg tubeScaleFactor setMinMax 0 10
Class1.2-194161_yzw20200421_right_BLA_01_reg tubeScaleFactor setButtons 0
Class1.2-194161_yzw20200421_right_BLA_01_reg tubeScaleFactor setIncrement 0.666667
Class1.2-194161_yzw20200421_right_BLA_01_reg tubeScaleFactor setValue 0.2
Class1.2-194161_yzw20200421_right_BLA_01_reg tubeScaleFactor setSubMinMax 0 10
Class1.2-194161_yzw20200421_right_BLA_01_reg segmentWidth setMinMax 0 10
Class1.2-194161_yzw20200421_right_BLA_01_reg segmentWidth setButtons 0
Class1.2-194161_yzw20200421_right_BLA_01_reg segmentWidth setIncrement 0.666667
Class1.2-194161_yzw20200421_right_BLA_01_reg segmentWidth setValue 2
Class1.2-194161_yzw20200421_right_BLA_01_reg segmentWidth setSubMinMax 0 10
Class1.2-194161_yzw20200421_right_BLA_01_reg segmentColoring setIndex 0 0
Class1.2-194161_yzw20200421_right_BLA_01_reg segmentLabelColoringOptions setValue 0
Class1.2-194161_yzw20200421_right_BLA_01_reg segmentColor setColor 0 0.232099 0.230622 0.969
{Class1.2-194161_yzw20200421_right_BLA_01_reg} setVisibility HIJMPLPPBPBFAAAAIHIIAPPB HIJMPLPPBPBFAAAAIHIIAPPB
Class1.2-194161_yzw20200421_right_BLA_01_reg fire
Class1.2-194161_yzw20200421_right_BLA_01_reg setViewerMask 16383
Class1.2-194161_yzw20200421_right_BLA_01_reg setPickable 1

set hideNewModules 0
create HxSpatialGraphView {Class1.3-194161_20200526_right_layer2_anterior_reg}
Class1.3-194161_20200526_right_layer2_anterior_reg setIconPosition 503 2706
Class1.3-194161_20200526_right_layer2_anterior_reg data connect 194161_20200526_right_layer2_anterior_reg.am
Class1.3-194161_20200526_right_layer2_anterior_reg nodeColormap setDefaultColor 1 0.8 0.5
Class1.3-194161_20200526_right_layer2_anterior_reg nodeColormap setDefaultAlpha 0.500000
Class1.3-194161_20200526_right_layer2_anterior_reg nodeColormap setLocalRange 0
Class1.3-194161_20200526_right_layer2_anterior_reg nodeColormap connect physics.icol
Class1.3-194161_20200526_right_layer2_anterior_reg segmentColormap setDefaultColor 1 0.8 0.5
Class1.3-194161_20200526_right_layer2_anterior_reg segmentColormap setDefaultAlpha 0.500000
Class1.3-194161_20200526_right_layer2_anterior_reg segmentColormap setLocalRange 0
Class1.3-194161_20200526_right_layer2_anterior_reg segmentColormap connect physics.icol
Class1.3-194161_20200526_right_layer2_anterior_reg fire
Class1.3-194161_20200526_right_layer2_anterior_reg itemsToShow setValue 0 1
Class1.3-194161_20200526_right_layer2_anterior_reg itemsToShow setToggleVisible 0 1
Class1.3-194161_20200526_right_layer2_anterior_reg itemsToShow setValue 1 1
Class1.3-194161_20200526_right_layer2_anterior_reg itemsToShow setToggleVisible 1 1
Class1.3-194161_20200526_right_layer2_anterior_reg nodeScale setIndex 0 0
Class1.3-194161_20200526_right_layer2_anterior_reg nodeScaleFactor setMinMax 0 420
Class1.3-194161_20200526_right_layer2_anterior_reg nodeScaleFactor setButtons 0
Class1.3-194161_20200526_right_layer2_anterior_reg nodeScaleFactor setIncrement 28
Class1.3-194161_20200526_right_layer2_anterior_reg nodeScaleFactor setValue 10
Class1.3-194161_20200526_right_layer2_anterior_reg nodeScaleFactor setSubMinMax 0 420
Class1.3-194161_20200526_right_layer2_anterior_reg nodeColoring setIndex 0 0
Class1.3-194161_20200526_right_layer2_anterior_reg nodeLabelColoringOptions setValue 0
Class1.3-194161_20200526_right_layer2_anterior_reg nodeColor setColor 0 0.5 0.5 0.5
Class1.3-194161_20200526_right_layer2_anterior_reg segmentStyle setValue 0 1
Class1.3-194161_20200526_right_layer2_anterior_reg segmentStyle setToggleVisible 0 1
Class1.3-194161_20200526_right_layer2_anterior_reg segmentStyle setValue 1 0
Class1.3-194161_20200526_right_layer2_anterior_reg segmentStyle setToggleVisible 1 1
Class1.3-194161_20200526_right_layer2_anterior_reg segmentStyle setValue 2 0
Class1.3-194161_20200526_right_layer2_anterior_reg segmentStyle setToggleVisible 2 1
Class1.3-194161_20200526_right_layer2_anterior_reg tubeScale setIndex 0 0
Class1.3-194161_20200526_right_layer2_anterior_reg tubeScaleFactor setMinMax 0 10
Class1.3-194161_20200526_right_layer2_anterior_reg tubeScaleFactor setButtons 0
Class1.3-194161_20200526_right_layer2_anterior_reg tubeScaleFactor setIncrement 0.666667
Class1.3-194161_20200526_right_layer2_anterior_reg tubeScaleFactor setValue 0.2
Class1.3-194161_20200526_right_layer2_anterior_reg tubeScaleFactor setSubMinMax 0 10
Class1.3-194161_20200526_right_layer2_anterior_reg segmentWidth setMinMax 0 10
Class1.3-194161_20200526_right_layer2_anterior_reg segmentWidth setButtons 0
Class1.3-194161_20200526_right_layer2_anterior_reg segmentWidth setIncrement 0.666667
Class1.3-194161_20200526_right_layer2_anterior_reg segmentWidth setValue 2
Class1.3-194161_20200526_right_layer2_anterior_reg segmentWidth setSubMinMax 0 10
Class1.3-194161_20200526_right_layer2_anterior_reg segmentColoring setIndex 0 0
Class1.3-194161_20200526_right_layer2_anterior_reg segmentLabelColoringOptions setValue 0
Class1.3-194161_20200526_right_layer2_anterior_reg segmentColor setColor 0 0.898 0 0.495696
{Class1.3-194161_20200526_right_layer2_anterior_reg} setVisibility HIJMPLPPBPBDAAAANBECBDON HIJMPLPPBPBDAAAANBECBDON
Class1.3-194161_20200526_right_layer2_anterior_reg fire
Class1.3-194161_20200526_right_layer2_anterior_reg setViewerMask 16383
Class1.3-194161_20200526_right_layer2_anterior_reg setPickable 1

set hideNewModules 0
create HxSpatialGraphView {Class2-190117_yzw_01_adjusted_reg}
Class2-190117_yzw_01_adjusted_reg setIconPosition 605 2736
Class2-190117_yzw_01_adjusted_reg data connect 190117_yzw_01_adjusted_reg.am
Class2-190117_yzw_01_adjusted_reg nodeColormap setDefaultColor 1 0.8 0.5
Class2-190117_yzw_01_adjusted_reg nodeColormap setDefaultAlpha 0.500000
Class2-190117_yzw_01_adjusted_reg nodeColormap setLocalRange 0
Class2-190117_yzw_01_adjusted_reg nodeColormap connect physics.icol
Class2-190117_yzw_01_adjusted_reg segmentColormap setDefaultColor 1 0.8 0.5
Class2-190117_yzw_01_adjusted_reg segmentColormap setDefaultAlpha 0.500000
Class2-190117_yzw_01_adjusted_reg segmentColormap setLocalRange 0
Class2-190117_yzw_01_adjusted_reg segmentColormap connect physics.icol
Class2-190117_yzw_01_adjusted_reg fire
Class2-190117_yzw_01_adjusted_reg itemsToShow setValue 0 1
Class2-190117_yzw_01_adjusted_reg itemsToShow setToggleVisible 0 1
Class2-190117_yzw_01_adjusted_reg itemsToShow setValue 1 1
Class2-190117_yzw_01_adjusted_reg itemsToShow setToggleVisible 1 1
Class2-190117_yzw_01_adjusted_reg nodeScale setIndex 0 0
Class2-190117_yzw_01_adjusted_reg nodeScaleFactor setMinMax 0 473
Class2-190117_yzw_01_adjusted_reg nodeScaleFactor setButtons 0
Class2-190117_yzw_01_adjusted_reg nodeScaleFactor setIncrement 31.5333
Class2-190117_yzw_01_adjusted_reg nodeScaleFactor setValue 10
Class2-190117_yzw_01_adjusted_reg nodeScaleFactor setSubMinMax 0 473
Class2-190117_yzw_01_adjusted_reg nodeColoring setIndex 0 0
Class2-190117_yzw_01_adjusted_reg nodeLabelColoringOptions setValue 0
Class2-190117_yzw_01_adjusted_reg nodeColor setColor 0 0.5 0.5 0.5
Class2-190117_yzw_01_adjusted_reg segmentStyle setValue 0 1
Class2-190117_yzw_01_adjusted_reg segmentStyle setToggleVisible 0 1
Class2-190117_yzw_01_adjusted_reg segmentStyle setValue 1 0
Class2-190117_yzw_01_adjusted_reg segmentStyle setToggleVisible 1 1
Class2-190117_yzw_01_adjusted_reg segmentStyle setValue 2 0
Class2-190117_yzw_01_adjusted_reg segmentStyle setToggleVisible 2 1
Class2-190117_yzw_01_adjusted_reg tubeScale setIndex 0 0
Class2-190117_yzw_01_adjusted_reg tubeScaleFactor setMinMax 0 10
Class2-190117_yzw_01_adjusted_reg tubeScaleFactor setButtons 0
Class2-190117_yzw_01_adjusted_reg tubeScaleFactor setIncrement 0.666667
Class2-190117_yzw_01_adjusted_reg tubeScaleFactor setValue 0.2
Class2-190117_yzw_01_adjusted_reg tubeScaleFactor setSubMinMax 0 10
Class2-190117_yzw_01_adjusted_reg segmentWidth setMinMax 0 10
Class2-190117_yzw_01_adjusted_reg segmentWidth setButtons 0
Class2-190117_yzw_01_adjusted_reg segmentWidth setIncrement 0.666667
Class2-190117_yzw_01_adjusted_reg segmentWidth setValue 2
Class2-190117_yzw_01_adjusted_reg segmentWidth setSubMinMax 0 10
Class2-190117_yzw_01_adjusted_reg segmentColoring setIndex 0 0
Class2-190117_yzw_01_adjusted_reg segmentLabelColoringOptions setValue 0
Class2-190117_yzw_01_adjusted_reg segmentColor setColor 0 1 0.81436 0.22
{Class2-190117_yzw_01_adjusted_reg} setVisibility HIJMPLPPBPBFAAAAIHIIAPPB HIJMPLPPBPBFAAAAIHIIAPPB
Class2-190117_yzw_01_adjusted_reg fire
Class2-190117_yzw_01_adjusted_reg setViewerMask 16383
Class2-190117_yzw_01_adjusted_reg setPickable 1

set hideNewModules 0
create HxSpatialGraphView {Class1.2-194161_20200522_BLA_right_layer2_reg}
Class1.2-194161_20200522_BLA_right_layer2_reg setIconPosition 533 2616
Class1.2-194161_20200522_BLA_right_layer2_reg data connect 194161_20200522_BLA_right_layer2_reg.am
Class1.2-194161_20200522_BLA_right_layer2_reg nodeColormap setDefaultColor 1 0.8 0.5
Class1.2-194161_20200522_BLA_right_layer2_reg nodeColormap setDefaultAlpha 0.500000
Class1.2-194161_20200522_BLA_right_layer2_reg nodeColormap setLocalRange 0
Class1.2-194161_20200522_BLA_right_layer2_reg nodeColormap connect physics.icol
Class1.2-194161_20200522_BLA_right_layer2_reg segmentColormap setDefaultColor 1 0.8 0.5
Class1.2-194161_20200522_BLA_right_layer2_reg segmentColormap setDefaultAlpha 0.500000
Class1.2-194161_20200522_BLA_right_layer2_reg segmentColormap setLocalRange 0
Class1.2-194161_20200522_BLA_right_layer2_reg segmentColormap connect physics.icol
Class1.2-194161_20200522_BLA_right_layer2_reg fire
Class1.2-194161_20200522_BLA_right_layer2_reg itemsToShow setValue 0 1
Class1.2-194161_20200522_BLA_right_layer2_reg itemsToShow setToggleVisible 0 1
Class1.2-194161_20200522_BLA_right_layer2_reg itemsToShow setValue 1 1
Class1.2-194161_20200522_BLA_right_layer2_reg itemsToShow setToggleVisible 1 1
Class1.2-194161_20200522_BLA_right_layer2_reg nodeScale setIndex 0 0
Class1.2-194161_20200522_BLA_right_layer2_reg nodeScaleFactor setMinMax 0 645
Class1.2-194161_20200522_BLA_right_layer2_reg nodeScaleFactor setButtons 0
Class1.2-194161_20200522_BLA_right_layer2_reg nodeScaleFactor setIncrement 43
Class1.2-194161_20200522_BLA_right_layer2_reg nodeScaleFactor setValue 10
Class1.2-194161_20200522_BLA_right_layer2_reg nodeScaleFactor setSubMinMax 0 645
Class1.2-194161_20200522_BLA_right_layer2_reg nodeColoring setIndex 0 0
Class1.2-194161_20200522_BLA_right_layer2_reg nodeLabelColoringOptions setValue 0
Class1.2-194161_20200522_BLA_right_layer2_reg nodeColor setColor 0 0.5 0.5 0.5
Class1.2-194161_20200522_BLA_right_layer2_reg segmentStyle setValue 0 1
Class1.2-194161_20200522_BLA_right_layer2_reg segmentStyle setToggleVisible 0 1
Class1.2-194161_20200522_BLA_right_layer2_reg segmentStyle setValue 1 0
Class1.2-194161_20200522_BLA_right_layer2_reg segmentStyle setToggleVisible 1 1
Class1.2-194161_20200522_BLA_right_layer2_reg segmentStyle setValue 2 0
Class1.2-194161_20200522_BLA_right_layer2_reg segmentStyle setToggleVisible 2 1
Class1.2-194161_20200522_BLA_right_layer2_reg tubeScale setIndex 0 0
Class1.2-194161_20200522_BLA_right_layer2_reg tubeScaleFactor setMinMax 0 10
Class1.2-194161_20200522_BLA_right_layer2_reg tubeScaleFactor setButtons 0
Class1.2-194161_20200522_BLA_right_layer2_reg tubeScaleFactor setIncrement 0.666667
Class1.2-194161_20200522_BLA_right_layer2_reg tubeScaleFactor setValue 0.2
Class1.2-194161_20200522_BLA_right_layer2_reg tubeScaleFactor setSubMinMax 0 10
Class1.2-194161_20200522_BLA_right_layer2_reg segmentWidth setMinMax 0 10
Class1.2-194161_20200522_BLA_right_layer2_reg segmentWidth setButtons 0
Class1.2-194161_20200522_BLA_right_layer2_reg segmentWidth setIncrement 0.666667
Class1.2-194161_20200522_BLA_right_layer2_reg segmentWidth setValue 2
Class1.2-194161_20200522_BLA_right_layer2_reg segmentWidth setSubMinMax 0 10
Class1.2-194161_20200522_BLA_right_layer2_reg segmentColoring setIndex 0 0
Class1.2-194161_20200522_BLA_right_layer2_reg segmentLabelColoringOptions setValue 0
Class1.2-194161_20200522_BLA_right_layer2_reg segmentColor setColor 0 0 0.62608 0.91
{Class1.2-194161_20200522_BLA_right_layer2_reg} setVisibility HIJMPLPPJPDIAAAADBCBCHNJ HIJMPLPPJPDIAAAADBCBCHNJ
Class1.2-194161_20200522_BLA_right_layer2_reg fire
Class1.2-194161_20200522_BLA_right_layer2_reg setViewerMask 16383
Class1.2-194161_20200522_BLA_right_layer2_reg setPickable 1

set hideNewModules 0
create HxSpatialGraphView {Class2-194161_yzw20200420_left_03_reg}
Class2-194161_yzw20200420_left_03_reg setIconPosition 581 2766
Class2-194161_yzw20200420_left_03_reg data connect 194161_yzw20200420_left_03_reg.am
Class2-194161_yzw20200420_left_03_reg nodeColormap setDefaultColor 1 0.8 0.5
Class2-194161_yzw20200420_left_03_reg nodeColormap setDefaultAlpha 0.500000
Class2-194161_yzw20200420_left_03_reg nodeColormap setLocalRange 0
Class2-194161_yzw20200420_left_03_reg nodeColormap connect physics.icol
Class2-194161_yzw20200420_left_03_reg segmentColormap setDefaultColor 1 0.8 0.5
Class2-194161_yzw20200420_left_03_reg segmentColormap setDefaultAlpha 0.500000
Class2-194161_yzw20200420_left_03_reg segmentColormap setLocalRange 0
Class2-194161_yzw20200420_left_03_reg segmentColormap connect physics.icol
Class2-194161_yzw20200420_left_03_reg fire
Class2-194161_yzw20200420_left_03_reg itemsToShow setValue 0 1
Class2-194161_yzw20200420_left_03_reg itemsToShow setToggleVisible 0 1
Class2-194161_yzw20200420_left_03_reg itemsToShow setValue 1 1
Class2-194161_yzw20200420_left_03_reg itemsToShow setToggleVisible 1 1
Class2-194161_yzw20200420_left_03_reg nodeScale setIndex 0 0
Class2-194161_yzw20200420_left_03_reg nodeScaleFactor setMinMax 0 581
Class2-194161_yzw20200420_left_03_reg nodeScaleFactor setButtons 0
Class2-194161_yzw20200420_left_03_reg nodeScaleFactor setIncrement 38.7333
Class2-194161_yzw20200420_left_03_reg nodeScaleFactor setValue 10
Class2-194161_yzw20200420_left_03_reg nodeScaleFactor setSubMinMax 0 581
Class2-194161_yzw20200420_left_03_reg nodeColoring setIndex 0 0
Class2-194161_yzw20200420_left_03_reg nodeLabelColoringOptions setValue 0
Class2-194161_yzw20200420_left_03_reg nodeColor setColor 0 0.5 0.5 0.5
Class2-194161_yzw20200420_left_03_reg segmentStyle setValue 0 1
Class2-194161_yzw20200420_left_03_reg segmentStyle setToggleVisible 0 1
Class2-194161_yzw20200420_left_03_reg segmentStyle setValue 1 0
Class2-194161_yzw20200420_left_03_reg segmentStyle setToggleVisible 1 1
Class2-194161_yzw20200420_left_03_reg segmentStyle setValue 2 0
Class2-194161_yzw20200420_left_03_reg segmentStyle setToggleVisible 2 1
Class2-194161_yzw20200420_left_03_reg tubeScale setIndex 0 0
Class2-194161_yzw20200420_left_03_reg tubeScaleFactor setMinMax 0 10
Class2-194161_yzw20200420_left_03_reg tubeScaleFactor setButtons 0
Class2-194161_yzw20200420_left_03_reg tubeScaleFactor setIncrement 0.666667
Class2-194161_yzw20200420_left_03_reg tubeScaleFactor setValue 0.2
Class2-194161_yzw20200420_left_03_reg tubeScaleFactor setSubMinMax 0 10
Class2-194161_yzw20200420_left_03_reg segmentWidth setMinMax 0 10
Class2-194161_yzw20200420_left_03_reg segmentWidth setButtons 0
Class2-194161_yzw20200420_left_03_reg segmentWidth setIncrement 0.666667
Class2-194161_yzw20200420_left_03_reg segmentWidth setValue 2
Class2-194161_yzw20200420_left_03_reg segmentWidth setSubMinMax 0 10
Class2-194161_yzw20200420_left_03_reg segmentColoring setIndex 0 0
Class2-194161_yzw20200420_left_03_reg segmentLabelColoringOptions setValue 0
Class2-194161_yzw20200420_left_03_reg segmentColor setColor 0 0.967 0.688504 0.27076
{Class2-194161_yzw20200420_left_03_reg} setVisibility HIJMPLPPBPDPAAAAAOCOBPOB HIJMPLPPBPDPAAAAAOCOBPOB
Class2-194161_yzw20200420_left_03_reg fire
Class2-194161_yzw20200420_left_03_reg setViewerMask 16383
Class2-194161_yzw20200420_left_03_reg setPickable 1

set hideNewModules 0
create HxSpatialGraphView {Class2-194161_yzw20200519_MS_01_reg}
Class2-194161_yzw20200519_MS_01_reg setIconPosition 593 2796
Class2-194161_yzw20200519_MS_01_reg data connect 194161_yzw20200519_MS_01_reg.am
Class2-194161_yzw20200519_MS_01_reg nodeColormap setDefaultColor 1 0.8 0.5
Class2-194161_yzw20200519_MS_01_reg nodeColormap setDefaultAlpha 0.500000
Class2-194161_yzw20200519_MS_01_reg nodeColormap setLocalRange 0
Class2-194161_yzw20200519_MS_01_reg nodeColormap connect physics.icol
Class2-194161_yzw20200519_MS_01_reg segmentColormap setDefaultColor 1 0.8 0.5
Class2-194161_yzw20200519_MS_01_reg segmentColormap setDefaultAlpha 0.500000
Class2-194161_yzw20200519_MS_01_reg segmentColormap setLocalRange 0
Class2-194161_yzw20200519_MS_01_reg segmentColormap connect physics.icol
Class2-194161_yzw20200519_MS_01_reg fire
Class2-194161_yzw20200519_MS_01_reg itemsToShow setValue 0 1
Class2-194161_yzw20200519_MS_01_reg itemsToShow setToggleVisible 0 1
Class2-194161_yzw20200519_MS_01_reg itemsToShow setValue 1 1
Class2-194161_yzw20200519_MS_01_reg itemsToShow setToggleVisible 1 1
Class2-194161_yzw20200519_MS_01_reg nodeScale setIndex 0 0
Class2-194161_yzw20200519_MS_01_reg nodeScaleFactor setMinMax 0 598
Class2-194161_yzw20200519_MS_01_reg nodeScaleFactor setButtons 0
Class2-194161_yzw20200519_MS_01_reg nodeScaleFactor setIncrement 39.8667
Class2-194161_yzw20200519_MS_01_reg nodeScaleFactor setValue 10
Class2-194161_yzw20200519_MS_01_reg nodeScaleFactor setSubMinMax 0 598
Class2-194161_yzw20200519_MS_01_reg nodeColoring setIndex 0 0
Class2-194161_yzw20200519_MS_01_reg nodeLabelColoringOptions setValue 0
Class2-194161_yzw20200519_MS_01_reg nodeColor setColor 0 0.5 0.5 0.5
Class2-194161_yzw20200519_MS_01_reg segmentStyle setValue 0 1
Class2-194161_yzw20200519_MS_01_reg segmentStyle setToggleVisible 0 1
Class2-194161_yzw20200519_MS_01_reg segmentStyle setValue 1 0
Class2-194161_yzw20200519_MS_01_reg segmentStyle setToggleVisible 1 1
Class2-194161_yzw20200519_MS_01_reg segmentStyle setValue 2 0
Class2-194161_yzw20200519_MS_01_reg segmentStyle setToggleVisible 2 1
Class2-194161_yzw20200519_MS_01_reg tubeScale setIndex 0 0
Class2-194161_yzw20200519_MS_01_reg tubeScaleFactor setMinMax 0 10
Class2-194161_yzw20200519_MS_01_reg tubeScaleFactor setButtons 0
Class2-194161_yzw20200519_MS_01_reg tubeScaleFactor setIncrement 0.666667
Class2-194161_yzw20200519_MS_01_reg tubeScaleFactor setValue 0.2
Class2-194161_yzw20200519_MS_01_reg tubeScaleFactor setSubMinMax 0 10
Class2-194161_yzw20200519_MS_01_reg segmentWidth setMinMax 0 10
Class2-194161_yzw20200519_MS_01_reg segmentWidth setButtons 0
Class2-194161_yzw20200519_MS_01_reg segmentWidth setIncrement 0.666667
Class2-194161_yzw20200519_MS_01_reg segmentWidth setValue 2
Class2-194161_yzw20200519_MS_01_reg segmentWidth setSubMinMax 0 10
Class2-194161_yzw20200519_MS_01_reg segmentColoring setIndex 0 0
Class2-194161_yzw20200519_MS_01_reg segmentLabelColoringOptions setValue 0
Class2-194161_yzw20200519_MS_01_reg segmentColor setColor 0 0.612 0.51408 0
{Class2-194161_yzw20200519_MS_01_reg} setVisibility HIJMPLPPJPDMAAAADGFGDHMJ HIJMPLPPJPDMAAAADGFGDHMJ
Class2-194161_yzw20200519_MS_01_reg fire
Class2-194161_yzw20200519_MS_01_reg setViewerMask 16383
Class2-194161_yzw20200519_MS_01_reg setPickable 1

set hideNewModules 0
create HxSpatialGraphView {Class2-200003_20200602_right_layer6_reg}
Class2-200003_20200602_right_layer6_reg setIconPosition 569 2826
Class2-200003_20200602_right_layer6_reg data connect 200003_20200602_right_layer6_reg.am
Class2-200003_20200602_right_layer6_reg nodeColormap setDefaultColor 1 0.8 0.5
Class2-200003_20200602_right_layer6_reg nodeColormap setDefaultAlpha 0.500000
Class2-200003_20200602_right_layer6_reg nodeColormap setLocalRange 0
Class2-200003_20200602_right_layer6_reg nodeColormap connect physics.icol
Class2-200003_20200602_right_layer6_reg segmentColormap setDefaultColor 1 0.8 0.5
Class2-200003_20200602_right_layer6_reg segmentColormap setDefaultAlpha 0.500000
Class2-200003_20200602_right_layer6_reg segmentColormap setLocalRange 0
Class2-200003_20200602_right_layer6_reg segmentColormap connect physics.icol
Class2-200003_20200602_right_layer6_reg fire
Class2-200003_20200602_right_layer6_reg itemsToShow setValue 0 1
Class2-200003_20200602_right_layer6_reg itemsToShow setToggleVisible 0 1
Class2-200003_20200602_right_layer6_reg itemsToShow setValue 1 1
Class2-200003_20200602_right_layer6_reg itemsToShow setToggleVisible 1 1
Class2-200003_20200602_right_layer6_reg nodeScale setIndex 0 0
Class2-200003_20200602_right_layer6_reg nodeScaleFactor setMinMax 0 654
Class2-200003_20200602_right_layer6_reg nodeScaleFactor setButtons 0
Class2-200003_20200602_right_layer6_reg nodeScaleFactor setIncrement 43.6
Class2-200003_20200602_right_layer6_reg nodeScaleFactor setValue 10
Class2-200003_20200602_right_layer6_reg nodeScaleFactor setSubMinMax 0 654
Class2-200003_20200602_right_layer6_reg nodeColoring setIndex 0 0
Class2-200003_20200602_right_layer6_reg nodeLabelColoringOptions setValue 0
Class2-200003_20200602_right_layer6_reg nodeColor setColor 0 0.5 0.5 0.5
Class2-200003_20200602_right_layer6_reg segmentStyle setValue 0 1
Class2-200003_20200602_right_layer6_reg segmentStyle setToggleVisible 0 1
Class2-200003_20200602_right_layer6_reg segmentStyle setValue 1 0
Class2-200003_20200602_right_layer6_reg segmentStyle setToggleVisible 1 1
Class2-200003_20200602_right_layer6_reg segmentStyle setValue 2 0
Class2-200003_20200602_right_layer6_reg segmentStyle setToggleVisible 2 1
Class2-200003_20200602_right_layer6_reg tubeScale setIndex 0 0
Class2-200003_20200602_right_layer6_reg tubeScaleFactor setMinMax 0 10
Class2-200003_20200602_right_layer6_reg tubeScaleFactor setButtons 0
Class2-200003_20200602_right_layer6_reg tubeScaleFactor setIncrement 0.666667
Class2-200003_20200602_right_layer6_reg tubeScaleFactor setValue 0.2
Class2-200003_20200602_right_layer6_reg tubeScaleFactor setSubMinMax 0 10
Class2-200003_20200602_right_layer6_reg segmentWidth setMinMax 0 10
Class2-200003_20200602_right_layer6_reg segmentWidth setButtons 0
Class2-200003_20200602_right_layer6_reg segmentWidth setIncrement 0.666667
Class2-200003_20200602_right_layer6_reg segmentWidth setValue 2
Class2-200003_20200602_right_layer6_reg segmentWidth setSubMinMax 0 10
Class2-200003_20200602_right_layer6_reg segmentColoring setIndex 0 0
Class2-200003_20200602_right_layer6_reg segmentLabelColoringOptions setValue 0
Class2-200003_20200602_right_layer6_reg segmentColor setColor 0 0.753919 0.913 0.25564
{Class2-200003_20200602_right_layer6_reg} setVisibility HIJMPLPPJPHIAAAANKHLCLNF HIJMPLPPJPDEAAAAJDNECPNB
Class2-200003_20200602_right_layer6_reg fire
Class2-200003_20200602_right_layer6_reg setViewerMask 16383
Class2-200003_20200602_right_layer6_reg setPickable 1

set hideNewModules 0
create HxSpatialGraphView {Class3-190117_hyx_01_reg}
Class3-190117_hyx_01_reg setIconPosition 659 2856
Class3-190117_hyx_01_reg data connect 190117_hyx_01_reg.am
Class3-190117_hyx_01_reg nodeColormap setDefaultColor 1 0.8 0.5
Class3-190117_hyx_01_reg nodeColormap setDefaultAlpha 0.500000
Class3-190117_hyx_01_reg nodeColormap setLocalRange 0
Class3-190117_hyx_01_reg nodeColormap connect physics.icol
Class3-190117_hyx_01_reg segmentColormap setDefaultColor 1 0.8 0.5
Class3-190117_hyx_01_reg segmentColormap setDefaultAlpha 0.500000
Class3-190117_hyx_01_reg segmentColormap setLocalRange 0
Class3-190117_hyx_01_reg segmentColormap connect physics.icol
Class3-190117_hyx_01_reg fire
Class3-190117_hyx_01_reg itemsToShow setValue 0 1
Class3-190117_hyx_01_reg itemsToShow setToggleVisible 0 1
Class3-190117_hyx_01_reg itemsToShow setValue 1 1
Class3-190117_hyx_01_reg itemsToShow setToggleVisible 1 1
Class3-190117_hyx_01_reg nodeScale setIndex 0 0
Class3-190117_hyx_01_reg nodeScaleFactor setMinMax 0 275
Class3-190117_hyx_01_reg nodeScaleFactor setButtons 0
Class3-190117_hyx_01_reg nodeScaleFactor setIncrement 18.3333
Class3-190117_hyx_01_reg nodeScaleFactor setValue 10
Class3-190117_hyx_01_reg nodeScaleFactor setSubMinMax 0 275
Class3-190117_hyx_01_reg nodeColoring setIndex 0 0
Class3-190117_hyx_01_reg nodeLabelColoringOptions setValue 0
Class3-190117_hyx_01_reg nodeColor setColor 0 0.5 0.5 0.5
Class3-190117_hyx_01_reg segmentStyle setValue 0 1
Class3-190117_hyx_01_reg segmentStyle setToggleVisible 0 1
Class3-190117_hyx_01_reg segmentStyle setValue 1 0
Class3-190117_hyx_01_reg segmentStyle setToggleVisible 1 1
Class3-190117_hyx_01_reg segmentStyle setValue 2 0
Class3-190117_hyx_01_reg segmentStyle setToggleVisible 2 1
Class3-190117_hyx_01_reg tubeScale setIndex 0 0
Class3-190117_hyx_01_reg tubeScaleFactor setMinMax 0 10
Class3-190117_hyx_01_reg tubeScaleFactor setButtons 0
Class3-190117_hyx_01_reg tubeScaleFactor setIncrement 0.666667
Class3-190117_hyx_01_reg tubeScaleFactor setValue 0.2
Class3-190117_hyx_01_reg tubeScaleFactor setSubMinMax 0 10
Class3-190117_hyx_01_reg segmentWidth setMinMax 0 10
Class3-190117_hyx_01_reg segmentWidth setButtons 0
Class3-190117_hyx_01_reg segmentWidth setIncrement 0.666667
Class3-190117_hyx_01_reg segmentWidth setValue 2
Class3-190117_hyx_01_reg segmentWidth setSubMinMax 0 10
Class3-190117_hyx_01_reg segmentColoring setIndex 0 0
Class3-190117_hyx_01_reg segmentLabelColoringOptions setValue 0
Class3-190117_hyx_01_reg segmentColor setColor 0 0.692346 1 0.227
{Class3-190117_hyx_01_reg} setVisibility HIJMPLPPBPABAAENLOALPF HIJMPLPPBPABAAENLOALPF
Class3-190117_hyx_01_reg fire
Class3-190117_hyx_01_reg setViewerMask 16383
Class3-190117_hyx_01_reg setPickable 1

set hideNewModules 0
create HxSpatialGraphView {Class3-190117_hyx_02_reg}
Class3-190117_hyx_02_reg setIconPosition 659 2886
Class3-190117_hyx_02_reg data connect 190117_hyx_02_reg.am
Class3-190117_hyx_02_reg nodeColormap setDefaultColor 1 0.8 0.5
Class3-190117_hyx_02_reg nodeColormap setDefaultAlpha 0.500000
Class3-190117_hyx_02_reg nodeColormap setLocalRange 0
Class3-190117_hyx_02_reg nodeColormap connect physics.icol
Class3-190117_hyx_02_reg segmentColormap setDefaultColor 1 0.8 0.5
Class3-190117_hyx_02_reg segmentColormap setDefaultAlpha 0.500000
Class3-190117_hyx_02_reg segmentColormap setLocalRange 0
Class3-190117_hyx_02_reg segmentColormap connect physics.icol
Class3-190117_hyx_02_reg fire
Class3-190117_hyx_02_reg itemsToShow setValue 0 1
Class3-190117_hyx_02_reg itemsToShow setToggleVisible 0 1
Class3-190117_hyx_02_reg itemsToShow setValue 1 1
Class3-190117_hyx_02_reg itemsToShow setToggleVisible 1 1
Class3-190117_hyx_02_reg nodeScale setIndex 0 0
Class3-190117_hyx_02_reg nodeScaleFactor setMinMax 0 557
Class3-190117_hyx_02_reg nodeScaleFactor setButtons 0
Class3-190117_hyx_02_reg nodeScaleFactor setIncrement 37.1333
Class3-190117_hyx_02_reg nodeScaleFactor setValue 10
Class3-190117_hyx_02_reg nodeScaleFactor setSubMinMax 0 557
Class3-190117_hyx_02_reg nodeColoring setIndex 0 0
Class3-190117_hyx_02_reg nodeLabelColoringOptions setValue 0
Class3-190117_hyx_02_reg nodeColor setColor 0 0.5 0.5 0.5
Class3-190117_hyx_02_reg segmentStyle setValue 0 1
Class3-190117_hyx_02_reg segmentStyle setToggleVisible 0 1
Class3-190117_hyx_02_reg segmentStyle setValue 1 0
Class3-190117_hyx_02_reg segmentStyle setToggleVisible 1 1
Class3-190117_hyx_02_reg segmentStyle setValue 2 0
Class3-190117_hyx_02_reg segmentStyle setToggleVisible 2 1
Class3-190117_hyx_02_reg tubeScale setIndex 0 0
Class3-190117_hyx_02_reg tubeScaleFactor setMinMax 0 10
Class3-190117_hyx_02_reg tubeScaleFactor setButtons 0
Class3-190117_hyx_02_reg tubeScaleFactor setIncrement 0.666667
Class3-190117_hyx_02_reg tubeScaleFactor setValue 0.2
Class3-190117_hyx_02_reg tubeScaleFactor setSubMinMax 0 10
Class3-190117_hyx_02_reg segmentWidth setMinMax 0 10
Class3-190117_hyx_02_reg segmentWidth setButtons 0
Class3-190117_hyx_02_reg segmentWidth setIncrement 0.666667
Class3-190117_hyx_02_reg segmentWidth setValue 2
Class3-190117_hyx_02_reg segmentWidth setSubMinMax 0 10
Class3-190117_hyx_02_reg segmentColoring setIndex 0 0
Class3-190117_hyx_02_reg segmentLabelColoringOptions setValue 0
Class3-190117_hyx_02_reg segmentColor setColor 0 0.22872 0.953 0.548852
{Class3-190117_hyx_02_reg} setVisibility HIJMPLPPBPACAACDOEAHPJ HIJMPLPPBPACAACDOEAHPJ
Class3-190117_hyx_02_reg fire
Class3-190117_hyx_02_reg setViewerMask 16383
Class3-190117_hyx_02_reg setPickable 1

set hideNewModules 0
create HxSpatialGraphView {Class3-190117_yzw_05_reg}
Class3-190117_yzw_05_reg setIconPosition 659 2916
Class3-190117_yzw_05_reg data connect 190117_yzw_05_reg.am
Class3-190117_yzw_05_reg nodeColormap setDefaultColor 1 0.8 0.5
Class3-190117_yzw_05_reg nodeColormap setDefaultAlpha 0.500000
Class3-190117_yzw_05_reg nodeColormap setLocalRange 0
Class3-190117_yzw_05_reg nodeColormap connect physics.icol
Class3-190117_yzw_05_reg segmentColormap setDefaultColor 1 0.8 0.5
Class3-190117_yzw_05_reg segmentColormap setDefaultAlpha 0.500000
Class3-190117_yzw_05_reg segmentColormap setLocalRange 0
Class3-190117_yzw_05_reg segmentColormap connect physics.icol
Class3-190117_yzw_05_reg fire
Class3-190117_yzw_05_reg itemsToShow setValue 0 1
Class3-190117_yzw_05_reg itemsToShow setToggleVisible 0 1
Class3-190117_yzw_05_reg itemsToShow setValue 1 1
Class3-190117_yzw_05_reg itemsToShow setToggleVisible 1 1
Class3-190117_yzw_05_reg nodeScale setIndex 0 0
Class3-190117_yzw_05_reg nodeScaleFactor setMinMax 0 626
Class3-190117_yzw_05_reg nodeScaleFactor setButtons 0
Class3-190117_yzw_05_reg nodeScaleFactor setIncrement 41.7333
Class3-190117_yzw_05_reg nodeScaleFactor setValue 10
Class3-190117_yzw_05_reg nodeScaleFactor setSubMinMax 0 626
Class3-190117_yzw_05_reg nodeColoring setIndex 0 0
Class3-190117_yzw_05_reg nodeLabelColoringOptions setValue 0
Class3-190117_yzw_05_reg nodeColor setColor 0 0.5 0.5 0.5
Class3-190117_yzw_05_reg segmentStyle setValue 0 1
Class3-190117_yzw_05_reg segmentStyle setToggleVisible 0 1
Class3-190117_yzw_05_reg segmentStyle setValue 1 0
Class3-190117_yzw_05_reg segmentStyle setToggleVisible 1 1
Class3-190117_yzw_05_reg segmentStyle setValue 2 0
Class3-190117_yzw_05_reg segmentStyle setToggleVisible 2 1
Class3-190117_yzw_05_reg tubeScale setIndex 0 0
Class3-190117_yzw_05_reg tubeScaleFactor setMinMax 0 10
Class3-190117_yzw_05_reg tubeScaleFactor setButtons 0
Class3-190117_yzw_05_reg tubeScaleFactor setIncrement 0.666667
Class3-190117_yzw_05_reg tubeScaleFactor setValue 0.2
Class3-190117_yzw_05_reg tubeScaleFactor setSubMinMax 0 10
Class3-190117_yzw_05_reg segmentWidth setMinMax 0 10
Class3-190117_yzw_05_reg segmentWidth setButtons 0
Class3-190117_yzw_05_reg segmentWidth setIncrement 0.666667
Class3-190117_yzw_05_reg segmentWidth setValue 2
Class3-190117_yzw_05_reg segmentWidth setSubMinMax 0 10
Class3-190117_yzw_05_reg segmentColoring setIndex 0 0
Class3-190117_yzw_05_reg segmentLabelColoringOptions setValue 0
Class3-190117_yzw_05_reg segmentColor setColor 0 0.327 1 0.624466
{Class3-190117_yzw_05_reg} setVisibility HIJMPLPPBPBFAAAAIHIIAPPB HIJMPLPPBPBFAAAAIHIIAPPB
Class3-190117_yzw_05_reg fire
Class3-190117_yzw_05_reg setViewerMask 16383
Class3-190117_yzw_05_reg setPickable 1

set hideNewModules 0
create HxSpatialGraphView {Class3-190117_yzw_candidate2_reg}
Class3-190117_yzw_candidate2_reg setIconPosition 611 2946
Class3-190117_yzw_candidate2_reg data connect 190117_yzw_candidate2_reg.am
Class3-190117_yzw_candidate2_reg nodeColormap setDefaultColor 1 0.8 0.5
Class3-190117_yzw_candidate2_reg nodeColormap setDefaultAlpha 0.500000
Class3-190117_yzw_candidate2_reg nodeColormap setLocalRange 0
Class3-190117_yzw_candidate2_reg nodeColormap connect physics.icol
Class3-190117_yzw_candidate2_reg segmentColormap setDefaultColor 1 0.8 0.5
Class3-190117_yzw_candidate2_reg segmentColormap setDefaultAlpha 0.500000
Class3-190117_yzw_candidate2_reg segmentColormap setLocalRange 0
Class3-190117_yzw_candidate2_reg segmentColormap connect physics.icol
Class3-190117_yzw_candidate2_reg fire
Class3-190117_yzw_candidate2_reg itemsToShow setValue 0 1
Class3-190117_yzw_candidate2_reg itemsToShow setToggleVisible 0 1
Class3-190117_yzw_candidate2_reg itemsToShow setValue 1 1
Class3-190117_yzw_candidate2_reg itemsToShow setToggleVisible 1 1
Class3-190117_yzw_candidate2_reg nodeScale setIndex 0 0
Class3-190117_yzw_candidate2_reg nodeScaleFactor setMinMax 0 330
Class3-190117_yzw_candidate2_reg nodeScaleFactor setButtons 0
Class3-190117_yzw_candidate2_reg nodeScaleFactor setIncrement 22
Class3-190117_yzw_candidate2_reg nodeScaleFactor setValue 10
Class3-190117_yzw_candidate2_reg nodeScaleFactor setSubMinMax 0 330
Class3-190117_yzw_candidate2_reg nodeColoring setIndex 0 0
Class3-190117_yzw_candidate2_reg nodeLabelColoringOptions setValue 0
Class3-190117_yzw_candidate2_reg nodeColor setColor 0 0.5 0.5 0.5
Class3-190117_yzw_candidate2_reg segmentStyle setValue 0 1
Class3-190117_yzw_candidate2_reg segmentStyle setToggleVisible 0 1
Class3-190117_yzw_candidate2_reg segmentStyle setValue 1 0
Class3-190117_yzw_candidate2_reg segmentStyle setToggleVisible 1 1
Class3-190117_yzw_candidate2_reg segmentStyle setValue 2 0
Class3-190117_yzw_candidate2_reg segmentStyle setToggleVisible 2 1
Class3-190117_yzw_candidate2_reg tubeScale setIndex 0 0
Class3-190117_yzw_candidate2_reg tubeScaleFactor setMinMax 0 10
Class3-190117_yzw_candidate2_reg tubeScaleFactor setButtons 0
Class3-190117_yzw_candidate2_reg tubeScaleFactor setIncrement 0.666667
Class3-190117_yzw_candidate2_reg tubeScaleFactor setValue 0.2
Class3-190117_yzw_candidate2_reg tubeScaleFactor setSubMinMax 0 10
Class3-190117_yzw_candidate2_reg segmentWidth setMinMax 0 10
Class3-190117_yzw_candidate2_reg segmentWidth setButtons 0
Class3-190117_yzw_candidate2_reg segmentWidth setIncrement 0.666667
Class3-190117_yzw_candidate2_reg segmentWidth setValue 2
Class3-190117_yzw_candidate2_reg segmentWidth setSubMinMax 0 10
Class3-190117_yzw_candidate2_reg segmentColoring setIndex 0 0
Class3-190117_yzw_candidate2_reg segmentLabelColoringOptions setValue 0
Class3-190117_yzw_candidate2_reg segmentColor setColor 0 0.410976 0.847 0.243089
{Class3-190117_yzw_candidate2_reg} setVisibility HIJMPLPPBPACAACDOEAHPJ HIJMPLPPBPACAACDOEAHPJ
Class3-190117_yzw_candidate2_reg fire
Class3-190117_yzw_candidate2_reg setViewerMask 16383
Class3-190117_yzw_candidate2_reg setPickable 1

set hideNewModules 0
create HxSpatialGraphView {Class3-194160_BLA_02_reg}
Class3-194160_BLA_02_reg setIconPosition 659 2976
Class3-194160_BLA_02_reg data connect 194160_BLA_02_reg.am
Class3-194160_BLA_02_reg nodeColormap setDefaultColor 1 0.8 0.5
Class3-194160_BLA_02_reg nodeColormap setDefaultAlpha 0.500000
Class3-194160_BLA_02_reg nodeColormap setLocalRange 0
Class3-194160_BLA_02_reg nodeColormap connect physics.icol
Class3-194160_BLA_02_reg segmentColormap setDefaultColor 1 0.8 0.5
Class3-194160_BLA_02_reg segmentColormap setDefaultAlpha 0.500000
Class3-194160_BLA_02_reg segmentColormap setLocalRange 0
Class3-194160_BLA_02_reg segmentColormap connect physics.icol
Class3-194160_BLA_02_reg fire
Class3-194160_BLA_02_reg itemsToShow setValue 0 1
Class3-194160_BLA_02_reg itemsToShow setToggleVisible 0 1
Class3-194160_BLA_02_reg itemsToShow setValue 1 1
Class3-194160_BLA_02_reg itemsToShow setToggleVisible 1 1
Class3-194160_BLA_02_reg nodeScale setIndex 0 0
Class3-194160_BLA_02_reg nodeScaleFactor setMinMax 0 449
Class3-194160_BLA_02_reg nodeScaleFactor setButtons 0
Class3-194160_BLA_02_reg nodeScaleFactor setIncrement 29.9333
Class3-194160_BLA_02_reg nodeScaleFactor setValue 10
Class3-194160_BLA_02_reg nodeScaleFactor setSubMinMax 0 449
Class3-194160_BLA_02_reg nodeColoring setIndex 0 0
Class3-194160_BLA_02_reg nodeLabelColoringOptions setValue 0
Class3-194160_BLA_02_reg nodeColor setColor 0 0.5 0.5 0.5
Class3-194160_BLA_02_reg segmentStyle setValue 0 1
Class3-194160_BLA_02_reg segmentStyle setToggleVisible 0 1
Class3-194160_BLA_02_reg segmentStyle setValue 1 0
Class3-194160_BLA_02_reg segmentStyle setToggleVisible 1 1
Class3-194160_BLA_02_reg segmentStyle setValue 2 0
Class3-194160_BLA_02_reg segmentStyle setToggleVisible 2 1
Class3-194160_BLA_02_reg tubeScale setIndex 0 0
Class3-194160_BLA_02_reg tubeScaleFactor setMinMax 0 10
Class3-194160_BLA_02_reg tubeScaleFactor setButtons 0
Class3-194160_BLA_02_reg tubeScaleFactor setIncrement 0.666667
Class3-194160_BLA_02_reg tubeScaleFactor setValue 0.2
Class3-194160_BLA_02_reg tubeScaleFactor setSubMinMax 0 10
Class3-194160_BLA_02_reg segmentWidth setMinMax 0 10
Class3-194160_BLA_02_reg segmentWidth setButtons 0
Class3-194160_BLA_02_reg segmentWidth setIncrement 0.666667
Class3-194160_BLA_02_reg segmentWidth setValue 2
Class3-194160_BLA_02_reg segmentWidth setSubMinMax 0 10
Class3-194160_BLA_02_reg segmentColoring setIndex 0 0
Class3-194160_BLA_02_reg segmentLabelColoringOptions setValue 0
Class3-194160_BLA_02_reg segmentColor setColor 0 0.074382 0.483 0.159375
{Class3-194160_BLA_02_reg} setVisibility HIJMPLPPBPDHAAAAJEJFBLOF HIJMPLPPBPDHAAAAJEJFBLOF
Class3-194160_BLA_02_reg fire
Class3-194160_BLA_02_reg setViewerMask 16383
Class3-194160_BLA_02_reg setPickable 1

set hideNewModules 0
create HxSpatialGraphView {Class3-194161_20200430_CLA_reg}
Class3-194161_20200430_CLA_reg setIconPosition 623 3006
Class3-194161_20200430_CLA_reg data connect 194161_20200430_CLA_reg.am
Class3-194161_20200430_CLA_reg nodeColormap setDefaultColor 1 0.8 0.5
Class3-194161_20200430_CLA_reg nodeColormap setDefaultAlpha 0.500000
Class3-194161_20200430_CLA_reg nodeColormap setLocalRange 0
Class3-194161_20200430_CLA_reg nodeColormap connect physics.icol
Class3-194161_20200430_CLA_reg segmentColormap setDefaultColor 1 0.8 0.5
Class3-194161_20200430_CLA_reg segmentColormap setDefaultAlpha 0.500000
Class3-194161_20200430_CLA_reg segmentColormap setLocalRange 0
Class3-194161_20200430_CLA_reg segmentColormap connect physics.icol
Class3-194161_20200430_CLA_reg fire
Class3-194161_20200430_CLA_reg itemsToShow setValue 0 1
Class3-194161_20200430_CLA_reg itemsToShow setToggleVisible 0 1
Class3-194161_20200430_CLA_reg itemsToShow setValue 1 1
Class3-194161_20200430_CLA_reg itemsToShow setToggleVisible 1 1
Class3-194161_20200430_CLA_reg nodeScale setIndex 0 0
Class3-194161_20200430_CLA_reg nodeScaleFactor setMinMax 0 534
Class3-194161_20200430_CLA_reg nodeScaleFactor setButtons 0
Class3-194161_20200430_CLA_reg nodeScaleFactor setIncrement 35.6
Class3-194161_20200430_CLA_reg nodeScaleFactor setValue 10
Class3-194161_20200430_CLA_reg nodeScaleFactor setSubMinMax 0 534
Class3-194161_20200430_CLA_reg nodeColoring setIndex 0 0
Class3-194161_20200430_CLA_reg nodeLabelColoringOptions setValue 0
Class3-194161_20200430_CLA_reg nodeColor setColor 0 0.5 0.5 0.5
Class3-194161_20200430_CLA_reg segmentStyle setValue 0 1
Class3-194161_20200430_CLA_reg segmentStyle setToggleVisible 0 1
Class3-194161_20200430_CLA_reg segmentStyle setValue 1 0
Class3-194161_20200430_CLA_reg segmentStyle setToggleVisible 1 1
Class3-194161_20200430_CLA_reg segmentStyle setValue 2 0
Class3-194161_20200430_CLA_reg segmentStyle setToggleVisible 2 1
Class3-194161_20200430_CLA_reg tubeScale setIndex 0 0
Class3-194161_20200430_CLA_reg tubeScaleFactor setMinMax 0 10
Class3-194161_20200430_CLA_reg tubeScaleFactor setButtons 0
Class3-194161_20200430_CLA_reg tubeScaleFactor setIncrement 0.666667
Class3-194161_20200430_CLA_reg tubeScaleFactor setValue 0.2
Class3-194161_20200430_CLA_reg tubeScaleFactor setSubMinMax 0 10
Class3-194161_20200430_CLA_reg segmentWidth setMinMax 0 10
Class3-194161_20200430_CLA_reg segmentWidth setButtons 0
Class3-194161_20200430_CLA_reg segmentWidth setIncrement 0.666667
Class3-194161_20200430_CLA_reg segmentWidth setValue 2
Class3-194161_20200430_CLA_reg segmentWidth setSubMinMax 0 10
Class3-194161_20200430_CLA_reg segmentColoring setIndex 0 0
Class3-194161_20200430_CLA_reg segmentLabelColoringOptions setValue 0
Class3-194161_20200430_CLA_reg segmentColor setColor 0 0.36 0.85792 1
{Class3-194161_20200430_CLA_reg} setVisibility HIJMPLPPBPBFAAAAIHIIAPPB HIJMPLPPBPBFAAAAIHIIAPPB
Class3-194161_20200430_CLA_reg fire
Class3-194161_20200430_CLA_reg setViewerMask 16383
Class3-194161_20200430_CLA_reg setPickable 1

set hideNewModules 0
create HxSpatialGraphView {Class3-194161_yzw20200528_left_layer3_reg}
Class3-194161_yzw20200528_left_layer3_reg setIconPosition 557 3036
Class3-194161_yzw20200528_left_layer3_reg data connect 194161_yzw20200528_left_layer3_reg.am
Class3-194161_yzw20200528_left_layer3_reg nodeColormap setDefaultColor 1 0.8 0.5
Class3-194161_yzw20200528_left_layer3_reg nodeColormap setDefaultAlpha 0.500000
Class3-194161_yzw20200528_left_layer3_reg nodeColormap setLocalRange 0
Class3-194161_yzw20200528_left_layer3_reg nodeColormap connect physics.icol
Class3-194161_yzw20200528_left_layer3_reg segmentColormap setDefaultColor 1 0.8 0.5
Class3-194161_yzw20200528_left_layer3_reg segmentColormap setDefaultAlpha 0.500000
Class3-194161_yzw20200528_left_layer3_reg segmentColormap setLocalRange 0
Class3-194161_yzw20200528_left_layer3_reg segmentColormap connect physics.icol
Class3-194161_yzw20200528_left_layer3_reg fire
Class3-194161_yzw20200528_left_layer3_reg itemsToShow setValue 0 1
Class3-194161_yzw20200528_left_layer3_reg itemsToShow setToggleVisible 0 1
Class3-194161_yzw20200528_left_layer3_reg itemsToShow setValue 1 1
Class3-194161_yzw20200528_left_layer3_reg itemsToShow setToggleVisible 1 1
Class3-194161_yzw20200528_left_layer3_reg nodeScale setIndex 0 0
Class3-194161_yzw20200528_left_layer3_reg nodeScaleFactor setMinMax 0 244
Class3-194161_yzw20200528_left_layer3_reg nodeScaleFactor setButtons 0
Class3-194161_yzw20200528_left_layer3_reg nodeScaleFactor setIncrement 16.2667
Class3-194161_yzw20200528_left_layer3_reg nodeScaleFactor setValue 10
Class3-194161_yzw20200528_left_layer3_reg nodeScaleFactor setSubMinMax 0 244
Class3-194161_yzw20200528_left_layer3_reg nodeColoring setIndex 0 0
Class3-194161_yzw20200528_left_layer3_reg nodeLabelColoringOptions setValue 0
Class3-194161_yzw20200528_left_layer3_reg nodeColor setColor 0 0.5 0.5 0.5
Class3-194161_yzw20200528_left_layer3_reg segmentStyle setValue 0 1
Class3-194161_yzw20200528_left_layer3_reg segmentStyle setToggleVisible 0 1
Class3-194161_yzw20200528_left_layer3_reg segmentStyle setValue 1 0
Class3-194161_yzw20200528_left_layer3_reg segmentStyle setToggleVisible 1 1
Class3-194161_yzw20200528_left_layer3_reg segmentStyle setValue 2 0
Class3-194161_yzw20200528_left_layer3_reg segmentStyle setToggleVisible 2 1
Class3-194161_yzw20200528_left_layer3_reg tubeScale setIndex 0 0
Class3-194161_yzw20200528_left_layer3_reg tubeScaleFactor setMinMax 0 10
Class3-194161_yzw20200528_left_layer3_reg tubeScaleFactor setButtons 0
Class3-194161_yzw20200528_left_layer3_reg tubeScaleFactor setIncrement 0.666667
Class3-194161_yzw20200528_left_layer3_reg tubeScaleFactor setValue 0.2
Class3-194161_yzw20200528_left_layer3_reg tubeScaleFactor setSubMinMax 0 10
Class3-194161_yzw20200528_left_layer3_reg segmentWidth setMinMax 0 10
Class3-194161_yzw20200528_left_layer3_reg segmentWidth setButtons 0
Class3-194161_yzw20200528_left_layer3_reg segmentWidth setIncrement 0.666667
Class3-194161_yzw20200528_left_layer3_reg segmentWidth setValue 2
Class3-194161_yzw20200528_left_layer3_reg segmentWidth setSubMinMax 0 10
Class3-194161_yzw20200528_left_layer3_reg segmentColoring setIndex 0 0
Class3-194161_yzw20200528_left_layer3_reg segmentLabelColoringOptions setValue 0
Class3-194161_yzw20200528_left_layer3_reg segmentColor setColor 0 0.321491 0.953 0.202989
{Class3-194161_yzw20200528_left_layer3_reg} setVisibility HIJMPLPPBPBFAAAAIHIIAPPB HIJMPLPPBPBFAAAAIHIIAPPB
Class3-194161_yzw20200528_left_layer3_reg fire
Class3-194161_yzw20200528_left_layer3_reg setViewerMask 16383
Class3-194161_yzw20200528_left_layer3_reg setPickable 1

set hideNewModules 0
create HxSpatialGraphView {Class3-200003_20200609_OFC_reg}
Class3-200003_20200609_OFC_reg setIconPosition 623 3066
Class3-200003_20200609_OFC_reg data connect 200003_20200609_OFC_reg.am
Class3-200003_20200609_OFC_reg nodeColormap setDefaultColor 1 0.8 0.5
Class3-200003_20200609_OFC_reg nodeColormap setDefaultAlpha 0.500000
Class3-200003_20200609_OFC_reg nodeColormap setLocalRange 0
Class3-200003_20200609_OFC_reg nodeColormap connect physics.icol
Class3-200003_20200609_OFC_reg segmentColormap setDefaultColor 1 0.8 0.5
Class3-200003_20200609_OFC_reg segmentColormap setDefaultAlpha 0.500000
Class3-200003_20200609_OFC_reg segmentColormap setLocalRange 0
Class3-200003_20200609_OFC_reg segmentColormap connect physics.icol
Class3-200003_20200609_OFC_reg fire
Class3-200003_20200609_OFC_reg itemsToShow setValue 0 1
Class3-200003_20200609_OFC_reg itemsToShow setToggleVisible 0 1
Class3-200003_20200609_OFC_reg itemsToShow setValue 1 1
Class3-200003_20200609_OFC_reg itemsToShow setToggleVisible 1 1
Class3-200003_20200609_OFC_reg nodeScale setIndex 0 0
Class3-200003_20200609_OFC_reg nodeScaleFactor setMinMax 0 331
Class3-200003_20200609_OFC_reg nodeScaleFactor setButtons 0
Class3-200003_20200609_OFC_reg nodeScaleFactor setIncrement 22.0667
Class3-200003_20200609_OFC_reg nodeScaleFactor setValue 10
Class3-200003_20200609_OFC_reg nodeScaleFactor setSubMinMax 0 331
Class3-200003_20200609_OFC_reg nodeColoring setIndex 0 0
Class3-200003_20200609_OFC_reg nodeLabelColoringOptions setValue 0
Class3-200003_20200609_OFC_reg nodeColor setColor 0 0.5 0.5 0.5
Class3-200003_20200609_OFC_reg segmentStyle setValue 0 1
Class3-200003_20200609_OFC_reg segmentStyle setToggleVisible 0 1
Class3-200003_20200609_OFC_reg segmentStyle setValue 1 0
Class3-200003_20200609_OFC_reg segmentStyle setToggleVisible 1 1
Class3-200003_20200609_OFC_reg segmentStyle setValue 2 0
Class3-200003_20200609_OFC_reg segmentStyle setToggleVisible 2 1
Class3-200003_20200609_OFC_reg tubeScale setIndex 0 0
Class3-200003_20200609_OFC_reg tubeScaleFactor setMinMax 0 10
Class3-200003_20200609_OFC_reg tubeScaleFactor setButtons 0
Class3-200003_20200609_OFC_reg tubeScaleFactor setIncrement 0.666667
Class3-200003_20200609_OFC_reg tubeScaleFactor setValue 0.2
Class3-200003_20200609_OFC_reg tubeScaleFactor setSubMinMax 0 10
Class3-200003_20200609_OFC_reg segmentWidth setMinMax 0 10
Class3-200003_20200609_OFC_reg segmentWidth setButtons 0
Class3-200003_20200609_OFC_reg segmentWidth setIncrement 0.666667
Class3-200003_20200609_OFC_reg segmentWidth setValue 2
Class3-200003_20200609_OFC_reg segmentWidth setSubMinMax 0 10
Class3-200003_20200609_OFC_reg segmentColoring setIndex 0 0
Class3-200003_20200609_OFC_reg segmentLabelColoringOptions setValue 0
Class3-200003_20200609_OFC_reg segmentColor setColor 0 0.065778 0.577 0.294805
{Class3-200003_20200609_OFC_reg} setVisibility HIJMPLPPBPBDAAAANBECBDON HIJMPLPPBPBDAAAANBECBDON
Class3-200003_20200609_OFC_reg fire
Class3-200003_20200609_OFC_reg setViewerMask 16383
Class3-200003_20200609_OFC_reg setPickable 1

set hideNewModules 0
create HxMovieMaker {MovieMaker}
MovieMaker setIconPosition 160 3096
MovieMaker time connect CameraPath.civ
MovieMaker fire
MovieMaker viewer setIndex 0 0
MovieMaker viewer setIndex 1 0
MovieMaker fileFormat setIndex 0 3
MovieMaker filename setState {D:/Documents/Coding/nibs-intern/track-neuron/outputs/amira/class3/png/class3.png}
MovieMaker frames setMinMax 0 2000
MovieMaker frames setButtons 1
MovieMaker frames setIncrement 1
MovieMaker frames setValue 2000
MovieMaker frames setSubMinMax 0 2000
MovieMaker frameRateSlider setMinMax 1 30
MovieMaker frameRateSlider setButtons 1
MovieMaker frameRateSlider setIncrement 1
MovieMaker frameRateSlider setValue 24
MovieMaker frameRateSlider setSubMinMax 1 30
MovieMaker frameRate setIndex 0 -1
MovieMaker aviEncoder setState item 0 0 
MovieMaker compressionQuality setMinMax 0 1
MovieMaker compressionQuality setButtons 0
MovieMaker compressionQuality setIncrement 0.1
MovieMaker compressionQuality setValue 1
MovieMaker compressionQuality setSubMinMax 0 1
MovieMaker type setIndex 0 0
MovieMaker format setValue 0
MovieMaker tiles setMinMax 0 1 100
MovieMaker tiles setValue 0 1
MovieMaker tiles setMinMax 1 1 100
MovieMaker tiles setValue 1 1
MovieMaker size setValue 3
MovieMaker resolution setMinMax 0 0 2048
MovieMaker resolution setValue 0 2048
MovieMaker resolution setMinMax 1 0 2048
MovieMaker resolution setValue 1 1536
MovieMaker fire
MovieMaker setViewerMask 16383
MovieMaker setPickable 1

set hideNewModules 0
[ load /class1.1.amov ] setLabel moive.amov
moive.amov setIconPosition 20 3126
moive.amov master connect MovieMaker
moive.amov fire
moive.amov numberOfStreams setIndex 0 0
moive.amov stream1 setState {D:/Documents/Coding/nibs-intern/track-neuron/outputs/amira/class3/png/class3.????.png}
moive.amov stream2 setState {}
moive.amov stream3 setState {}
moive.amov stream4 setState {}
moive.amov type setIndex 0 0
moive.amov renderMethod setValue 0
moive.amov aspectRatio setMinMax 0 0 100
moive.amov aspectRatio setValue 0 0
moive.amov swapStereo setValue 0 0
moive.amov swapStereo setToggleVisible 0 1
moive.amov flip setValue 0 0
moive.amov flip setToggleVisible 0 1
moive.amov flip setValue 1 0
moive.amov flip setToggleVisible 1 1
moive.amov maxFps setMinMax 0 0 100
moive.amov maxFps setValue 0 0
moive.amov maxThreads setMinMax 0 -2147483648 2147483648
moive.amov maxThreads setValue 0 0
moive.amov segmentsPerFrame setMinMax 0 1 1000
moive.amov segmentsPerFrame setValue 0 1
moive.amov fire
moive.amov setViewerMask 16383
moive.amov select

set hideNewModules 0


viewer 0 setCameraOrientation -0.707107 -5.00684e-008 -0.707107 3.14159
viewer 0 setCameraPosition 14840.7 4345 6595.01
viewer 0 setCameraFocalDistance 9145.68
viewer 0 setCameraNearDistance 3981.71
viewer 0 setCameraFarDistance 14320
viewer 0 setCameraType orthographic
viewer 0 setCameraHeight 18291.4
viewer 0 setAutoRedraw 1
viewer 0 redraw

