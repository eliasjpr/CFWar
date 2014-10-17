<cfscript>
function QueryToArray(theQuery){
    var theArray = arraynew(1);
    var cols = ListtoArray(theQuery.columnlist);
    var row = 1;
    var thisRow = "";
    var col = 1;
    for(row = 1; row LTE theQuery.recordcount; row = row + 1){
        thisRow = structnew();
        for(col = 1; col LTE arraylen(cols); col = col + 1){
            thisRow[cols[col]] = theQuery[cols[col]][row];
        }
        arrayAppend(theArray,duplicate(thisRow));
    }
    return(theArray);
}

function roundUpByteSize(size) {
    if (size lt 1024) return "#size# b";
    if (size lt 1024^2) return "#round(size / 1024)# Kb";
    if (size lt 1024^3) return "#decimalFormat(size/1024^2)# Mb";
    return "#decimalFormat(size/1024^3)# Gb";
}



function getSystemMemoryUsage(){
    return ceiling((getSystemTotalMemory()-getSystemFreeMemory())/getSystemTotalMemory()*100);
}

function getSystemMemoryUsage(){
    return ceiling((getSystemTotalMemory()-getSystemFreeMemory())/getSystemTotalMemory()*100);
}

function getSystemMemoryFree(){
    return ceiling((getSystemFreeMemory())/getSystemTotalMemory()*100);
}
</cfscript>