
package aspectj_prog.pointcuts;

/**
 * A simple aspect that declares a <code>method call</code> pointcut.
 *
 *@author     <a href="mailto:Sara.Bouchenak@inria.fr">Sara Bouchenak</a>
 *@version    1.0 - 13/01/2004
 */
public aspect MethodCall
{
	
	/**
	 * A pointcut for any method call.
	 * 
	 */
	protected static pointcut methodCall() : 
		call (void *.*(..))
		&& !within(aspectj_prog.pointcuts.*);
	
	/**
	 * A pointcut for any method execution.
	 * 
	 */
	protected static pointcut methodExecute() : 
		execution(void *.*(..))
		&& !within(aspectj_prog.pointcuts.*);
	
	/**
	 * A pointcut for any class builder.
	 * 
	 */
	protected static pointcut classBuild() : 
		execution(*.new(..))
		&& !within(aspectj_prog.pointcuts.*);
	
	/**
	 * Declare a warning for any method call.
	 * 
	 */
	declare warning : methodCall() : "'methodCall' pointcut";
	
	/**
	 * Declare a warning for any method execution.
	 * 
	 */
	declare warning : methodExecute() : "'methodExecute' pointcut";
	
	/**
	 * Declare a warning for any class builder.
	 * 
	 */
	declare warning : classBuild() : "'classBuild' pointcut";

	
	/**
	 * Declare a warning for any class builder.
	 * 
	 */
	declare error: classBuild() : "'classBuild' pointcut error";
}