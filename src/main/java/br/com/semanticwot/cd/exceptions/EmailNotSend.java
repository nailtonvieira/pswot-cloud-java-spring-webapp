/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.semanticwot.cd.exceptions;

/**
 *
 * @author nailton
 */
public class EmailNotSend extends RuntimeException{
    public EmailNotSend(String message) {
        super(message);
    }
}
