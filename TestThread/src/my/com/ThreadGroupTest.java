package my.com;

import java.io.IOException;
import java.util.Map;
import java.util.Set;

import javax.swing.JFrame;

public class ThreadGroupTest extends JFrame{
	
	class MyThread extends Thread{
		public MyThread(ThreadGroup gr, String name){
			super(gr,name);
		}
		public void run(){
			 
					System.out.println("작업 내용을 저장함 ");				
			
		}
	}
	
	public static void main(String[] args) throws IOException {
		
		ThreadGroupTest.MyThread mytr=new ThreadGroupTest().new MyThread(new ThreadGroup("mygroup"),"MyThread");
		mytr.setDaemon(true);
		
		mytr.start();
			
		Map<Thread, StackTraceElement[]> map=Thread.getAllStackTraces();
		
		Set<Thread> set=map.keySet();
		for(Thread tr:set){
			System.out.println(tr.getName()+": "+tr.isDaemon()
			+"\t소속 그룹: "+tr.getThreadGroup());
		}
		new ThreadGroupTest().setVisible(true);
		
		ThreadGroup tgroup=Thread.currentThread().getThreadGroup();
		System.out.println(tgroup);
		tgroup.list();
	}

}
