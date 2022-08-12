//%attributes = {}
If (False:C215)
	//Project Method Name:      BarCode_Create
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 17/11/2009 08:15
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_CreateCheckSum; $_bo_LocalInit; $_bo_PrintCode; $_bo_ShowChecksum; $3; $4; $5)
	C_LONGINT:C283($_l_BarChart; $_l_Scale; $6; BARC_l_Add; BARC_l_FontOffset; BARC_l_FontSize; BARC_l_Height; BARC_l_Width)
	C_PICTURE:C286($_pic_BarCodeOutput; $0)
	C_TEXT:C284($_t_Barcode; $_t_BarcodeType; $_t_Checksum; $_t_oldMethodName; $_t_Pattern; $1; $2; BARC_t_FontName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("BARcode_Create")
//  Creates a picture for a barcode
// $pict := GetBarcode(barcodetype;code;createchecksum;showchecksum;printcode)
// the barcode variables MUST be set before!



$_t_BarcodeType:=$1
$_t_Barcode:=$2
$_bo_CreateCheckSum:=$3
$_bo_ShowChecksum:=$4
$_bo_PrintCode:=$5
If (Count parameters:C259>5)
	$_l_BarChart:=$6
Else 
	$_l_BarChart:=0
End if 

If (BARC_l_Width=0)
	$_bo_LocalInit:=True:C214
	$_l_Scale:=4  //  create the picture bigger, increase readability for inkjet printers
	If ($_t_BarcodeType="Supplemental@")
		BARC_l_Height:=25*$_l_Scale
	Else 
		BARC_l_Height:=40*$_l_Scale
	End if 
	BARC_l_Width:=1*$_l_Scale
	BARC_l_Add:=3*$_l_Scale
	BARC_t_FontName:="Arial"
	BARC_l_FontSize:=9*$_l_Scale
	BARC_l_FontOffset:=5*$_l_Scale
Else 
	$_bo_LocalInit:=False:C215
End if 

If (($_t_BarcodeType="UPC@") | ($_t_BarcodeType="EAN@"))  // handling of GTIN numbers
	If ((Length:C16($_t_Barcode)=13) | (Length:C16($_t_Barcode)=14))
		Case of 
			: (($_t_BarcodeType="EAN8") & ($_t_Barcode="000000@"))
				$_t_Barcode:=Substring:C12($_t_Barcode; 7)
			: (($_t_BarcodeType="EAN13") & ($_t_Barcode="0@"))
				$_t_Barcode:=Substring:C12($_t_Barcode; 2)
			: (($_t_BarcodeType="UPC-A") & ($_t_Barcode="00@"))
				$_t_Barcode:=Substring:C12($_t_Barcode; 3)
			: (($_t_BarcodeType="UPC-E") & ($_t_Barcode="000000@"))
				$_t_Barcode:=Substring:C12($_t_Barcode; 7)
		End case 
	End if 
End if 

If ($_t_BarcodeType="UPC-E")
	$_t_Checksum:=""
	$_t_Barcode:=Calc_Checksum_UPCE($_t_Barcode; $_t_BarcodeType)
Else 
	If ($_bo_CreateCheckSum)
		$_t_Checksum:=BarCode_Calc_Checksum($_t_BarcodeType; $_t_Barcode)
		Case of 
			: ($_t_BarcodeType="EAN8")
				If (Length:C16($_t_Barcode)=8)
					If ($_t_Checksum=$_t_Barcode[[8]])
						$_t_Checksum:=""
					End if 
				End if 
			: ($_t_BarcodeType="EAN13")
				If (Length:C16($_t_Barcode)=13)
					If ($_t_Checksum=$_t_Barcode[[13]])
						$_t_Checksum:=""
					End if 
				End if 
			: ($_t_BarcodeType="UPC-A")
				If (Length:C16($_t_Barcode)=12)
					If ($_t_Checksum=$_t_Barcode[[12]])
						$_t_Checksum:=""
					End if 
				End if 
		End case 
	Else 
		$_t_Checksum:=""
	End if 
End if 

$_t_Pattern:=Barcode_Convert_Pattern($_t_Barcode; $_t_Barcode+$_t_Checksum)

If ($_t_Pattern#"")
	If ($_bo_PrintCode)
		If ($_bo_ShowChecksum)
			$_t_Barcode:=$_t_Barcode+$_t_Checksum
		End if 
	Else 
		$_t_Barcode:=""
	End if 
	$_pic_BarCodeOutput:=Bar_PatternToPict($_t_Pattern; $_t_Barcode; $_t_BarcodeType; $_l_BarChart)
End if 

If ($_bo_LocalInit)
	BARC_l_Width:=0  // reset
	$_pic_BarCodeOutput:=$_pic_BarCodeOutput | $_pic_BarCodeOutput  // convert to bitmap
	$_pic_BarCodeOutput:=$_pic_BarCodeOutput*(1/$_l_Scale)  // scale back to original size
End if 

$0:=$_pic_BarCodeOutput
ERR_MethodTrackerReturn("BARcode_Create"; $_t_oldMethodName)