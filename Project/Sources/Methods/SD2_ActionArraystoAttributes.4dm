//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_ActionArraystoAttributes
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_Data; 0)
	//ARRAY LONGINT(SD2_al_ActionREALFieldNum;0)
	//ARRAY LONGINT(SD2_al_ActionVirtFieldDataLong;0)
	//ARRAY LONGINT(SD2_al_ActionVirtFieldDataMANY;0)
	//ARRAY LONGINT(SD2_al_ActionVirtFieldNum;0)
	//ARRAY LONGINT(SD2_al_ActionVirtFieldType;0)
	//ARRAY REAL(SD2_ar_ActionVirtFieldDataREAL;0)
	ARRAY TEXT:C222($_at_Data; 0)
	//ARRAY TEXT(SD2_at_ActionVirtFieldDataMA;0)
	//ARRAY TEXT(SD2_at_ActionVirtFieldDataTXT;0)
	//ARRAY TEXT(SD2_at_ActionVirtFieldName;0)
	C_LONGINT:C283($_l_Index; $_l_Index2; $_l_offset; $_l_VirtualFIeldNumber)
	C_OBJECT:C1216($_obj_DiaryAttributes)
	C_POINTER:C301($_ptr_Field)
	C_TEXT:C284($_t_oldMethodName; $_t_VirtualFIeldName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_ActionArraystoAttributes")
//this method will take the action attribute arrays and put them back into the [ACTIONS]xActionAttributes
//Make sure the virtual field list is loaded!
If (False:C215)
	$_l_offset:=0
	SET BLOB SIZE:C606([ACTIONS:13]xActionAttributes:11; 0)
	For ($_l_Index; 1; Size of array:C274(SD2_al_ActionVirtFieldNum))
		$_l_VirtualFIeldNumber:=SD2_al_ActionVirtFieldNum{$_l_Index}
		
		Case of 
			: (SD2_al_ActionVirtFieldType{$_l_VirtualFIeldNumber}=9)  // Longint one dimension
				VARIABLE TO BLOB:C532(SD2_al_ActionVirtFieldDataLong{$_l_VirtualFIeldNumber}; [ACTIONS:13]xActionAttributes:11; *)
				If (SD2_al_ActionREALFieldNum{$_l_VirtualFIeldNumber}>0)
					//this is a field in the table anyway so ALSO put the data  there
					$_ptr_Field:=Field:C253(Table:C252(->[ACTIONS:13]); SD2_al_ActionREALFieldNum{$_l_VirtualFIeldNumber})
					Case of 
						: (Type:C295($_ptr_Field->)=Is boolean:K8:9)
							$_ptr_Field->:=(SD2_al_ActionVirtFieldDataLong{$_l_VirtualFIeldNumber}=1)
						: (Type:C295($_ptr_Field->)=Is longint:K8:6)
							$_ptr_Field->:=SD2_al_ActionVirtFieldDataLong{$_l_VirtualFIeldNumber}
					End case 
				End if 
			: (SD2_al_ActionVirtFieldType{$_l_VirtualFIeldNumber}=21)  // String one dimension
				VARIABLE TO BLOB:C532(SD2_at_ActionVirtFieldDataTXT{$_l_VirtualFIeldNumber}; [ACTIONS:13]xActionAttributes:11; *)
				If (SD2_al_ActionREALFieldNum{$_l_VirtualFIeldNumber}>0)
					//this is a field in the table anyway so ALSO put the data  there
					
					$_ptr_Field:=Field:C253(Table:C252(->[ACTIONS:13]); SD2_al_ActionREALFieldNum{$_l_VirtualFIeldNumber})
					
					$_ptr_Field->:=SD2_at_ActionVirtFieldDataTXT{$_l_VirtualFIeldNumber}
					
				End if 
				
				
				
			: (SD2_al_ActionVirtFieldType{$_l_VirtualFIeldNumber}=2)  // TEXT one dimension
				VARIABLE TO BLOB:C532(SD2_at_ActionVirtFieldDataTXT{$_l_VirtualFIeldNumber}; [ACTIONS:13]xActionAttributes:11; *)
				
				If (SD2_al_ActionREALFieldNum{$_l_VirtualFIeldNumber}>0)
					//this is a field in the table anyway so ALSO put the data  there
					$_ptr_Field:=Field:C253(Table:C252(->[ACTIONS:13]); SD2_al_ActionREALFieldNum{$_l_VirtualFIeldNumber})
					$_ptr_Field->:=SD2_at_ActionVirtFieldDataTXT{$_l_VirtualFIeldNumber}
					
				End if 
				
				
			: (SD2_al_ActionVirtFieldType{$_l_VirtualFIeldNumber}=1)  // Real one dimension
				VARIABLE TO BLOB:C532(SD2_ar_ActionVirtFieldDataREAL{$_l_VirtualFIeldNumber}; [ACTIONS:13]xActionAttributes:11; *)
				If (SD2_ar_ActionVirtFieldDataREAL{$_l_VirtualFIeldNumber}=0)
					If (SD2_al_ActionREALFieldNum{$_l_VirtualFIeldNumber}>0)
						//this is a field in the table anyway so get the data from there
						$_ptr_Field:=Field:C253(Table:C252(->[ACTIONS:13]); SD2_al_ActionREALFieldNum{$_l_VirtualFIeldNumber})
						$_ptr_Field->:=SD2_ar_ActionVirtFieldDataREAL{$_l_VirtualFIeldNumber}
					End if 
					
				End if 
				
				
			: (SD2_al_ActionVirtFieldType{$_l_VirtualFIeldNumber}=116)  // Longint TWO dimension
				//These are all virtual-its actually a one diminsional array in the blob..it is an array so multiple values
				ARRAY LONGINT:C221($_al_Data; Size of array:C274(SD2_al_ActionVirtFieldDataMANY{$_l_VirtualFIeldNumber}))
				For ($_l_Index2; 1; Size of array:C274($_al_Data))
					$_al_Data{$_l_Index2}:=SD2_al_ActionVirtFieldDataMANY{$_l_VirtualFIeldNumber}{$_l_Index2}
				End for 
				VARIABLE TO BLOB:C532($_al_Data; [ACTIONS:13]xActionAttributes:11; *)
				
				
				
			: (SD2_al_ActionVirtFieldType{$_l_VirtualFIeldNumber}=121)  // String TWO dimension
				//These are all virtual
				ARRAY TEXT:C222($_at_Data; Size of array:C274(SD2_at_ActionVirtFieldDataMA{$_l_VirtualFIeldNumber}))
				For ($_l_Index2; 1; Size of array:C274($_at_Data))
					$_at_Data{$_l_Index2}:=SD2_at_ActionVirtFieldDataMA{$_l_VirtualFIeldNumber}{$_l_Index2}
				End for 
				VARIABLE TO BLOB:C532($_at_Data; [ACTIONS:13]xActionAttributes:11; *)
				
				
		End case 
		
		
		
	End for 
Else 
	
	
	
	For ($_l_Index; 1; Size of array:C274(SD2_al_ActionVirtFieldNum))
		$_l_VirtualFIeldNumber:=SD2_al_ActionVirtFieldNum{$_l_Index}
		$_t_VirtualFIeldName:=SD2_at_ActionVirtFieldName{$_l_Index}
		Case of 
			: (SD2_al_ActionVirtFieldType{$_l_VirtualFIeldNumber}=9)  // Longint one dimension
				OB SET:C1220($_obj_DiaryAttributes; $_t_VirtualFIeldName; SD2_al_ActionVirtFieldDataLong{$_l_VirtualFIeldNumber})
				If (SD2_al_ActionREALFieldNum{$_l_VirtualFIeldNumber}>0)
					//this is a field in the table anyway so ALSO put the data  there
					$_ptr_Field:=Field:C253(Table:C252(->[ACTIONS:13]); SD2_al_ActionREALFieldNum{$_l_VirtualFIeldNumber})
					Case of 
						: (Type:C295($_ptr_Field->)=Is boolean:K8:9)
							$_ptr_Field->:=(SD2_al_ActionVirtFieldDataLong{$_l_VirtualFIeldNumber}=1)
						: (Type:C295($_ptr_Field->)=Is longint:K8:6)
							$_ptr_Field->:=SD2_al_ActionVirtFieldDataLong{$_l_VirtualFIeldNumber}
					End case 
				End if 
			: (SD2_al_ActionVirtFieldType{$_l_VirtualFIeldNumber}=21)  // String one dimension
				OB SET:C1220($_obj_DiaryAttributes; $_t_VirtualFIeldName; SD2_at_ActionVirtFieldDataTXT{$_l_VirtualFIeldNumber})
				
				If (SD2_al_ActionREALFieldNum{$_l_VirtualFIeldNumber}>0)
					//this is a field in the table anyway so ALSO put the data  there
					$_ptr_Field:=Field:C253(Table:C252(->[ACTIONS:13]); SD2_al_ActionREALFieldNum{$_l_VirtualFIeldNumber})
					$_ptr_Field->:=SD2_at_ActionVirtFieldDataTXT{$_l_VirtualFIeldNumber}
					
				End if 
				
				
				
			: (SD2_al_ActionVirtFieldType{$_l_VirtualFIeldNumber}=2)  // TEXT one dimension
				OB SET:C1220($_obj_DiaryAttributes; $_t_VirtualFIeldName; SD2_at_ActionVirtFieldDataTXT{$_l_VirtualFIeldNumber})
				
				If (SD2_al_ActionREALFieldNum{$_l_VirtualFIeldNumber}>0)
					//this is a field in the table anyway so ALSO put the data  there
					$_ptr_Field:=Field:C253(Table:C252(->[ACTIONS:13]); SD2_al_ActionREALFieldNum{$_l_VirtualFIeldNumber})
					$_ptr_Field->:=SD2_at_ActionVirtFieldDataTXT{$_l_VirtualFIeldNumber}
				End if 
				
				
			: (SD2_al_ActionVirtFieldType{$_l_VirtualFIeldNumber}=1)  // Real one dimension
				OB SET:C1220($_obj_DiaryAttributes; $_t_VirtualFIeldName; SD2_ar_ActionVirtFieldDataREAL{$_l_VirtualFIeldNumber})
				If (SD2_ar_ActionVirtFieldDataREAL{$_l_VirtualFIeldNumber}=0)
					If (SD2_al_ActionREALFieldNum{$_l_VirtualFIeldNumber}>0)
						//this is a field in the table anyway so get the data from there
						$_ptr_Field:=Field:C253(Table:C252(->[ACTIONS:13]); SD2_al_ActionREALFieldNum{$_l_VirtualFIeldNumber})
						$_ptr_Field->:=SD2_ar_ActionVirtFieldDataREAL{$_l_VirtualFIeldNumber}
					End if 
					
				End if 
				
				
			: (SD2_al_ActionVirtFieldType{$_l_VirtualFIeldNumber}=116)  // Longint TWO dimension
				//These are all virtual-its actually a one diminsional array in the blob..it is an array so multiple values
				
				ARRAY LONGINT:C221($_al_Data; Size of array:C274(SD2_al_ActionVirtFieldDataMANY{$_l_VirtualFIeldNumber}))
				For ($_l_Index2; 1; Size of array:C274($_al_Data))
					$_al_Data{$_l_Index2}:=SD2_al_ActionVirtFieldDataMANY{$_l_VirtualFIeldNumber}{$_l_Index2}
				End for 
				
				OB SET ARRAY:C1227($_obj_DiaryAttributes; $_t_VirtualFIeldName; $_al_Data)
				
				
				
			: (SD2_al_ActionVirtFieldType{$_l_VirtualFIeldNumber}=121)  // String TWO dimension
				//These are all virtual
				ARRAY TEXT:C222($_at_Data; Size of array:C274(SD2_at_ActionVirtFieldDataMA{$_l_VirtualFIeldNumber}))
				For ($_l_Index2; 1; Size of array:C274($_at_Data))
					$_at_Data{$_l_Index2}:=SD2_at_ActionVirtFieldDataMA{$_l_VirtualFIeldNumber}{$_l_Index2}
				End for 
				
				OB SET ARRAY:C1227($_obj_DiaryAttributes; $_t_VirtualFIeldName; $_at_Data)
				
				
		End case 
		
		
		
	End for 
	[ACTIONS:13]AttributesObject:42:=OB Copy:C1225($_obj_DiaryAttributes)
	
	
	
End if 
ERR_MethodTrackerReturn("SD2_ActionArraystoAttributes"; $_t_oldMethodName)
