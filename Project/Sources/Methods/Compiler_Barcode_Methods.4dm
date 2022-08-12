//%attributes = {"invisible":true}
If (False:C215)  // ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 16/08/2009 16:48
	//Method Name: Compiler_Barcode_Methods
	//Description
	
	//Parameters
	//Declarations
	// ----------------------------------------------------
	//Project method Amendments
	
	//End Project method Amendments
End if 
$_t_oldMethodName:=ERR_MethodTracker("Compiler_Barcode_Methods")


//BAR_PATTERNTOPICT
C_PICTURE:C286(Bar_PatternToPict; $0)
C_TEXT:C284(Bar_PatternToPict; $1)
C_TEXT:C284(Bar_PatternToPict; $2)
C_TEXT:C284(Bar_PatternToPict; $3)
C_LONGINT:C283(Bar_PatternToPict; $4)

//SET_BARCODE_PATTERN
C_LONGINT:C283(Set_Barcode_Pattern; $1)
C_TEXT:C284(Set_Barcode_Pattern; $2)
C_LONGINT:C283(Set_Barcode_Pattern; $3)

//CALC_CHECKSUM_CODE128
C_TEXT:C284(Calc_Checksum_Code128; $0)
C_TEXT:C284(Calc_Checksum_Code128; $1)
C_TEXT:C284(Calc_Checksum_Code128; $2)

//CONVERT_CODE39_PATTERN
C_TEXT:C284(Convert_Code39_Pattern; $0)
C_TEXT:C284(Convert_Code39_Pattern; $1)

//CONVERT_CODE128_PATTERN
C_TEXT:C284(Convert_Code128_Pattern; $0)
C_TEXT:C284(Convert_Code128_Pattern; $1)
C_TEXT:C284(Convert_Code128_Pattern; $2)

//CALC_CHECKSUM_CODE39
C_TEXT:C284(Calc_Checksum_Code39; $0)
C_TEXT:C284(Calc_Checksum_Code39; $1)

//BARCODE_CALC_CHECKSUM
C_TEXT:C284(BarCode_Calc_Checksum; $0)
C_TEXT:C284(BarCode_Calc_Checksum; $1)
C_TEXT:C284(BarCode_Calc_Checksum; $2)

//BARCODE_CONVERT_PATTERN
C_TEXT:C284(Barcode_Convert_Pattern; $0)
C_TEXT:C284(Barcode_Convert_Pattern; $1)
C_TEXT:C284(Barcode_Convert_Pattern; $2)

//CALC_CHECKSUM_INDUSTRIAL
C_TEXT:C284(Calc_Checksum_Industrial; $0)
C_TEXT:C284(Calc_Checksum_Industrial; $1)
C_TEXT:C284(Calc_Checksum_Industrial; $2)

//CONVERT_INDUSTRIAL25_PATTERN
C_TEXT:C284(Convert_Industrial25_Pattern; $0)
C_TEXT:C284(Convert_Industrial25_Pattern; $1)

//CONVERT_INTERLEAVED25_PATTERN
C_TEXT:C284(Convert_Interleaved25_Pattern; $0)
C_TEXT:C284(Convert_Interleaved25_Pattern; $1)

//CALC_CHECKSUM_EAN13
C_TEXT:C284(Calc_Checksum_EAN13; $0)
C_TEXT:C284(Calc_Checksum_EAN13; $1)

//CONVERT_EAN13_PATTERN
C_TEXT:C284(Convert_EAN13_Pattern; $0)
C_TEXT:C284(Convert_EAN13_Pattern; $1)

//CALC_CHECKSUM_UPCA
C_TEXT:C284(Calc_Checksum_UPCA; $0)
C_TEXT:C284(Calc_Checksum_UPCA; $1)

//CONVERT_UPCA_PATTERN
C_TEXT:C284(Convert_UPCA_Pattern; $0)
C_TEXT:C284(Convert_UPCA_Pattern; $1)

//CONVERT_EAN8_PATTERN
C_TEXT:C284(Convert_EAN8_Pattern; $0)
C_TEXT:C284(Convert_EAN8_Pattern; $1)

//CALC_CHECKSUM_UPCE
C_TEXT:C284(Calc_Checksum_UPCE; $0)
C_TEXT:C284(Calc_Checksum_UPCE; $1)
C_TEXT:C284(Calc_Checksum_UPCE; $2)

//CONVERT_UPCE_PATTERN
C_TEXT:C284(Convert_UPCE_Pattern; $0)
C_TEXT:C284(Convert_UPCE_Pattern; $1)

//CONVERT_SUPPLEMENTAL2_PATTERN
C_TEXT:C284(Convert_Supplemental2_Pattern; $0)
C_TEXT:C284(Convert_Supplemental2_Pattern; $1)

//CONVERT_SUPPLEMENTAL5_PATTERN
C_TEXT:C284(Convert_Supplemental5_Pattern; $0)
C_TEXT:C284(Convert_Supplemental5_Pattern; $1)

//BARCODE_CREATE
C_PICTURE:C286(BarCode_Create; $0)
C_TEXT:C284(BarCode_Create; $1)
C_TEXT:C284(BarCode_Create; $2)
C_BOOLEAN:C305(BarCode_Create; $3)
C_BOOLEAN:C305(BarCode_Create; $4)
C_BOOLEAN:C305(BarCode_Create; $5)
C_LONGINT:C283(BarCode_Create; $6)
ERR_MethodTrackerReturn("Compiler_Barcode_Methods"; $_t_oldMethodName)