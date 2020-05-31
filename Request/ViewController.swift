//
//  ViewController.swift
//  Request
//
//  Created by Juan Bonforti on 30/05/2020.
//  Copyright © 2020 Juan Bonforti. All rights reserved.
//

import UIKit;
import WebKit;

class ViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Peticiones del tipo URLRequest
        let urlToShow = URL(string: "https://github.com/JDBONFOR?") // Esto devuelve un optional
        //webView.load(URLRequest(url: urlToShow!)) // por eso, destapo con el !
        
        // Peticiones del tipo REST con JSON.
        let requestToJSON = URLRequest(url: urlToShow!)
        
        // dataTask se ejecutara y devolvera el completationHandler
        // func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask
        // URLSession es Async
        let task = URLSession.shared.dataTask(with: requestToJSON){
            data, response, error in
            
            // data, es la respuesta del request
            // response, es el codigo HTTP
            // error, en caso que no se haya podido realizar
            
            if error == nil {
                let recivedData = NSString(data: data!, encoding: String.Encoding.utf8.rawValue);
                // print(recivedData!); // Al todo ir bien, y ser una peticion de pagina HTML, imprimimos todo el codigo HTML.
                
                // DispatchQueue cola principal de la interfaz de usuario.
                // main, es lo que esta viendo/escuchando, y hara que aparezcan en la vista.
                DispatchQueue.main.sync(execute:{
                    print(recivedData!)
                })
            }else{
                print(error!)
            }
            
        }
        task.resume(); // Ejecucion de la tarea.
        
        
        // Proceso/Process, programa/tarea es cargada en memoria e inicia su ejecucion.
        // Tarea/Task, instrucciones a seguir y cumplir.
        // Hilo/Thread: pedazos de instrucciones que puede ser ejecutada. Dicha taera puede ser ejecutad en 1 o mas hilos ,segun como se configura el procesador. Puede dividirse un mismo proceso.
        
        // Sync - Synchronous/Secuenciales, una tarea depende de la otra, no inica la 2da si no termina la 2da.
        // Async - Asynchronous/No secuenciales, una tarea no depende de la otra, pueden ejecutarse por separado/pausarse/reiniciarse
        
        
        
    }


}

