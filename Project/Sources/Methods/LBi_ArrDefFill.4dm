//%attributes = {}
If (False:C215)
	//Project Method Name:      LBi_ArrDefFill
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 10/12/2009 14:15`Method: LBi_ArrDefFill
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(a03Refs)
	//ARRAY TEXT(<>LB_at_EditModes;0)
	//ARRAY TEXT(a01Refs;0)
	//ARRAY TEXT(a02Refs;0)
	//ARRAY TEXT(a04Refs;0)
	//ARRAY TEXT(a05Refs;0)
	//ARRAY TEXT(a06Refs;0)
	C_BOOLEAN:C305($_bo_AddLevel; $_bo_TableBased; $_bo_Trace; $11; LB_bo_DefLevel; LB_bo_ForceLevel)
	C_LONGINT:C283(<>vALMode; $_bo_ReUseLevel; $_l_AreaType; $_l_AssociatedTableNumber; $_l_FillLevel; $_l_index; $_l_LevelsIndex; $_l_TableNumber; $12; $7; DB_l_01Areatype)
	C_LONGINT:C283(DB_l_02Areatype; DB_l_03Areatype; DB_l_04Areatype; DB_l_05Areatype; DB_l_06Areatype; DB_l_07Areatype; DB_l_08Areatype; DB_l_09Areatype; DB_l_10Areatype; DB_l_11Areatype; DB_l_12Areatype)
	C_LONGINT:C283(DB_l_13Areatype; DB_l_14Areatype; DB_l_15Areatype; DB_l_16Areatype; DB_l_17Areatype; DB_l_18Areatype; DB_l_19Areatype; DB_l_20Areatype; DB_l_21Areatype; DB_l_22Areatype; DB_l_23Areatype)
	C_LONGINT:C283(DB_l_24Areatype; DB_l_25Areatype; DB_l_26Areatype; DB_l_27Areatype; DB_l_28Areatype; DB_l_29Areatype; DB_l_30Areatype; DB_l_31Areatype; DB_l_32Areatype; DB_l_33Areatype; DB_l_34Areatype)
	C_LONGINT:C283(DB_l_35Areatype; DB_l_36Areatype; DB_l_37Areatype; DB_l_38Areatype; DB_l_39Areatype; DB_l_40Areatype; DB_l_41Areatype; DB_l_42Areatype; DB_l_43Areatype; DB_l_44Areatype; DB_l_45Areatype)
	C_LONGINT:C283(DB_l_46Areatype; DB_l_47Areatype; DB_l_48Areatype; DB_l_49Areatype; DB_l_50Areatype; DB_l_51Areatype; DB_l_52Areatype; DB_l_53Areatype; DB_l_54Areatype; DB_l_55Areatype; DB_l_56Areatype)
	C_LONGINT:C283(DB_l_57Areatype; DB_l_58Areatype; DB_l_59Areatype; DB_l_60Areatype; DB_l_61Areatype; DB_l_62Areatype; DB_l_63Areatype; DB_l_64Areatype; DB_l_65Areatype; DB_l_66Areatype; DB_l_67Areatype)
	C_LONGINT:C283(DB_l_68Areatype; DB_l_69Areatype; DB_l_70Areatype; DB_l_71Areatype; DB_l_72Areatype; DB_l_73Areatype; DB_l_74Areatype; DB_l_75Areatype; DB_l_76Areatype; DB_l_77Areatype; DB_l_78Areatype)
	C_LONGINT:C283(DB_l_79Areatype; DB_l_80Areatype; DB_l_81Areatype; DB_l_82Areatype; DB_l_84Areatype; DB_l_85Areatype; DB_l_86Areatype; DB_l_87Areatype; DB_l_88Areatype; DB_l_89Areatype; DB_l_90Areatype)
	C_LONGINT:C283(DB_l_91Areatype; DB_l_92Areatype; DB_l_93Areatype; DB_l_94Areatype; DB_l_95Areatype; DB_l_96Areatype; DB_l_97Areatype; DB_l_98Areatype; DB_l_99Areatype; DB_l_Offset; LB_l_CurrentMaxLevel)
	C_LONGINT:C283(LBI_l_FillLevel; vALLevels)
	C_PICTURE:C286(<>LB_pic_ModePicture)
	C_POINTER:C301($_ptr_Field; $_ptr_HightlightSet; $_ptr_ListboxArea; $_ptr_ListboxSetup; $_ptr_ListboxType; $_ptr_ReferenceArray; $_ptr_Variable; $1; $2; $3; $4)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_CurrentDefintionsOwner; $_t_HightlightSetName; $_t_LayoutDefinitionsReference; $_t_LayoutReference; $_t_oldMethodName; $_t_Ref; $_t_SubTableName; $_t_TableName; $_t_TableNumberSTR; $10)
	C_TEXT:C284($13; $5; $6; $8; $9; DB_T_01HighlightSet; DB_T_02HighlightSet; DB_T_03HighlightSet; DB_T_04HighlightSet; DB_T_05HighlightSet; DB_T_06HighlightSet)
	C_TEXT:C284(DB_T_07HighlightSet; DB_T_08HighlightSet; DB_T_09HighlightSet; DB_T_10HighlightSet; DB_T_11HighlightSet; DB_T_12HighlightSet; DB_T_13HighlightSet; DB_T_14HighlightSet; DB_T_15HighlightSet; DB_T_16HighlightSet; DB_T_17HighlightSet)
	C_TEXT:C284(DB_T_18HighlightSet; DB_T_19HighlightSet; DB_T_20HighlightSet; DB_T_21HighlightSet; DB_T_22HighlightSet; DB_T_23HighlightSet; DB_T_24HighlightSet; DB_T_25HighlightSet; DB_T_26HighlightSet; DB_T_27HighlightSet; DB_T_28HighlightSet)
	C_TEXT:C284(DB_T_29HighlightSet; DB_T_30HighlightSet; DB_T_31HighlightSet; DB_T_32HighlightSet; DB_T_33HighlightSet; DB_T_34HighlightSet; DB_T_35HighlightSet; DB_T_36HighlightSet; DB_T_37HighlightSet; DB_T_38HighlightSet; DB_T_39HighlightSet)
	C_TEXT:C284(DB_T_40HighlightSet; DB_T_41HighlightSet; DB_T_42HighlightSet; DB_T_43HighlightSet; DB_T_44HighlightSet; DB_T_45HighlightSet; DB_T_46HighlightSet; DB_T_47HighlightSet; DB_T_48HighlightSet; DB_T_49HighlightSet; DB_T_50HighlightSet)
	C_TEXT:C284(DB_T_51HighlightSet; DB_T_52HighlightSet; DB_T_53HighlightSet; DB_T_54HighlightSet; DB_T_55HighlightSet; DB_T_56HighlightSet; DB_T_57HighlightSet; DB_T_58HighlightSet; DB_T_59HighlightSet; DB_T_60HighlightSet; DB_T_61HighlightSet)
	C_TEXT:C284(DB_T_62HighlightSet; DB_T_63HighlightSet; DB_T_64HighlightSet; DB_T_65HighlightSet; DB_T_66HighlightSet; DB_T_67HighlightSet; DB_T_68HighlightSet; DB_T_69HighlightSet; DB_T_70HighlightSet; DB_T_71HighlightSet; DB_T_72HighlightSet)
	C_TEXT:C284(DB_T_73HighlightSet; DB_T_74HighlightSet; DB_T_75HighlightSet; DB_T_76HighlightSet; DB_T_77HighlightSet; DB_T_78HighlightSet; DB_T_79HighlightSet; DB_T_80HighlightSet; DB_T_81HighlightSet; DB_T_82HighlightSet; DB_T_84HighlightSet)
	C_TEXT:C284(DB_T_85HighlightSet; DB_T_86HighlightSet; DB_T_87HighlightSet; DB_T_88HighlightSet; DB_T_89HighlightSet; DB_T_90HighlightSet; DB_T_91HighlightSet; DB_T_92HighlightSet; DB_T_93HighlightSet; DB_T_94HighlightSet; DB_T_95HighlightSet)
	C_TEXT:C284(DB_T_96HighlightSet; DB_T_97HighlightSet; DB_T_98HighlightSet; DB_T_99HighlightSet)
End if 
//Code Starts Here



$_t_oldMethodName:=ERR_MethodTracker("LBi_ArrDefFill")
LBI_ListBoxDefinitions

$_bo_Trace:=False:C215
If (Count parameters:C259>=7)
	If ($7=6)
		//$_bo_Trace:=True
	End if 
End if 
//March 2010=the following modifications are to cater for a field based view rather than using arrays.
//The pointer array will get an extra pointer to indicate if the listbox is array based from fields, array based from arrays, or field based.
//$1=The pointers array
$_ptr_ListboxSetup:=$1
//$2=Pointer to the area variable name ` we will use GET LISTBOX TABLE SOURCE ({*; }object; tableNum{; name}) to find out if this is array of table based..if the table num is -1 it is array based
$_ptr_ListboxArea:=$2
//if the area is table based dont forget to set table-get the table from the pointer in $3.
//$3=Pointer to unique field or subfile-we can extract the table from there(so replaces $3) - was $4?

//$4=(was $15) Pointer to PARENT TABLE unique key-$14 not needed
//$5=Enterability, Column dragging, Row Dragging,(those drags only refer to the area itself).

//$6= `Input entry form if applicable-this becomes very important for table based entry
// $7= the number  of the definition to use so  pass 3 we will get the 039 from the table of $3 and pad the 3 with a 0 (so if it was 13 we would not pad it)
//$8 plural name
//$9 singluar name
//$10 optional--if empty use ◊USER only needed if using something else
//$11=Re-use level
//$12 LEVEL here-because if we are re-using a level for something what level!!
//$13-optional-this is the name of the highlight set for this =must be as set in the design mode
If (Count parameters:C259>=12)
	$_bo_ReUseLevel:=$12
Else 
	$_bo_ReUseLevel:=0
End if 

If (Count parameters:C259>=9)
	
	$_l_AssociatedTableNumber:=-1
	If (Not:C34(Is nil pointer:C315($_ptr_ListboxArea)))
		LISTBOX GET TABLE SOURCE:C1014($_ptr_ListboxArea->; $_l_AssociatedTableNumber)
	End if 
	$_bo_TableBased:=($_l_AssociatedTableNumber>0)
	//not that the table it is assigned to may have nothing to do with the table it is going to display
	$_ptr_Field:=$3
	Case of 
		: (Type:C295($_ptr_Field->)=Is subtable:K8:11)
			//TRACE
			$_t_TableName:=Table name:C256(Table:C252($_ptr_Field))
			$_t_SubTableName:="["+$_t_TableName+"]"+Field name:C257(Table:C252($3); Field:C253($_ptr_Field))
		Else 
			$_t_SubTableName:=""
	End case 
	$_l_TableNumber:=Table:C252($3)
	
	If (DB_l_Offset=0)
		DB_l_Offset:=100
	End if 
	Case of 
		: ($7=-1)
			Case of 
					
				: (DB_l_Offset=100)
					If ($_l_TableNumber<10)
						$_t_TableNumberSTR:=("00"*Num:C11($_l_TableNumber<10))+String:C10($_l_TableNumber)
					Else 
						$_t_TableNumberSTR:=("0"*Num:C11($_l_TableNumber<100))+String:C10($_l_TableNumber)
					End if 
					$_t_LayoutReference:=("0"*Num:C11(True:C214)+String:C10(0))
				: (DB_l_Offset=1000)
					$_t_TableNumberSTR:=("0"*Num:C11($_l_TableNumber<10))+("0"*Num:C11($_l_TableNumber<100))+("0"*Num:C11($_l_TableNumber<1000))+String:C10($_l_TableNumber)
					$_t_LayoutReference:=String:C10(0)
			End case 
		: (DB_l_Offset=100)
			If ($_l_TableNumber<10)
				$_t_TableNumberSTR:=("00"*Num:C11($_l_TableNumber<10))+String:C10($_l_TableNumber)
			Else 
				$_t_TableNumberSTR:=("0"*Num:C11($_l_TableNumber<100))+String:C10($_l_TableNumber)
			End if 
			$_t_LayoutReference:=("0"*Num:C11($7<10))+String:C10($7)
		: (DB_l_Offset=1000)
			$_t_TableNumberSTR:=("0"*Num:C11($_l_TableNumber<10))+("0"*Num:C11($_l_TableNumber<100))+("0"*Num:C11($_l_TableNumber<1000))+String:C10($_l_TableNumber)
			$_t_LayoutReference:=String:C10($7)
		Else 
			
	End case 
	$_t_LayoutDefinitionsReference:=$_t_TableNumberSTR+$_t_LayoutReference
	If (Count parameters:C259>=11)
		$_bo_AddLevel:=$11  //reusing same page
	Else 
		$_bo_AddLevel:=True:C214
	End if 
	If ($_bo_AddLevel=True:C214)  //to make sure we dont say add a level and then use a path
		$_bo_ReUseLevel:=0
	End if 
	
	If (Count parameters:C259>=10)
		If ($10#"")
			$_t_CurrentDefintionsOwner:=$10
		Else 
			$_t_CurrentDefintionsOwner:=<>PER_t_CurrentUserInitials
		End if 
	Else 
		$_t_CurrentDefintionsOwner:=<>PER_t_CurrentUserInitials
	End if 
	Case of 
		: (LBI_l_FillLevel>0)
			$_l_FillLevel:=LBI_l_FillLevel
		: (LB_bo_ForceLevel)
			LB_l_CurrentMaxLevel:=LB_l_CurrentMaxLevel+1
			vALLevels:=vALLevels+1
			LBI_l_FillLevel:=vALLevels
			$_l_FillLevel:=vALLevels
		Else 
			If (vALLevels>0)  //check that you don't need to reuse a Level - eg on Switch Access
				If ($_bo_ReUseLevel>0)
					$_l_FillLevel:=$_bo_ReUseLevel
				Else 
					$_l_FillLevel:=0
					
					
					//faster not to use a loop - cos would need Get Pointer
					//& can't use Case of cos don't know how many levels have been defined
					If ($_l_FillLevel=0)
						If ($8=a01Refs{9}) | (Not:C34($_bo_AddLevel))  // | (Size of array($1->)=0)
							//if the pl name is the same or re-using a page
							//If (($_t_SubTableName=a01Refs{8}) & ((Substring($_t_LayoutDefinitionsReference;1;3))=(Substring(a01Refs{7};1;3))))  `double check by comparing subfile & 1st 3 chars of Ref
							If (($_t_SubTableName=a01Refs{8}) & ((Substring:C12($_t_LayoutDefinitionsReference; 1; 3))=(Substring:C12(a01Refs{6}; 1; 3))))  //double check by comparing subfile & 1st 3 chars of Ref
								$_l_FillLevel:=1
							End if 
						End if 
					End if 
					If (($_l_FillLevel=0) & (vALLevels>1))
						If ($8=a02Refs{9}) | (Not:C34($_bo_AddLevel))  //Plural Name
							//If (($_t_SubTableName=a02Refs{8}) & ((Substring($_t_LayoutDefinitionsReference;1;3))=(Substring(a02Refs{7};1;3))))
							If (($_t_SubTableName=a02Refs{8}) & ((Substring:C12($_t_LayoutDefinitionsReference; 1; 3))=(Substring:C12(a02Refs{6}; 1; 3))))
								$_l_FillLevel:=2
							End if 
						End if 
						If (($_l_FillLevel=0) & (vALLevels>2))
							If ($8=a03Refs{9}) | (Not:C34($_bo_AddLevel))
								//If (($_t_SubTableName=a03Refs{8}) & ((Substring($_t_LayoutDefinitionsReference;1;3))=(Substring(a03Refs{7};1;3))))
								If (($_t_SubTableName=a03Refs{8}) & ((Substring:C12($_t_LayoutDefinitionsReference; 1; 3))=(Substring:C12(a03Refs{6}; 1; 3))))
									$_l_FillLevel:=3
								End if 
							End if 
							If (($_l_FillLevel=0) & (vALLevels>3))
								If ($8=a04Refs{9}) | (Not:C34($_bo_AddLevel))
									//If (($_t_SubTableName=a04Refs{8}) & ((Substring($_t_LayoutDefinitionsReference;1;3))=(Substring(a04Refs{7};1;3))))
									If (($_t_SubTableName=a04Refs{8}) & ((Substring:C12($_t_LayoutDefinitionsReference; 1; 3))=(Substring:C12(a04Refs{6}; 1; 3))))
										$_l_FillLevel:=4
									End if 
								End if 
								If (($_l_FillLevel=0) & (vALLevels>4))
									If ($8=a05Refs{9}) | (Not:C34($_bo_AddLevel))
										//If (($_t_SubTableName=a05Refs{8}) & ((Substring($_t_LayoutDefinitionsReference;1;3))=(Substring(a05Refs{7};1;3))))
										If (($_t_SubTableName=a05Refs{8}) & ((Substring:C12($_t_LayoutDefinitionsReference; 1; 3))=(Substring:C12(a05Refs{6}; 1; 3))))
											$_l_FillLevel:=5
										End if 
									End if 
									If (($_l_FillLevel=0) & (vALLevels>5))
										If ($8=a06Refs{9}) | (Not:C34($_bo_AddLevel))
											//If (($_t_SubTableName=a06Refs{8}) & ((Substring($_t_LayoutDefinitionsReference;1;3))=(Substring(a06Refs{7};1;3))))
											If (($_t_SubTableName=a06Refs{8}) & ((Substring:C12($_t_LayoutDefinitionsReference; 1; 3))=(Substring:C12(a06Refs{6}; 1; 3))))
												$_l_FillLevel:=6
											End if 
										End if 
									End if 
								Else 
									For ($_l_LevelsIndex; 6; vALLevels)
										If ($_l_LevelsIndex<10)
											$_ptr_Variable:=Get pointer:C304("a0"+String:C10($_l_LevelsIndex)+"Refs")
										Else 
											$_ptr_Variable:=Get pointer:C304("a"+String:C10($_l_LevelsIndex)+"Refs")
										End if 
										If (Not:C34(Is nil pointer:C315($_ptr_Variable)))
											If (Size of array:C274($_ptr_Variable->)>9)
												
												If ($8=$_ptr_Variable->{9}) | (Not:C34($_bo_AddLevel))  // | (Size of array($1->)=0)
													If (($_t_SubTableName=$_ptr_Variable->{8}) & ((Substring:C12($_t_LayoutDefinitionsReference; 1; 3))=(Substring:C12($_ptr_Variable->{6}; 1; 3))))  //double check by comparing subfile & 1st 3 chars of Ref
														$_l_FillLevel:=$_l_LevelsIndex
														$_l_LevelsIndex:=99
													End if 
												End if 
											End if 
										End if 
									End for 
									
								End if 
							End if 
						End if 
					End if 
					If ($_l_FillLevel=0)
						vALLevels:=vALLevels+1
						$_l_FillLevel:=vALLevels
					End if 
				End if 
			Else 
				vALLevels:=vALLevels+1
				$_l_FillLevel:=vALLevels
			End if 
	End case 
	LB_bo_ForceLevel:=False:C215  //always set back to false
	If (Count parameters:C259>=10)
		If ($10#"")
			$_t_CurrentDefintionsOwner:=$10
		Else 
			$_t_CurrentDefintionsOwner:=<>PER_t_CurrentUserInitials
		End if 
	Else 
		$_t_CurrentDefintionsOwner:=<>PER_t_CurrentUserInitials
	End if 
	
	$_t_Ref:=("0"*Num:C11($_l_FillLevel<10))+String:C10($_l_FillLevel)
	OK:=1
	
	If (Not:C34(LB_bo_DefLevel))
		If (False:C215)
			//LBi_ArrDef01 
			LBI_ArrayDefPic(99)
			LBI_arrayDefTime(99)
			// /LBi_ArrDef02 
			
			//LBi_ArrDef03 
			
			//LBi_ArrDef04 
			
			//LBi_ArrDef05 
			
			//LBi_ArrDef06 
			For ($_l_index; 1; 99)
				LBI_AddDef07to99($_l_index)
			End for 
		End if 
		
		
		
		
		LB_bo_DefLevel:=True:C214
	End if 
	Case of 
		: ($_l_FillLevel=1)
			//LBi_ArrDef01 
			LBI_AddDef07to99(1)
			LBI_ArrayDefPic(1)
			LBI_arrayDefTime(1)
		: ($_l_FillLevel=2)
			//LBi_ArrDef02 
			LBI_AddDef07to99(2)
			LBI_ArrayDefPic(2)
			LBI_arrayDefTime(2)
		: ($_l_FillLevel=3)
			//LBi_ArrDef03 
			LBI_AddDef07to99(3)
			LBI_ArrayDefPic(3)
			LBI_arrayDefTime(3)
		: ($_l_FillLevel=4)
			//LBi_ArrDef04 
			LBI_AddDef07to99(4)
			LBI_ArrayDefPic(4)
			LBI_arrayDefTime(4)
		: ($_l_FillLevel=5)
			//LBi_ArrDef05 
			LBI_AddDef07to99(5)
			LBI_ArrayDefPic(5)
			LBI_arrayDefTime(5)
		: ($_l_FillLevel=6)
			//LBi_ArrDef06 
			LBI_AddDef07to99(6)
			LBI_ArrayDefPic(6)
			LBI_arrayDefTime(6)
			
		Else 
			LBI_AddDef07to99($_l_FillLevel)
			LBI_ArrayDefPic($_l_FillLevel)
			LBI_arrayDefTime($_l_FillLevel)
	End case 
	
	
	
	
	$_l_AreaType:=Num:C11($_bo_TableBased)+2  // 3 for table based 2 for array based-will get changed to -1 if array based on arrays
	If ($_l_FillLevel<10)
		$_ptr_ReferenceArray:=Get pointer:C304("a0"+String:C10($_l_FillLevel)+"Refs")
		$_ptr_ListboxType:=Get pointer:C304("DB_l_0"+String:C10($_l_FillLevel)+"Areatype")
		$_ptr_HightlightSet:=Get pointer:C304("DB_T_0"+String:C10($_l_FillLevel)+"HighlightSet")
	Else 
		$_ptr_ReferenceArray:=Get pointer:C304("a"+String:C10($_l_FillLevel)+"Refs")
		$_ptr_ListboxType:=Get pointer:C304("DB_l_"+String:C10($_l_FillLevel)+"Areatype")
		$_ptr_HightlightSet:=Get pointer:C304("DB_T_"+String:C10($_l_FillLevel)+"HighlightSet")
		
	End if 
	If (Count parameters:C259>=13)
		$_t_HightlightSetName:=$13
	Else 
		$_t_HightlightSetName:=""
	End if 
	$_ptr_HightlightSet->:=$_t_HightlightSetName
	
	$_ptr_ListboxType->:=$_l_AreaType
	//If ($_l_FillLevel<7)
	
	
	
	//End if
	
	LBi_ArrayFillp($_l_FillLevel; $_ptr_ListboxSetup; $_ptr_ListboxArea; $3; $4; $_ptr_ListboxType; $_ptr_HightlightSet)
	
	LBi_ArrayFillT($_ptr_ReferenceArray; 0; $_t_Ref; ""; ""; $5; $6; $_t_LayoutDefinitionsReference; $_t_CurrentDefintionsOwner; $_t_SubTableName; $8; $9; "")
	
	LB_bo_DefLevel:=True:C214
	
	If (OK=1)
		While (Semaphore:C143("AL"+$_t_LayoutDefinitionsReference))  //here in case ALStartBack is doing its thing
			DelayTicks(45)
		End while 
		LBi_InclFields($_ptr_ListboxSetup; True:C214)
		CLEAR SEMAPHORE:C144("AL"+$_t_LayoutDefinitionsReference)
	End if 
	If (($5="2@") & (<>LB_at_EditModes#2))
		<>LB_at_EditModes:=2
		
		//GET PICTURE FROM LIBRARY(20260; <>LB_pic_ModePicture)
		<>LB_pic_ModePicture:=Get_Picture(20260)
		
	Else 
		If (($5="4@") & (<>LB_at_EditModes#1))
			<>vALMode:=1
			//GET PICTURE FROM LIBRARY(20261; <>LB_pic_ModePicture)
			<>LB_pic_ModePicture:=Get_Picture(20261)
			
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("LBi_ArrDefFill"; $_t_oldMethodName)
