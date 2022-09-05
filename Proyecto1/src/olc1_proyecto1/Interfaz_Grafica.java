/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JFrame.java to edit this template
 */
package olc1_proyecto1;

import analizadores.Analizador_Lexico;
import analizadores.Analizador_sintactico;
import analizadores.TError;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JFileChooser;
import javax.swing.JOptionPane;
import static javax.swing.JOptionPane.WARNING_MESSAGE;
import javax.swing.JTextArea;
import javax.swing.filechooser.FileNameExtensionFilter;

/**
 *
 * @author andreramirez
 */
public class Interfaz_Grafica extends javax.swing.JFrame {
FileReader fr;
BufferedReader br;
File archivo;
String contenido = " ";
Analizador_Lexico lexico;
Analizador_sintactico sintactico;
ArrayList ExpRegex = new ArrayList();
//String contenido = "", NombreArchivo;
public static LinkedList<TError> ErroresLex;
public static LinkedList<TError> ErroresSintact;
boolean Errores = true;
String path="";//creamos una variable global para guardar el path
    /**
     * Creates new form Interfaz_Grafica
     */
    public Interfaz_Grafica() {
        initComponents();
        setTitle("Project 1 OLC1");
        setLocationRelativeTo(null);
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jMenuBar2 = new javax.swing.JMenuBar();
        jMenu3 = new javax.swing.JMenu();
        jMenu4 = new javax.swing.JMenu();
        jMenuItem1 = new javax.swing.JMenuItem();
        jPanel1 = new javax.swing.JPanel();
        lbl_name = new javax.swing.JLabel();
        lbl_errors = new javax.swing.JLabel();
        golang_code = new javax.swing.JToggleButton();
        python_code = new javax.swing.JToggleButton();
        btn_clean = new javax.swing.JToggleButton();
        btn_run = new javax.swing.JToggleButton();
        jScrollPane1 = new javax.swing.JScrollPane();
        cajatexto = new javax.swing.JTextArea();
        jMenuBar1 = new javax.swing.JMenuBar();
        jMenu1 = new javax.swing.JMenu();
        openfile = new javax.swing.JMenuItem();
        save = new javax.swing.JMenuItem();
        jMenu2 = new javax.swing.JMenu();
        r_flowchart = new javax.swing.JMenuItem();
        r_errors = new javax.swing.JMenuItem();
        jMenu5 = new javax.swing.JMenu();
        user_manual = new javax.swing.JMenuItem();
        technical_manual = new javax.swing.JMenuItem();

        jMenu3.setText("File");
        jMenuBar2.add(jMenu3);

        jMenu4.setText("Edit");
        jMenuBar2.add(jMenu4);

        jMenuItem1.setText("jMenuItem1");

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        lbl_name.setText("OLC1_2S_2022 202010816");

        lbl_errors.setText("0 Errors");

        golang_code.setText("View Code Golang");
        golang_code.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                golang_codeActionPerformed(evt);
            }
        });

        python_code.setText("View Code Python");

        btn_clean.setForeground(new java.awt.Color(0, 0, 0));
        btn_clean.setText("Clean");
        btn_clean.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btn_cleanActionPerformed(evt);
            }
        });

        btn_run.setBackground(new java.awt.Color(0, 0, 0));
        btn_run.setForeground(new java.awt.Color(0, 153, 0));
        btn_run.setText("Run");
        btn_run.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btn_runActionPerformed(evt);
            }
        });

        cajatexto.setColumns(20);
        cajatexto.setRows(5);
        jScrollPane1.setViewportView(cajatexto);

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel1Layout.createSequentialGroup()
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGap(38, 38, 38)
                        .addComponent(lbl_errors)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(golang_code)
                        .addGap(18, 18, 18)
                        .addComponent(python_code))
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addContainerGap()
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                            .addComponent(jScrollPane1)
                            .addGroup(jPanel1Layout.createSequentialGroup()
                                .addGap(0, 803, Short.MAX_VALUE)
                                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                                    .addGroup(jPanel1Layout.createSequentialGroup()
                                        .addComponent(btn_clean)
                                        .addGap(18, 18, 18)
                                        .addComponent(btn_run))
                                    .addComponent(lbl_name))))))
                .addGap(27, 27, 27))
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(lbl_name)
                .addGap(18, 18, 18)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(btn_clean)
                    .addComponent(btn_run))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 553, Short.MAX_VALUE)
                .addGap(18, 18, 18)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(lbl_errors)
                    .addComponent(golang_code)
                    .addComponent(python_code))
                .addGap(16, 16, 16))
        );

        jMenu1.setText("File");

        openfile.setText("Open file");
        openfile.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                openfileActionPerformed(evt);
            }
        });
        jMenu1.add(openfile);

        save.setText("Save as");
        save.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                saveActionPerformed(evt);
            }
        });
        jMenu1.add(save);

        jMenuBar1.add(jMenu1);

        jMenu2.setText("Report");

        r_flowchart.setText("Flowcharts");
        jMenu2.add(r_flowchart);

        r_errors.setText("Errors");
        r_errors.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                r_errorsActionPerformed(evt);
            }
        });
        jMenu2.add(r_errors);

        jMenuBar1.add(jMenu2);

        jMenu5.setText("View");

        user_manual.setText("User manual");
        user_manual.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                user_manualActionPerformed(evt);
            }
        });
        jMenu5.add(user_manual);

        technical_manual.setText("Technical manual");
        jMenu5.add(technical_manual);

        jMenuBar1.add(jMenu5);

        setJMenuBar(jMenuBar1);

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void btn_cleanActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btn_cleanActionPerformed
        cajatexto.setText("");
    }//GEN-LAST:event_btn_cleanActionPerformed

    private void golang_codeActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_golang_codeActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_golang_codeActionPerformed

    private void openfileActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_openfileActionPerformed
        leerArchivos();
    }//GEN-LAST:event_openfileActionPerformed

    private void user_manualActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_user_manualActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_user_manualActionPerformed

    private void saveActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_saveActionPerformed
        guardar();
    }//GEN-LAST:event_saveActionPerformed

    private void btn_runActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btn_runActionPerformed
        // TODO add your handling code here:
        String contenido = cajatexto.getText();
        if (contenido != "") {
            try {
            lexico = new Analizador_Lexico(new BufferedReader(new FileReader(archivo)));
            sintactico = new Analizador_sintactico(lexico);
            sintactico.parse();

            if (sintactico.errores.size() > 0) {
                contenido = "";
                JOptionPane.showMessageDialog(this, "GENERANDO REPORTE DE ERRORES", "ERROR ENCONTRADO", WARNING_MESSAGE);
                ReporteErrores();
                Errores = true;
            } else {
                ReporteErrores();
                Errores = false;
                ErroresLex = lexico.errores;
                ErroresSintact = sintactico.errores;
                //CONJUNTOS = sintactico.CONJUNTOS;
                //EXPRESIONES = sintactico.EXPRESIONES;
                //PRUEBAS = sintactico.PRUEBAS;
                //GuardarPolaca(); */

                JOptionPane.showMessageDialog(this, "ANALISIS COMPLETADO", "SIN ERRORES ENCONTRADOS", WARNING_MESSAGE);
                //GenAutomata.setEnabled(true);
            }
        } catch (Exception e) {
        }
            } else {
                JOptionPane.showMessageDialog(this, "INGRESE ARCHIVO EXP", "ADVERTENCIA", WARNING_MESSAGE);
            }
        
        
        
        
    }//GEN-LAST:event_btn_runActionPerformed

    private void r_errorsActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_r_errorsActionPerformed
        // TODO add your handling code here:
        ReporteErrores();
        
    }//GEN-LAST:event_r_errorsActionPerformed

    public void leerArchivos() {
        try {
            JFileChooser f = new JFileChooser();
            f.setFileFilter(new FileNameExtensionFilter("File *.olc", "olc","OLC"));
            int op = f.showOpenDialog(this);
            if (op == JFileChooser.APPROVE_OPTION) {
                System.out.println(f.getSelectedFile());
                archivo = f.getSelectedFile();
                JOptionPane.showMessageDialog(null,"Cargado con exito!", "Carga Exitosa!", JOptionPane.INFORMATION_MESSAGE);
            }
            fr = new FileReader(archivo);
            br = new BufferedReader(fr);
            String linea;

            while ((linea = br.readLine()) != null) {
                contenido += linea;
                cajatexto.append(linea + "\n");
                
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (null != fr) {
                    fr.close();
                }
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }
    }
    
    
   
public void guardar(){
    String texto = cajatexto.getText();//variable para comparacion
        
        if (texto.matches("[[ ]*[\n]*[\t]]*")) {
            JOptionPane.showMessageDialog(null,"No hay texto para guardar!", "Oops! Error", JOptionPane.ERROR_MESSAGE);
        }else{
            
            JFileChooser fileChooser = new JFileChooser();
            fileChooser.addChoosableFileFilter(new FileNameExtensionFilter("Archivos *.OLC", "olc","OLC"));//filtro para ver solo archivos .edu
            int seleccion = fileChooser.showSaveDialog(null);
            try{
                if (seleccion == JFileChooser.APPROVE_OPTION){//comprueba si ha presionado el boton de aceptar
                    File JFC = fileChooser.getSelectedFile();
                    String PATH = JFC.getAbsolutePath();//obtenemos el path del archivo a guardar
                    PrintWriter printwriter = new PrintWriter(JFC);
                    printwriter.print(cajatexto.getText());//escribe en el archivo todo lo que se encuentre en el JTextArea
                    printwriter.close();//cierra el archivo
                    
                    //comprobamos si a la hora de guardar obtuvo la extension y si no se la asignamos
                    if(!(PATH.endsWith(".olc"))){
                        File temp = new File(PATH+".olc");
                        JFC.renameTo(temp);//renombramos el archivo
                    }
                    
                    JOptionPane.showMessageDialog(null,"Guardado exitoso!", "Guardado exitoso!", JOptionPane.INFORMATION_MESSAGE);
                }
            }catch (Exception e){//por alguna excepcion salta un mensaje de error
                JOptionPane.showMessageDialog(null,"Error al guardar el archivo!", "Oops! Error", JOptionPane.ERROR_MESSAGE);
            }
        } 
}


public void ReporteErrores() {
        FileWriter Reporte = null;
        PrintWriter pw = null;
        try {
            Reporte = new FileWriter("REPORTE DE ERRORES.html");
            pw = new PrintWriter(Reporte);
            pw.println("<html>");
            pw.println("<head>");
            pw.println("<meta charset=\"UTF-8\">");
            pw.println("<link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css\" rel=\"stylesheet\" integrity=\"sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3\" crossorigin=\"anonymous\">");
            pw.println("<title> REPORTE DE ERRORES </title>");
            pw.println("</head>");
            pw.println("<body>");
            pw.println("<center>");
            pw.println("<h1>  REPORTE ERRORES </h1>");
            pw.println("<table class=\"table table-dark table-hover\">");
            pw.println("<tbody>");

            pw.println("<td>Num</td>");
            pw.println("<td>Lexema</td>");
            pw.println("<td>Fila</td>");
            pw.println("<td>Columna</td>");
            pw.println("<td>Descripcion</td>");
            pw.println("<td>Tipo</td>");
            int c = 0;
            for (int i = 0; i < lexico.errores.size(); i++) {
                pw.println("<tr>");

                pw.println("<td>" + i + "</td>");
                pw.println("<td>" + lexico.errores.get(i).getLexema() + "</td>");
                pw.println("<td>" + lexico.errores.get(i).getLine() + "</td>");
                pw.println("<td>" + lexico.errores.get(i).getColumn() + "</td>");
                pw.println("<td>" + lexico.errores.get(i).getDescripcion() + "</td>");
                pw.println("<td>LEXICO</td>");
                pw.println("</tr>");
                c = i;
            }
            for (int i = 0; i < lexico.errores.size(); i++) {
                System.out.println(lexico.errores.get(i).show());
            }
            for (int i = 0; i < sintactico.errores.size(); i++) {
                c++;
                pw.println("<tr>");
                pw.println("<td>" + c + "</td>");
                pw.println("<td>" + sintactico.errores.get(i).getLexema() + "</td>");
                pw.println("<td>" + sintactico.errores.get(i).getLine() + "</td>");
                pw.println("<td>" + sintactico.errores.get(i).getColumn() + "</td>");
                pw.println("<td>" + sintactico.errores.get(i).getDescripcion() + "</td>");
                pw.println("<td>SINTACTICO</td>");
                pw.println("</tr>");
            }

            pw.println("</tbody>");
            pw.println("</table>");
            pw.println("</center>");
            pw.println("</body>");
            pw.println("</HTML>");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (null != Reporte) {
                    Reporte.close();
                    System.out.println("REPORTE ERRORES GENERADOS");
                }
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }
    }
  
    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(Interfaz_Grafica.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(Interfaz_Grafica.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(Interfaz_Grafica.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(Interfaz_Grafica.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new Interfaz_Grafica().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JToggleButton btn_clean;
    private javax.swing.JToggleButton btn_run;
    private javax.swing.JTextArea cajatexto;
    private javax.swing.JToggleButton golang_code;
    private javax.swing.JMenu jMenu1;
    private javax.swing.JMenu jMenu2;
    private javax.swing.JMenu jMenu3;
    private javax.swing.JMenu jMenu4;
    private javax.swing.JMenu jMenu5;
    private javax.swing.JMenuBar jMenuBar1;
    private javax.swing.JMenuBar jMenuBar2;
    private javax.swing.JMenuItem jMenuItem1;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JLabel lbl_errors;
    private javax.swing.JLabel lbl_name;
    private javax.swing.JMenuItem openfile;
    private javax.swing.JToggleButton python_code;
    private javax.swing.JMenuItem r_errors;
    private javax.swing.JMenuItem r_flowchart;
    private javax.swing.JMenuItem save;
    private javax.swing.JMenuItem technical_manual;
    private javax.swing.JMenuItem user_manual;
    // End of variables declaration//GEN-END:variables
}
