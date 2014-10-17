component{

  function init(){ return this; }

  /**
  * Get the name of the reporter
  */
  function getName(){
    return "JSON";
  }

  /**
  * Do the reporting thing here using the incoming test results
  * The report should return back in whatever format they desire and should set any
  * Specifc browser types if needed.
  * @results.hint The instance of the TestBox TestResult object to build a report on
  * @testbox.hint The TestBox core object
  * @options.hint A structure of options this reporter needs to build the report with
  */
  any function runReport(
    required coldbox.system.TestResult results,
    required coldbox.system.TestBox testbox,
    struct options={}
  ){
    getPageContext().getResponse().setContentType( "application/json" );
    return serializeJSON( arguments.results.getMemento() );
  }

}